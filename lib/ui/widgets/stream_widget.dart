import 'package:flutter/material.dart';
import 'package:ntcbrew/ui/UiState.dart';

class NTCStreamBuilder<T> extends StreamBuilder<UiState<T>> {
  final Stream<UiState<T>> dataStream;

  NTCStreamBuilder(
      {required this.dataStream,
      required Widget noData,
      required Widget loading,
      required Widget Function(dynamic) error,
      required Widget Function(T) body})
      : super(
            stream: dataStream,
            builder: (BuildContext context, AsyncSnapshot<UiState<T>> snapshot) {
              if (!snapshot.hasData) return noData;
              if (snapshot.hasError) return error(snapshot.error);
              if (snapshot.data!.status == UiStatus.LOADING) return loading;
              T data = snapshot.data!.data!;
              if (data is List && data.isEmpty) return noData;
              return body(snapshot.data!.data! as T);
            });
}
