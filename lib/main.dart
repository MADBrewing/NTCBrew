import 'package:flutter/material.dart';
import 'package:ntcbrew/network/model/Board.dart';
import 'package:ntcbrew/network/repository/BoardRepository.dart';
import 'package:ntcbrew/ui/UiState.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NTC Brew',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BoardRepository boardRepository = BoardRepository();
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Brewing',
      style: optionStyle,
    ),
    Text(
      'Index 1: Formulas',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      boardRepository.getBoards();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Container(
        child: Column(
          children: [
            StreamBuilder<UiState<List<Board>>>(
                stream: boardRepository.getBoardsController.stream,
                builder: (BuildContext context, AsyncSnapshot<UiState<List<Board>>> snapshot) {
                  if (!snapshot.hasData) {
                    return Text("Loading");
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
                      return Text("Loading");
                  }
                }),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Brewing',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Formulas',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    boardRepository.disposeAll();
  }
}
