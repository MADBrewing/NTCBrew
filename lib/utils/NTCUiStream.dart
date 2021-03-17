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

  UiState<T>? _lastState;

  NTCUiStream<T> setAction(Future<T> Function() action) {
    _action = action;
    return this;
  }

  refresh([bool? force]) async {
    _loading();
    try {
      T completed;
      if(force == true || _lastState?.data == null) {
        completed = await _action();
      } else {
        completed = _lastState!.data!;
      }
      _success(completed);
    } catch (e) {
      print(e.toString());
      _error(e);
    }
  }

  bool hasData() {
    return _lastState?.data != null;
  }

  _loading() {
    _lastState = UiState.loading();
    _notifyState();
  }

  _success(T data) {
    _lastState = UiState.complete(data);
    _notifyState();
  }

  _error(Object e) {
    sink.addError(UiState.error(ErrorState(e.toString())));
  }

  _notifyState() {
    if(_lastState != null) {
      sink.add(_lastState!);
    }
  }

  dispose() {
    _controller.close();
  }
}
