import 'package:flutter/material.dart';
import 'package:ntcbrew/network/model/Profile.dart';
import 'package:ntcbrew/network/repository/ProfileRepository.dart';
import 'package:ntcbrew/ui/brewing/args.dart';
import 'package:ntcbrew/ui/brewing/profile/ModuleListScreen.dart';
import 'package:ntcbrew/ui/widgets/empty.dart';
import 'package:ntcbrew/ui/widgets/error.dart';
import 'package:ntcbrew/ui/widgets/loading.dart';
import 'package:ntcbrew/ui/widgets/stream_widget.dart';
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
    if (!_ntcUiStream.hasData()) {
      _ntcUiStream.refresh();
    }

    return NTCStreamBuilder<List<Profile>>(
      dataStream: _ntcUiStream.stream,
      noData: _showEmptyView(),
      loading: _showLoading(),
      error: (error) => _showError(),
      body: (data) => _createList(data),
    );
  }

  Widget _createList(List<Profile> data) {
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
