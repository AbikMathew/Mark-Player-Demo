

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mark_player/custom%20widgets/drop_down.dart';
import 'package:mark_player/screens/movies_page.dart';
import 'package:mark_player/screens/video_screens.dart';

List<String> movieNames = [
'Batman: Dark Knight',
'The flow',
'Found in the sea',
'Joke',
'Bheeshma Parvam',
'Super Sharanya',
'Hridayam',
'Classmates',
'Notebook',
'Watermelon',
'Wrong cast',
'The PT'
];

class MovieTile extends StatelessWidget {
  MovieTile({
    Key? key,
    required this.index,
  }) : super(key: key);

  // final List<String> folderNames;
  int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
      child: ListTile(
        onTap: () {
         // Navigator.push(
           //   context, MaterialPageRoute(builder: (context) => VideoScreens()));
        },
        //of(context).push(MaterialPageRoute(builder: (context) => VideoScreens())),
        shape: Theme.of(context).listTileTheme.shape,
        tileColor: Theme.of(context).listTileTheme.tileColor,
        leading: Container(
            
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'asset/unsplash1.jpg',
                height: 99,
                width: 80,
                fit: BoxFit.fitHeight,
              ),
            )),

        // FaIcon(FontAwesomeIcons.folder,
        //     color: Theme.of(context).iconTheme.color),
        trailing: PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: DropDown(
                    dropDownIcon: Icons.favorite,
                    dropDownItem: 'Add to favourites'),
              ),
              PopupMenuItem(
                  child: DropDown(
                      dropDownIcon: Icons.watch_later,
                      dropDownItem: 'Add to watch later')),
              PopupMenuItem(
                  child: DropDown(
                      dropDownIcon: Icons.share, dropDownItem: 'Share'))
            ];
          },
          icon: Icon(Icons.more_vert,
              color: Theme.of(context).listTileTheme.textColor),
        ),
        subtitle: Text(''),
        title: Text(
          '\t${movieNames[index]}',
          style: TextStyle(color: Theme.of(context).listTileTheme.textColor),
        ),
      ),
    );
  }
}
