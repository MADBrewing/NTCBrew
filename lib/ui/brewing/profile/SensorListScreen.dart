import 'package:flutter/material.dart';
import 'package:ntcbrew/network/model/Board.dart';
import 'package:ntcbrew/network/model/Module.dart';
import 'package:ntcbrew/network/model/Profile.dart';
import 'package:ntcbrew/network/model/Sensor.dart';
import 'package:ntcbrew/network/repository/BoardRepository.dart';
import 'package:ntcbrew/network/repository/ProfileRepository.dart';
import 'package:ntcbrew/ui/UiState.dart';
import 'package:ntcbrew/ui/brewing/board/args.dart';
import 'package:ntcbrew/ui/widgets/empty.dart';
import 'package:ntcbrew/ui/widgets/error.dart';
import 'package:ntcbrew/ui/widgets/loading.dart';
import 'package:ntcbrew/utils/NTCUiStream.dart';
import 'package:ntcbrew/utils/Strings.dart';
import 'package:provider/provider.dart';

class SensorListScreen extends StatelessWidget {
  static const route = "/brewing/module/list";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getString(context, (res) => res?.screen_title)),
      ),
      body: SensorListBody(),
    );
  }
}

class SensorListBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SensorListBody();
}

class _SensorListBody extends State<SensorListBody> {
  NTCUiStream<List<Sensor>>? ntcUiStream;

  @override
  Widget build(BuildContext context) {
    var profileRepository = Provider.of<ProfileRepository>(context);
    if (ntcUiStream == null) {
      ntcUiStream = profileRepository.getSensors();
      ntcUiStream?.refresh();
    }

    return StreamBuilder(
      stream: ntcUiStream!.stream,
      builder: (BuildContext context, AsyncSnapshot<UiState<List<Sensor>>> snapshot) {
        if (!snapshot.hasData || snapshot.data?.status == UiStatus.LOADING) {
          return LoadingWidget();
        }

        if (snapshot.hasError) {
          return NtcErrorWidget(() => {
                ntcUiStream?.refresh(),
              });
        }

        if (snapshot.data?.data?.isEmpty == true) {
          return EmptyWidget(() => {
                ntcUiStream?.refresh(true),
              });
        }

        return createList(snapshot.data!.data!);
      },
    );
  }

  Widget createList(List<Sensor> data) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        Sensor module = data[index];
        return Card(
          child: ListTile(
            title: Text(module.name),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    ntcUiStream?.dispose();
    super.dispose();
  }
}
