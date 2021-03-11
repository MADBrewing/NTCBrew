import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ntcbrew/ui/formulas/FormWidgetProvider.dart';

abstract class FormulaController {

  StreamController<String> _controller = StreamController();
  StreamSink<String> get sink => _controller.sink;
  Stream<String> get stream => _controller.stream;

  List<Input> getWidgets(BuildContext context);
  
  initListeners();

  calculate();
 
  dispose() {
    _controller.close();
  }
}

class AbvController extends FormulaController {

  @override
  calculate() {
    // TODO: implement calculate
    throw UnimplementedError();
  }

  @override
  List<Input> getWidgets(BuildContext context) {
    // TODO: implement getWidgets
    throw UnimplementedError();
  }

  @override
  initListeners() {
    // TODO: implement initListeners
    throw UnimplementedError();
  }

}