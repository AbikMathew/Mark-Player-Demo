import 'package:flutter/material.dart';
import 'package:mark_player/custom%20widgets/app_bar.dart';
import 'package:mark_player/custom%20widgets/movie_tile.dart';



class watchLaterScreen extends StatelessWidget {
   watchLaterScreen({ Key? key }) : super(key: key);

List<String> WatchLaterNames = [
'Batman: Dark Knight',
'The flow',
'Found in the sea lake',
// 'Joke',
// 'Bheeshma Parvam',
// 'Super Sharanya',
// 'Hridayam',
// 'Classmates',
// 'Notebook',
// 'Watermelon',
// 'Wrong cast',
// 'The PT'
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Watch Later'),
      body: ListView.builder(
        itemCount: WatchLaterNames.length,
        itemBuilder: (BuildContext, index){
        return MovieTile(index: index);
      }),
    //  bottomNavigationBar: customNavbar(),
    );
  }
}