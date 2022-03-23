import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class VideoScreens extends StatelessWidget {
   VideoScreens({ Key? key,required this.pathkuttan }) : super(key: key);

String pathkuttan;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AspectRatio(
        aspectRatio: 16 / 9,
        child: BetterPlayer.file(pathkuttan,
          betterPlayerConfiguration: BetterPlayerConfiguration(
            aspectRatio: 16 / 9,
          ),
        ),
      ),
      ),
    );
  }
}