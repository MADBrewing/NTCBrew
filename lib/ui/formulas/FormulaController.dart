import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ntcbrew/ui/formulas/FormWidgetProvider.dart';
import 'package:ntcbrew/utils/BrewUtils.dart';

abstract class FormulaController {
  final FormWidgetProvider widgetProvider = FormWidgetProvider();
  final StreamController<String> _controller = StreamController();

  StreamSink<String> get sink => _controller.sink;

  Stream<String> get stream => _controller.stream;
  late List<Input> _widgets;

  List<Input> createWidgets(BuildContext context);

  List<Input> getWidgets() => _widgets;

  initListeners() {
    _widgets.forEach((element) {
      element.textController.addListener(calculate);
    });
  }

  calculate();

  Input? getWidgetByType(FormulaInputType type) => _widgets.firstWhere((element) => element.type == type);

  double? getValueByType(FormulaInputType type) => getWidgetByType(type)?.getValue();

  @mustCallSuper
  dispose() {
    _controller.close();
    _widgets.forEach((widget) {
      widget.textController.dispose();
    });
  }

  static FormulaController of(FormulaControllerType type) {
    switch (type) {
      case FormulaControllerType.ABV:
        return AbvController();
      case FormulaControllerType.BRIX_END:
        return BrixEndController();
      case FormulaControllerType.EBC:
        return EbcController();
      case FormulaControllerType.EFFICIENCY:
        return EfficiencyController();
      case FormulaControllerType.EPM:
        return EpmController();
      case FormulaControllerType.FG:
        return FgController();
      case FormulaControllerType.FG2:
        return Fg2Controller();
      case FormulaControllerType.OG:
        return OgController();
      case FormulaControllerType.PLATO:
        return PlatoController();
      case FormulaControllerType.SG:
        return SgController();
      default:
        throw Exception("No controller for type $type");
    }
  }
}

enum FormulaControllerType { ABV, BRIX_END, EBC, EFFICIENCY, EPM, FG, FG2, OG, PLATO, SG }

class AbvController extends FormulaController {
  @override
  calculate() {
    double? og = getValueByType(FormulaInputType.OG);
    double? fg = getValueByType(FormulaInputType.FG);

    if (og != null && fg != null) {
      sink.add(BrewUtils.calcABV(og, fg).toStringAsFixed(2));
    } else {
      sink.add("-");
    }
  }

  @override
  List<Input> createWidgets(BuildContext context) => _widgets = [widgetProvider.og(context), widgetProvider.fg(context, action: TextInputAction.done)];
}

class BrixEndController extends FormulaController {
  @override
  calculate() {
    double? brixStart = getValueByType(FormulaInputType.BRIX_START);
    double? fg = getValueByType(FormulaInputType.FG);

    if (brixStart != null && fg != null) {
      sink.add(BrewUtils.calcBrixEnd(brixStart, fg).toStringAsFixed(2));
    } else {
      sink.add("-");
    }
  }

  @override
  List<Input> createWidgets(BuildContext context) => _widgets = [widgetProvider.brixStart(context), widgetProvider.fg(context, action: TextInputAction.done)];
}

class EbcController extends FormulaController {
  @override
  calculate() {
    double? batchSize = getValueByType(FormulaInputType.BATCH_SIZE);
    double? weightOfMalt = getValueByType(FormulaInputType.WEIGHT_OF_MALT);
    double? avgMaltEBC = getValueByType(FormulaInputType.AVG_MALT_EBC);

    if (batchSize != null && weightOfMalt != null && avgMaltEBC != null) {
      sink.add(BrewUtils.calcEBC(batchSize, weightOfMalt, avgMaltEBC).toStringAsFixed(2));
    } else {
      sink.add("-");
    }
  }

  @override
  List<Input> createWidgets(BuildContext context) =>
      _widgets = [widgetProvider.batchSize(context), widgetProvider.weightOfMalt(context), widgetProvider.avgMaltEBC(context, action: TextInputAction.done)];
}

class EfficiencyController extends FormulaController {
  @override
  calculate() {
    double? avgExtr = getValueByType(FormulaInputType.AVG_EXTR);
    double? weightOfMalt = getValueByType(FormulaInputType.WEIGHT_OF_MALT);
    double? batchSize = getValueByType(FormulaInputType.BATCH_SIZE);
    double? og = getValueByType(FormulaInputType.OG);

    if (batchSize != null && weightOfMalt != null && avgExtr != null && og != null) {
      sink.add(BrewUtils.calcEfficiency(avgExtr, weightOfMalt, batchSize, og).toStringAsFixed(2));
    } else {
      sink.add("-");
    }
  }

  @override
  List<Input> createWidgets(BuildContext context) => _widgets = [
        widgetProvider.avgExtr(context),
        widgetProvider.weightOfMalt(context),
        widgetProvider.batchSize(context),
        widgetProvider.og(context, action: TextInputAction.done)
      ];
}

class EpmController extends FormulaController {
  @override
  calculate() {
    double? batchSize = getValueByType(FormulaInputType.BATCH_SIZE);
    double? plato = getValueByType(FormulaInputType.PLATO);

    if (batchSize != null && plato != null) {
      sink.add(BrewUtils.calcEPM(batchSize, plato).toStringAsFixed(2));
    } else {
      sink.add("-");
    }
  }

  @override
  List<Input> createWidgets(BuildContext context) => _widgets = [widgetProvider.batchSize(context), widgetProvider.plato(context)];
}

class FgController extends FormulaController {
  @override
  calculate() {
    double? brixStart = getValueByType(FormulaInputType.BRIX_START);
    double? brixEnd = getValueByType(FormulaInputType.BRIX_END);

    if (brixStart != null && brixEnd != null) {
      sink.add(BrewUtils.calcFG(brixStart, brixEnd).toStringAsFixed(2));
    } else {
      sink.add("-");
    }
  }

  @override
  List<Input> createWidgets(BuildContext context) => _widgets = [widgetProvider.brixStart(context), widgetProvider.brixEnd(context, action: TextInputAction.done)];
}

class Fg2Controller extends FormulaController {
  @override
  calculate() {
    double? og = getValueByType(FormulaInputType.OG);
    double? attenuation = getValueByType(FormulaInputType.ATTENUATION);

    if (og != null && attenuation != null) {
      sink.add(BrewUtils.calcFG2(og, attenuation).toStringAsFixed(2));
    } else {
      sink.add("-");
    }
  }

  @override
  List<Input> createWidgets(BuildContext context) => _widgets = [widgetProvider.og(context), widgetProvider.attenuation(context, action: TextInputAction.done)];
}

class OgController extends FormulaController {
  @override
  calculate() {
    double? epm = getValueByType(FormulaInputType.EPM);
    double? batchSize = getValueByType(FormulaInputType.BATCH_SIZE);

    if (epm != null && batchSize != null) {
      sink.add(BrewUtils.calcOG(epm, batchSize).toStringAsFixed(2));
    } else {
      sink.add("-");
    }
  }

  @override
  List<Input> createWidgets(BuildContext context) => _widgets = [widgetProvider.epm(context), widgetProvider.batchSize(context, action: TextInputAction.done)];
}

class PlatoController extends FormulaController {
  @override
  calculate() {
    double? sg = getValueByType(FormulaInputType.SG);

    if (sg != null) {
      sink.add(BrewUtils.calcPlato(sg).toStringAsFixed(2));
    } else {
      sink.add("-");
    }
  }

  @override
  List<Input> createWidgets(BuildContext context) => _widgets = [widgetProvider.sg(context, action: TextInputAction.done)];
}

class SgController extends FormulaController {
  @override
  calculate() {
    double? plato = getValueByType(FormulaInputType.PLATO);

    if (plato != null) {
      sink.add(BrewUtils.calcSG(plato).toStringAsFixed(2));
    } else {
      sink.add("-");
    }
  }

  @override
  List<Input> createWidgets(BuildContext context) => _widgets = [widgetProvider.plato(context, action: TextInputAction.done)];
}
