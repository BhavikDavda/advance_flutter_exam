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
    Timer(Duration(seconds: 5), () {
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
            backgroundImage: NetworkImage("https://play-lh.googleusercontent.com/gEwOY_6Z_ogiTYZUMDca0Lj5R86fV-MRO71lx17Xctalm_5eNhpFEl7lWo2gGUp-lKg=w600-h300-pc0xffffff-pd"),
          )
      ),
    );
  }
}
