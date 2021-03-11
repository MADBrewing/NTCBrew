import 'dart:math';

// Source MyBrew
class BrewUtils {
  
  static double calcHeatingTimeInSeconds(double litres, double kwElement, double deltaTemp, double heatCapacity = 4.2, double estimatedLosses = 1.25) {
    return ((litres * heatCapacity * deltaTemp * estimatedLosses) / kwElement);
  }

  static Future<double> calcEPMAsync(double batchSize, double plato) async {
    return await Future.value(calcEPM(batchSize, plato));
  }
  
  /// Calculates Plato from specific density.
  /// It's called:
  /// When defining a recipe, the amount of malt is determined by weight.
  /// When switching SG / Brix / Plato units.
  /// Parameter Example: 1.048
  static double calcPlato(double sg) {
    return (-1 * 616.868) + (1111.14 * sg) - (630.272 * pow(sg, 2)) + (135.997 * pow(sg, 3));
  }

  static Future<double> calcPlatoAsync(double sg) async {
    return await Future.value(calcPlato(sg));
  }

  /// Calculates specific density from Plato.
  /// It's called:
  /// When defining a recipe, the percentage of malt is determined.
  /// When specifying density in Plato.
  /// When entering in Brix units.
  /// Example of parameter: 13%
  static double calcSG(double plato) {
    if (plato > 0) {
      return 1 + (plato / (258.6 - ((plato / 258.2) * 227.1)));
    } else {
      return 0.0;
    }
  }

  static Future<double> calcSGAsync(double plato) async {
    return await Future.value(calcSG(plato));
  }

  /// Calculates the estimated initial specific density from extract weight and wort volume.
  /// It's called:
  /// When defining a recipe, the amount of malt is determined by weight.
  /// Example of parameters: 2.7kg, 20l
  static double calcOG(double epm, double batchSize) {
    var x1 = (((epm * 100) / 0.9982) / batchSize);
    var x2 = sqrt(5157441 * pow(x1, 2) + 3863341130 * x1 + 445829967025) + 2271 * x1 + 667705;
    return x2 / 1335410;
  }

  static Future<double> calcOGAsync(double epm, double batchSize) async {
    return await Future.value(calcOG(epm, batchSize));
  }

  /// Calculates the weight of extract from wort volume and Plato.
  /// It's called:
  /// When defining a recipe, when the amount of malt is determined as a percentage.
  /// Example of parameters: 20l, 13%
  static double calcEPM(double batchSize, double plato) {
    var og = calcSG(plato);
    return 0.9982 * batchSize * og * (plato / 100);
  }

  static Future<double> calcEPMAsync(double batchSize, double plato) async {
    return await Future.value(calcEPM(batchSize, plato));
  }

  /// Calculates extract weight from average extractivity, malt weight and brewhouse efficiency.
  /// It's called:
  /// When defining a recipe, the amount of malt is determined by weight.
  /// Example of parameters: 78%, 5kg, 75%}
  static double calcEPM2(double avgExtr, double weightOfMalt, double efficiency) {
    return weightOfMalt * (avgExtr / 100) * (efficiency / 100);
  }

  static Future<double> calcEPM2Async(double avgExtr, double weightOfMalt, double efficiency) async {
    return await Future.value(calcEPM2(avgExtr, weightOfMalt, efficiency));
  }

  /// {Calculates efficiency from average extractivity, malt weight, wort volume and density.
  /// It's called:
  /// When defining a recipe.
  /// Example of parameters: 78%, 5kg, 25l, 1.050}
  static double calcEfficiency(double avgExtr, double weightOfMalt, double batchSize, double og) {
    var plato = calcPlato(og);
    var epm = calcEPM(batchSize, plato);

    return (10000 * epm) / (avgExtr * weightOfMalt);
  }

  static Future<double> calcEfficiencyAsync(double avgExtr, double weightOfMalt, double batchSize, double og) async {
    return await Future.value(calcEfficiency(avgExtr, weightOfMalt, batchSize, og));
  }

  /// Calculates the final Brix value from the initial Brix value and the specific density after fermentation.
  /// It's called:
  /// When switching SG / Brix / Plato units.
  /// Parameter Example: 13 ° Bx, 1.015
  static double calcBrixEnd(double brixStart, double fg) {
    return ((1000000 * fg + 2349 * brixStart - 1000000) / 6276);
  }

  static Future<double> calcBrixEndAsync(double brixStart, double fg) async {
    return await Future.value(calcBrixEnd(brixStart, fg));
  }

  /// Calculates specific density after fermentation from start and end Brix values.
  /// It's called:
  /// When entering the final value in Brix units.
  /// Example of parameters: 13 ° Bx, 7 ° Bx
  static double calcFG(double brixStart, double brixEnd) {
    return -0.002349 * brixStart + 0.006276 * brixEnd + 1;
  }

  static Future<double> calcFGAsync(double brixStart, double brixEnd) async {
    return await Future.value(calcFG(brixStart, brixEnd));
  }

  /// Calculates the estimated specific density after fermentation from the apparent fermentation of yeast.
  /// It's called:
  /// When defining a recipe.
  /// Example of parameters 1.048, 81%
  static double calcFG2(double og, double attenuation) {
    return og - (attenuation / 100) * (og - 1);
  }

  static Future<double> calcFG2Async(double og, double attenuation) async {
    return await Future.value(calcFG2(og, attenuation));
  }

  /// Calculates the estimated volume percent of alcohol from initial and final density.
  /// It's called:
  /// When defining a recipe.
  /// Example parameters: 1.053, 1.014
  static double calcABV(double og, double fg) {
    var x1 = 5118 * (pow(og, 2) - pow(fg, 2)) + 16755 * (fg - og);
    var x2 = 8.739 * pow(og, 4) - 57.22 * pow(og, 3) + 89.09 * pow(og, 2) + 14.95 * og - 105.99;
    return fg * (x1 / x2);
  }

  static Future<double> calcABVAsync(double og, double fg) async {
    return await Future.value(calcABV(og, fg));
  }

  /// Calculates EBC beers from wort volume, malt weight, and average malt EBC.
  /// It's called:
  /// When defining a recipe.
  /// Example of parameters: 23l, 4.7kg, 18
  static double calcEBC(double batchSize, double weightOfMalt, double avgMaltEBC) {
    var m = 4.236 * ((weightOfMalt * avgMaltEBC) / batchSize);
    return 2.9396 * pow(m, 0.6859);
  }

  static Future<double> calcEBCAsync(double batchSize, double weightOfMalt, double avgMaltEBC) async {
    return await Future.value(calcEBC(batchSize, weightOfMalt, avgMaltEBC));
  }
}
