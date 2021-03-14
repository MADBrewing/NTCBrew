import 'package:flutter/material.dart';
import 'package:ntcbrew/network/model/Board.dart';
import 'package:ntcbrew/network/model/Module.dart';
import 'package:ntcbrew/network/model/Profile.dart';
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
  NTCUiStream<List<Module>>? ntcUiStream;

  @override
  Widget build(BuildContext context) {
    var profileRepository = Provider.of<ProfileRepository>(context);
    if (ntcUiStream == null) {
      ntcUiStream = profileRepository.getModules();
      ntcUiStream?.refresh();
    }

    return StreamBuilder(
      stream: ntcUiStream!.stream,
      builder: (BuildContext context, AsyncSnapshot<UiState<List<Module>>> snapshot) {
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

  Widget createList(List<Module> data) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        Module module = data[index];
        return Card(
          child: ListTile(
            title: Text(module.name),
            onTap: () => {
              Navigator.of(context).pushNamed(ModuleListScreen.route, arguments: ModuleScreenArgument(module.id)),
            },
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
