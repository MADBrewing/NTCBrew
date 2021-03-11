import 'package:flutter/material.dart';
import 'package:ntcbrew/network/model/Board.dart';
import 'package:ntcbrew/network/repository/BoardRepository.dart';
import 'package:ntcbrew/ui/UiState.dart';
import 'package:ntcbrew/utils/NTCUiStream.dart';

class BrewingIntroScreen extends StatefulWidget {
  static const route = "/brewing/intro";

  @override
  State<StatefulWidget> createState() => _BrewingIntroScreen();
}

class _BrewingIntroScreen extends State<BrewingIntroScreen> {
  BoardRepository boardRepository = BoardRepository();
  late NTCUiStream<List<Board>> boards;

  @override
  void initState() {
    super.initState();
    boards = boardRepository.getBoards();
    boards.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            StreamBuilder<UiState<List<Board>>>(
              stream: boards.stream,
              builder: (BuildContext context, AsyncSnapshot<UiState<List<Board>>> snapshot) {
                if (!snapshot.hasData) {
                  return Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                switch (snapshot.data!.status) {
                  case UiStatus.SUCCESS:
                    return Expanded(
                        child: ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemCount: snapshot.data!.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                  child: ListTile(
                                title: Text(snapshot.data!.data![0].name),
                                subtitle: Text(snapshot.data!.data![0].model),
                              ));
                            }));
                  case UiStatus.ERROR:
                    return Text("Error");
                  case UiStatus.LOADING:
                    return Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    boards.dispose();
    super.dispose();
  }
}
