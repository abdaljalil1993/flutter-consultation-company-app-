import 'dart:async';

import 'package:bactapp/home.dart';

import 'login.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  AnimationController animationController;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animationController.repeat();

    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => Login())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A2036),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 9,
            child: Column(
              children: [
                SizedBox(
                  height: 90.0,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text('BACT Consultation',
                    style: TextStyle(
                        fontSize: 40.0,
                        color: Color(0xFFB99350),
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 15.0,
                ),
                Text('We Make Your Dream Real',
                    style: TextStyle(
                        fontSize: 24.0,
                        color: Color(0xFFB3B3B3),
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 30.0,
                ),
                CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    valueColor: animationController.drive(ColorTween(
                        begin: Colors.yellow[600], end: Color(0xFFB99350)))),
                SizedBox(
                  height: 80.0,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text('** Powerd By BACT 2021 ** ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFFB99350),
                    fontWeight: FontWeight.bold)),
          ),
        ],
      )),
    );
  }
}
