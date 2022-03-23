import 'package:flutter/material.dart';

class settingsTile extends StatelessWidget {
  IconData settingsIcon;
  String settingsText;

  settingsTile(
      {required this.settingsIcon, required this.settingsText, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
      child: ListTile(
        leading: Icon(settingsIcon, color: Theme.of(context).iconTheme.color),
        title: Text(settingsText),
        trailing: Icon(
          Icons.arrow_forward,
          color: Theme.of(context).listTileTheme.textColor,
        ),
      ),
    );
  }
}
