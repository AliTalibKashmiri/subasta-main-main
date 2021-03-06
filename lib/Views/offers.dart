import 'package:flutter/material.dart';
import 'package:subasta/widgets/appBar.dart';
import 'package:subasta/widgets/colors.dart';
import 'package:subasta/widgets/offersCardDesign.dart';





class offerPage extends StatefulWidget {
  @override
  _offerPageState createState() => new _offerPageState();
}

class _offerPageState extends State<offerPage> {

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: mainAppBar(),
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: <Widget>[

          //heading
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 16),
            child: RichText(
              text: TextSpan(
                  style: TextStyle(fontWeight: FontWeight.bold,
                      color: basicColor,fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(text: "Ofertas Disponibles"),
                  ]
              ),
            ),
          ),


          Expanded(
            // flex: 2,
            child: offerCardDesign(),
          ),


        ],
      ),

    );
  }

}