import 'dart:async';

import 'package:ntcbrew/ui/UiState.dart';

class NTCUiStream<T> {

  late StreamController<UiState<T>> _controller;
  StreamSink<UiState<T>> get sink => _controller.sink;
  Stream<UiState<T>> get stream => _controller.stream;

  NTCUiStream() {
    _controller = StreamController();
  }

  getData(Future<T> Function() data) async {
    loading();
    try {
      success(await data());
    } catch (e) {
      print(e.toString());
      error(e);
    }
  }

  loading() {
    sink.add(UiState.loading());
  }

  success(T data) {
    sink.add(UiState.complete(data));
  }

  error(Object e) {
    sink.add(UiState.error(ErrorState(e.toString())));
  }

  dispose() {
    _controller.close();
  }
}