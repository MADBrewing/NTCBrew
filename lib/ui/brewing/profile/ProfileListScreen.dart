import 'package:flutter/material.dart';
import 'package:ntcbrew/network/model/Board.dart';
import 'package:ntcbrew/network/model/Profile.dart';
import 'package:ntcbrew/network/repository/BoardRepository.dart';
import 'package:ntcbrew/network/repository/ProfileRepository.dart';
import 'package:ntcbrew/ui/UiState.dart';
import 'package:ntcbrew/ui/brewing/board/args.dart';
import 'package:ntcbrew/ui/brewing/profile/ModuleListScreen.dart';
import 'package:ntcbrew/ui/widgets/empty.dart';
import 'package:ntcbrew/ui/widgets/error.dart';
import 'package:ntcbrew/ui/widgets/loading.dart';
import 'package:ntcbrew/utils/NTCUiStream.dart';
import 'package:ntcbrew/utils/Strings.dart';
import 'package:provider/provider.dart';

class ProfileListScreen extends StatelessWidget {
  static const route = "/brewing/profile/list";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getString(context, (res) => res?.home_title)),
      ),
      body: ProfileListBody(),
    );
  }
}

class ProfileListBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileListBody();
}

class _ProfileListBody extends State<ProfileListBody> {
  late NTCUiStream<List<Profile>> _ntcUiStream;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var profileRepository = Provider.of<ProfileRepository>(context);
    _ntcUiStream = profileRepository.getProfiles();
  }

  @override
  Widget build(BuildContext context) {
    if(!_ntcUiStream.hasData()) {
      _ntcUiStream.refresh();
    }

    return StreamBuilder(
      stream: _ntcUiStream.stream,
      builder: (BuildContext context, AsyncSnapshot<UiState<List<Profile>>> snapshot) {
        if (!snapshot.hasData || snapshot.data?.status == UiStatus.LOADING) {
          return LoadingWidget();
        }

        if (snapshot.hasError) {
          return NtcErrorWidget(() => {
                _ntcUiStream.refresh(),
              });
        }

        if (snapshot.data?.data?.isEmpty == true) {
          return EmptyWidget(() => {
                _ntcUiStream.refresh(true),
              });
        }

        return createList(snapshot.data!.data!);
      },
    );
  }

  Widget createList(List<Profile> data) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        Profile profile = data[index];
        return Card(
          child: ListTile(
            title: Text(profile.name),
            onTap: () => {
              Navigator.of(context).pushNamed(ModuleListScreen.route, arguments: ProfileScreenArgument(profile.id)),
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _ntcUiStream.dispose();
    super.dispose();
  }
}
