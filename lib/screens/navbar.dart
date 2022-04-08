import 'package:flutter/material.dart';
import 'package:mark_player/screens/testScreen.temp';
import '../screens/favorites_screen.dart';
import 'home_page.dart';
import 'home_screen.temp';
import '../screens/movies_page.dart';
import '../screens/settings.dart';
import '../screens/watch_later.dart';

class customNavbar extends StatefulWidget {
  const customNavbar({Key? key}) : super(key: key);

  @override
  State<customNavbar> createState() => _customNavbarState();
}

class _customNavbarState extends State<customNavbar> {
  int CurrentIndex = 0;
int _selectedIndex = 0;
final PageController _pageController = PageController();
  final screens = [
  //  homeScreen(),
    //newHomeScreen(),
    MyHomePage(title: 'home'),
    favoritesScreen(),
    watchLaterScreen(),
    settingsPage(),
    MoviesPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     //   body: screens[CurrentIndex],
       body: PageView(
        controller: _pageController,
        children: <Widget>[
       //   homeScreen(),
  //  newHomeScreen(),
     MyHomePage(title: 'home'),
    favoritesScreen(),
    watchLaterScreen(),
    settingsPage(),
    MoviesPage()
  
        ],
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
    ),
       
       
        bottomNavigationBar: BottomNavigationBar(
          enableFeedback: true,
         // onTap: (index) => setState(() => _selectedIndex = index),
          onTap: _onTappedBar,
          currentIndex: _selectedIndex,
          unselectedItemColor: Color.fromARGB(255, 141, 133, 126),
          selectedItemColor: Theme.of(context).iconTheme.color,
          showUnselectedLabels: true,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.folder_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), label: 'Fav'),
            BottomNavigationBarItem(
                icon: Icon(Icons.watch_later_outlined), label: 'Watch Later'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: 'Settings'),
          ],
        ));
  }
  void _onTappedBar(int value) {
setState(() {
  _selectedIndex = value;
});
_pageController.jumpToPage(value);
}
}


