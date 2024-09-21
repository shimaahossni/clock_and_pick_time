import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timer/module/clock/clock_page.dart';

class SplashPage extends StatefulWidget {
  static const String routeName="/";

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  @override
  void initState() {
    Timer(Duration(seconds: 5),() {
      Navigator.pushReplacementNamed(context,ClockPage.routeName);
    },);
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Size mediaquery=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/splash.jpg",width: mediaquery.width*.8,),
            const SizedBox(height: 20,),
            const CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
            ),
          ],
        ),
      ),
    );
  }
}
