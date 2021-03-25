import 'package:flutter/material.dart';
import 'package:ntcbrew/utils/SocketUtil.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

class BrewingIntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamWidget();
  }
}

class StreamWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StreamWidget();
}

class _StreamWidget extends State<StreamWidget> {
  late IOWebSocketChannel channel;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: channel.stream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return Text("data: ${snapshot.data?.toString()}");
        });
  }

  @override
  void initState() {
    super.initState();
    channel = openSocket("livedata");
  }

  @override
  void dispose() {
    super.dispose();
    channel.sink.close(status.goingAway);
  }
}

