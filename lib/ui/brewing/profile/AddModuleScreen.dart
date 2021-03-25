import 'package:flutter/material.dart';
import 'package:ntcbrew/ui/brewing/profile/AddSensorScreen.dart';
import 'package:ntcbrew/utils/Strings.dart';

class AddModuleScreen extends StatelessWidget {
  static const route = "/brewing/module/add";
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _createBody(context),
    );
  }

  Widget _createBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 70, 32, 70),
          child: Text(getString(context, (res) => res?.module_title), style: Theme.of(context).textTheme.headline3),
        ),
        Expanded(
          child: editText(textController),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(32, 32, 32, 32),
          alignment: Alignment.bottomCenter,
          child: OutlinedButton(
            onPressed: () => _onAddModuleClick(context),
            child: Text("Add Module"),
          ),
        ),
      ],
    );
  }

  void _onAddModuleClick(BuildContext context) {
    Navigator.of(context).pushNamed(AddSensorScreen.route);
  }

  Widget editText(TextEditingController textController) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
      child: TextFormField(
        controller: textController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          labelText: "Module Name",
          helperText: "Brewing module - Kettle, Mash tun, …",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
