import 'package:flutter/material.dart';
import 'package:ntcbrew/network/model/Board.dart';
import 'package:ntcbrew/network/repository/BoardRepository.dart';
import 'package:ntcbrew/ui/UiState.dart';
import 'package:ntcbrew/ui/brewing/board/args.dart';
import 'package:ntcbrew/ui/brewing/profile/ProfileListScreen.dart';
import 'package:ntcbrew/ui/widgets/empty.dart';
import 'package:ntcbrew/ui/widgets/error.dart';
import 'package:ntcbrew/ui/widgets/loading.dart';
import 'package:ntcbrew/utils/NTCUiStream.dart';
import 'package:ntcbrew/utils/SocketUtil.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

//TODO rewrite to brewing dashboard
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

class BrewingIntroBody extends StatefulWidget {
  static const route = "/brewing/intro";

  @override
  State<StatefulWidget> createState() => _BrewingIntroBody();
}

class _BrewingIntroBody extends State<BrewingIntroBody> {
  NTCUiStream<List<Board>>? ntcUiStream;

  @override
  Widget build(BuildContext context) {
    var boardRepository = Provider.of<BoardRepository>(context);
    if (ntcUiStream == null) {
      ntcUiStream = boardRepository.getBoards();
      ntcUiStream?.refresh();
    }

    return StreamBuilder(
      stream: ntcUiStream!.stream,
      builder: (BuildContext context, AsyncSnapshot<UiState<List<Board>>> snapshot) {
        if (!snapshot.hasData || snapshot.data?.status == UiStatus.LOADING) return _showLoading();
        if (snapshot.hasError) return _showError();
        if (snapshot.data?.data?.isEmpty == true) return _showEmptyView();
        return _createList(snapshot.data!.data!);
      },
    );
  }

  Widget _showLoading() => LoadingWidget();

  Widget _showError() => NtcErrorWidget(() => {
        ntcUiStream?.refresh(),
      });

  Widget _showEmptyView() => EmptyWidget(() => {
        ntcUiStream?.refresh(true),
      });

  Widget _createList(List<Board> data) => ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          Board board = data[index];
          return Card(
            child: ListTile(
              title: Text(board.name),
              subtitle: Text(board.model),
              onTap: () => {
                Navigator.of(context).pushNamed(ProfileListScreen.route, arguments: BoardScreenArgument(board.id)),
              },
            ),
          );
        },
      );

  @override
  void dispose() {
    ntcUiStream?.dispose();
    super.dispose();
  }
}
