import 'dart:async';

import 'package:ntcbrew/ui/UiState.dart';

class NTCUiStream<T> {

  late StreamController<UiState<T>> _controller;
  StreamSink<UiState<T>> get sink => _controller.sink;
  Stream<UiState<T>> get stream => _controller.stream;

  NTCUiStream() {
    _controller = StreamController();
  }

  getData(T fetchData) async {
    sink.add(UiState.loading());
    try {
      sink.add(UiState.complete(fetchData));
    } catch (e) {
      sink.add(UiState.error(ErrorState(e.toString())));
    }
  }

  dispose() {
    _controller.close();
  }
}