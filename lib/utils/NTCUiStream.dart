import 'dart:async';

import 'package:ntcbrew/ui/UiState.dart';

class NTCUiStream<T> {

  static NTCUiStream<T> create<T>(Future<T> Function() action) {
    NTCUiStream<T> stream = NTCUiStream<T>();
    stream.setAction(() => action());
    return stream;
  }

  StreamController<UiState<T>> _controller = StreamController();
  StreamSink<UiState<T>> get sink => _controller.sink;
  Stream<UiState<T>> get stream => _controller.stream;

  NTCUiStream();

  late Future<T> Function() _action;

  NTCUiStream<T> setAction(Future<T> Function() action) {
    _action = action;
    return this;
  }

  start() async {
    _loading();
    try {
      var completed = await _action();
      _success(completed);
    } catch (e) {
      print(e.toString());
      _error(e);
    }
  }

  _loading() {
    sink.add(UiState.loading());
  }

  _success(T data) {
    sink.add(UiState.complete(data));
  }

  _error(Object e) {
    sink.add(UiState.error(ErrorState(e.toString())));
  }

  dispose() {
    _controller.close();
  }
}
