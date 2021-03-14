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
import 'package:ntcbrew/utils/Strings.dart';
import 'package:provider/provider.dart';

class BoardListScreen extends StatelessWidget {
  static const route = "/brewing/board/list";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getString(context, (res) => res?.board_title)),
      ),
      body: BoardListBody(),
    );
  }
}

class BoardListBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BoardListBody();
}

class _BoardListBody extends State<BoardListBody> {
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
