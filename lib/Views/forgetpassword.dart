
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:subasta/Views/login.dart';
import 'package:subasta/widgets/cards.dart';
import 'package:subasta/widgets/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';




class forgetPass extends StatefulWidget {
  @override
  _forgetPassState createState() => new _forgetPassState();
}

class _forgetPassState extends State<forgetPass> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController email = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: scaffoldKey,
      // backgroundColor: Color(0xfff7f7f7),

        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
              title: Text("Se te olvidó tu contraseña",style: CustomTextStyle.title(context),),
            iconTheme: IconThemeData(color: basicColor),
            automaticallyImplyLeading: true
          ),
        ),

        body: Form(
          key: key,
          child: Center(
            child: Container(
              width: width/1.2,
              child: Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    Align(
                      alignment: Alignment.center,
                      child: Image(
                        image: AssetImage("images/logo.png"),
                        height: MediaQuery.of(context).size.height/10,
                      ),
                    ),

                    RichText(
                      text: TextSpan(
                          style: TextStyle(fontWeight: FontWeight.w500,color: basicColor,fontSize: 16),
                          children: <TextSpan>[
                            TextSpan(text: "Restablecer Contraseña"),
                            TextSpan(text: "\nIngresa el correo electrónico con el que teregistraste, yte enviaremos un mail con un linkpara restablecer tu contraseña.", style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: hintcolor)),
                          ]
                      ),
                    ),


                    SizedBox(height: 25,),
                    Wrap(
                      direction: Axis.vertical,

                      spacing: 8,

                      // // alignment: WrapAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Correo electrónico:", style: TextStyle(color: basicColor),),

                        //email textfield
                        Container(
                          width: width/1.2,
                          child: TextFormField(
                            style: TextStyle(
                                color: basicColor,
                                fontSize: 14
                            ),

                            controller: email,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                            cursorColor: basicColor,
                            decoration: new InputDecoration(
                                contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                                border: new OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(30.0),
                                    ),
                                    borderSide: BorderSide(color: textfieldColor)
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(30.0),
                                  ),
                                  borderSide: BorderSide(color: textfieldColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(30.0),
                                  ),
                                  borderSide: BorderSide(color: textfieldColor),
                                ),
                                filled: true,
                                hintStyle: new TextStyle(color: Colors.grey[400],fontSize: 14),
                                hintText: "ejemplo@gmail.com",
                                fillColor: textfieldColor),
                          ),
                        ),



                      ],
                    ),

                    SizedBox(height: 20,),

                    //forget button
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width/1.4,
                        height: MediaQuery.of(context).size.height/16,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              side: BorderSide(
                                color: basicColor,
                              )),
                          color: basicColor,
                          textColor: Colors.white,
                          padding: EdgeInsets.all(8.0),
                          onPressed: () async {
                            if(key.currentState.validate()){
                              await dealSubmit();
                              showSnackBar('email enviado');
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                    curve: Curves.bounceOut,
                                    type: PageTransitionType.rightToLeftWithFade,
                                    duration: Duration(milliseconds: 1000),
                                    alignment: Alignment.topCenter,
                                    child: logIn(),
                                  ));
                            }
                            else{
                              showSnackBar('Please Enter Email');
                            }
                          },
                          child: Text(
                            "Restablecer",
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),


              ),
            ),
          ),
        )
    );
  }

  dealSubmit() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
      // setState(() {
      //   sent = true;
      // });
    } catch (e) {
      print(e.toString());
      showSnackBar(e.toString());
      // List a = e.toString().split(',');
      // String b = a[1];
      // print(b);
      // if (b == ' There is no user record corresponding to this identifier. The user may have been deleted.') {
      //   showSnackBar(
      //       'There is no account associated with that email address. The account may have been deleted.');
      // } else if (b == ' The email address is badly formatted.') {
      //   showSnackBar('Invalid Email Format');
      // } else {
      //   showSnackBar(b);
      // }
    }
  }

  showSnackBar(String a) {
    SnackBar snackBar = SnackBar(
      content: Text(a),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

}