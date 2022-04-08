import 'package:flutter/material.dart';
import 'package:mark_player/custom%20widgets/app_bar.dart';
import '../custom widgets/folder_tile.dart';

class homeScreen extends StatelessWidget {
  homeScreen({Key? key}) : super(key: key);

  List<String> folderNames = [
    'Movies',
    'Camera',
    'Downloads',
    'Bluetooth',
    'Instagram',
    'Saved',
    'Old videos'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(title: 'Home'),
        body: ListView.builder(
            itemCount: folderNames.length,
            itemBuilder: ((context, index) {
              return folderTile(folderNames: folderNames, index: index);
            })),
     //   bottomNavigationBar: customNavbar()
     );
  }
}
