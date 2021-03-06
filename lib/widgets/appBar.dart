import 'package:flutter/material.dart';
import 'colors.dart';

class mainAppBar extends StatelessWidget implements PreferredSizeWidget {


  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60.0),
      child: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Image(
            image: AssetImage("images/logo.png"),
            width: MediaQuery.of(context).size.width / 3,
          ),
          iconTheme: IconThemeData(color: basicColor),
          automaticallyImplyLeading: true),
    );
  }
}
