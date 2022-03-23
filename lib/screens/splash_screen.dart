import 'package:flutter/material.dart';


import 'home_screen.dart';
import 'navbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => customNavbar()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Icon(Icons.circle_outlined, size: 100),
                  Positioned(
                      top: 16,
                      right: 14,
                      child: Icon(Icons.play_arrow, size: 70))
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Mark ',
                      style: TextStyle(
                          color: Theme.of(context).listTileTheme.textColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  Text('Player',
                      style: TextStyle(
                          color: Theme.of(context).iconTheme.color,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
