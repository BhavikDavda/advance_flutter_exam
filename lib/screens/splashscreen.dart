import 'dart:async';

import 'package:flutter/material.dart';

import 'home_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black,),
      body: Center(
          child:CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage("https://play-lh.googleusercontent.com/5uDUy2xH-2wovIrVPyMuXnyklMB4KFAmmx40d3yGX-RRBfdZRlhd7Us1x3P_xkJL5Cs=w240-h480-rw"),
          )
      ),
    );
  }
}
