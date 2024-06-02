import 'dart:async';
import 'package:flutter/material.dart';
import 'package:thanos3dtask/main.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      body: Center(
        child: Image.network("https://github.com/Fukulu/KratosTask/blob/main/launch_gif.gif?raw=true"),
  
      ),
    );
  }
}