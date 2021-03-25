import 'package:flutter/material.dart';
import 'package:ntcbrew/network/model/Module.dart';
import 'package:ntcbrew/network/repository/ProfileRepository.dart';
import 'package:ntcbrew/ui/brewing/args.dart';
import 'package:ntcbrew/ui/brewing/profile/SensorListScreen.dart';
import 'package:ntcbrew/ui/widgets/empty.dart';
import 'package:ntcbrew/ui/widgets/error.dart';
import 'package:ntcbrew/ui/widgets/loading.dart';
import 'package:ntcbrew/ui/widgets/stream_widget.dart';
import 'package:ntcbrew/utils/NTCUiStream.dart';
import 'package:ntcbrew/utils/Strings.dart';
import 'package:provider/provider.dart';

class ModuleListScreen extends StatelessWidget {
  static const route = "/brewing/module/list";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getString(context, (res) => res?.module_title)),
      ),
      body: ModuleListBody(),
    );
  }
}

class ModuleListBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ModuleListBody();
}

class _ModuleListBody extends State<ModuleListBody> {
  late NTCUiStream<List<Module>> _ntcUiStream;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var profileRepository = Provider.of<ProfileRepository>(context);
    // final ProfileScreenArgument? args = ModalRoute.of(context)?.settings.arguments as ProfileScreenArgument;
    _ntcUiStream = profileRepository.getModules();
  }

  @override
  Widget build(BuildContext context) {
    if (!_ntcUiStream.hasData()) {
      _ntcUiStream.refresh();
    }

    return NTCStreamBuilder<List<Module>>(
      dataStream: _ntcUiStream.stream,
      noData: _showEmptyView(),
      loading: _showLoading(),
      error: (error) => _showError(),
      body: (data) => _createList(data),
    );
  }

  Widget _createList(List<Module> data) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        Module module = data[index];
        return Card(
          child: ListTile(
            title: Text(module.name),
            onTap: () => {
              Navigator.of(context).pushNamed(SensorListScreen.route, arguments: ModuleScreenArgument(module.id)),
            },
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
