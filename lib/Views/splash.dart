import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:subasta/Views/home.dart';
import 'package:subasta/models/static_info.dart';
import 'package:subasta/widgets/colors.dart';
class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    read();
    Timer(Duration(seconds: 2), () => Navigator.of(context).
    pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>home()), (route) => false));
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Image(
          image: AssetImage("images/logo.png",),
        ),
      ),
    );
  }


  read(){
    User user = FirebaseAuth.instance.currentUser;
    if(user != null){
      StaticInfo.currentUser = user;
    }
  }
}
