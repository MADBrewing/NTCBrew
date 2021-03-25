import 'package:flutter/material.dart';
import 'package:ntcbrew/network/model/Board.dart';
import 'package:ntcbrew/network/model/Module.dart';
import 'package:ntcbrew/network/model/Profile.dart';
import 'package:ntcbrew/network/model/Sensor.dart';
import 'package:ntcbrew/network/repository/BoardRepository.dart';
import 'package:ntcbrew/network/repository/ProfileRepository.dart';
import 'package:ntcbrew/ui/UiState.dart';
import 'package:ntcbrew/ui/brewing/args.dart';
import 'package:ntcbrew/ui/widgets/empty.dart';
import 'package:ntcbrew/ui/widgets/error.dart';
import 'package:ntcbrew/ui/widgets/loading.dart';
import 'package:ntcbrew/ui/widgets/stream_widget.dart';
import 'package:ntcbrew/utils/NTCUiStream.dart';
import 'package:ntcbrew/utils/Strings.dart';
import 'package:provider/provider.dart';

class SensorListScreen extends StatelessWidget {
  static const route = "/brewing/sensor/list";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getString(context, (res) => res?.sensor_title)),
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
  late NTCUiStream<List<Sensor>> _ntcUiStream;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var profileRepository = Provider.of<ProfileRepository>(context);
    _ntcUiStream = profileRepository.getSensors();
  }

  @override
  Widget build(BuildContext context) {
    if (!_ntcUiStream.hasData()) {
      _ntcUiStream.refresh();
    }

    return NTCStreamBuilder<List<Sensor>>(
      dataStream: _ntcUiStream.stream,
      noData: _showEmptyView(),
      loading: _showLoading(),
      error: (error) => _showError(),
      body: (data) => _createList(data),
    );
  }

  Widget _createList(List<Sensor> data) {
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

  Widget _showLoading() => LoadingWidget();

  Widget _showError() => NtcErrorWidget(() => {
        _ntcUiStream.refresh(),
      });

  Widget _showEmptyView() => EmptyWidget(() => {
        _ntcUiStream.refresh(true),
      });

  @override
  void dispose() {
    _ntcUiStream.dispose();
    super.dispose();
  }
}
