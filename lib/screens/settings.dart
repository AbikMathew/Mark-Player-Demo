import 'dart:async';
import 'dart:io';

import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:mark_player/custom%20widgets/app_bar.dart';

import 'package:mark_player/custom%20widgets/settings_tile.dart';
import 'package:file_manager/file_manager.dart';
import 'package:mark_player/screens/video_screens.dart';

class settingsPage extends StatelessWidget {
  const settingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FileManagerController controller = FileManagerController();

    return Scaffold(
      body: FileManager(
        controller: controller,
        builder: (context, snapshot) {
          // FileManager.getStorageList().then((value) {
          //       for (var i = 0; i < value.length; i++) {
          //         print(value[i]);
          //       }
          //     });
          final List<FileSystemEntity> entities = snapshot;
          controller.openDirectory(entities[0].absolute);

          return ListView.builder(
            itemCount: entities.length,
            itemBuilder: (context, index) {
              //     for (var i = 0; i < entities.length; i++) {
              //  if (FileManager.isDirectory(entities[index])) {
              //             controller.openDirectory(entities[index]); // open directory
              //           } else {
              //             // Perform file-related tasks.
              //             //  FileManager.isFile(entities[index]);
              //             print(controller.getCurrentPath);

              //             Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (context) => VideoScreens(
              //                         pathkuttan: entities[index].path)));
              //           }
              // }

              return Card(
                child: ListTile(
                  leading: FileManager.isFile(entities[index])
                      ? Icon(Icons.feed_outlined)
                      : Icon(Icons.folder),
                  title: Text(FileManager.basename(entities[index])),
                  onTap: () {
                    if (FileManager.isDirectory(entities[index])) {
                      controller
                          .openDirectory(entities[index]); // open directory
                    } else {
                      // Perform file-related tasks.
                      FileManager.isFile(entities[index]);
                      print(controller.getCurrentPath);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VideoScreens(
                                  pathkuttan: entities[index].path)));
                    }
                  },
                ),
              );
            },
          );
        },
      ),
    );

    // return Scaffold(
    //   appBar: appBar(title: 'Settings'),
    //   body: ListView(
    //     children: [
    //       settingsTile(settingsIcon: Icons.share, settingsText: 'Share'),
    //       settingsTile(settingsIcon: Icons.star, settingsText: 'Rating'),
    //       settingsTile(settingsIcon: Icons.info, settingsText: 'About')
    //     ],
    //   ),
    //  // bottomNavigationBar: customNavbar(),
    // );
  }
}
