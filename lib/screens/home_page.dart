import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:mark_player/custom%20widgets/app_bar.dart';
import 'package:mark_player/function/searchFiles.dart';
import 'package:better_player/better_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //File get file => null;

  @override
  void initState() {
    SearchFilesInStorage.searchInStorage(
      values,
      (List<String> data) {
        _pathList.clear();
        setState(() {
          _pathList.addAll(data);
        });
      },
      (error) {},
    ); // TODO: implement initState

    super.initState();
  }

  List<String> _pathList = [];
  // List<String> values = ['mp4', 'mkv'];
  List<String> values = ['mp4', 'avi'];
  String fileKitti =
      '/storage/emulated/0/Android/media/com.whatsapp/WhatsApp/Media/WhatsApp Video/Sent/VID-20220404-WA0019.mp4';
  late var fileKitti2;

//final uint8list = VideoThumbnail.thumbnailData(

  getThumbnail(String videoPath) async {
    fileKitti2 = (await VideoThumbnail.thumbnailData(
      video: videoPath,
      imageFormat: ImageFormat.JPEG,
      maxWidth:
          128, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
      quality: 25,
    ))!;
  }

  // getThumbnail(String videoPath){
  //   var fileKitti2 = VideoThumbnail.thumbnailData(video:videoPath );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'All Videos'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemBuilder: (ctx, index) {
            getThumbnail(_pathList[index]);
            String filenamak = dirname(_pathList[index]);
            print(filenamak);
            return ListTile(
              leading: Container(
                height: 60,
                width: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    //  image: FileImage(File(fileKitti))))),
                    image: MemoryImage(fileKitti2),
                  ),
                ),
              ),
              title: Text(basenameWithoutExtension(_pathList[index])),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        BetterPlayer.file(_pathList[index - 1])));
              },
            );
          },
          separatorBuilder: (ctx, index) {
            return const SizedBox(height: 10);
          },
          itemCount: _pathList.length,
        ),
      ),
    );
  }
}
