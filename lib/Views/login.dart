
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:subasta/models/static_info.dart';
import 'package:subasta/widgets/cards.dart';
import 'package:subasta/widgets/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'forgetpassword.dart';
import 'home.dart';
class  logIn extends StatefulWidget {
  @override
  _logInState createState() => new _logInState();
}
class _logInState extends State<logIn> {
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: key,
      // backgroundColor: Color(0xfff7f7f7),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text("iniciar sesión",style: CustomTextStyle.title(context),),
            iconTheme: IconThemeData(color: basicColor),
            automaticallyImplyLeading: true
          ),
        ),

      body: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: height/40),
                  Align(
                    alignment: Alignment.center,
                    child: Image(
                      image: AssetImage("images/logo.png"),
                      height: MediaQuery.of(context).size.height/10,
                    ),
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(fontWeight: FontWeight.bold,
                              color: basicColor,fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(text: "Iniciar sesión"),
                          ]
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 15,),

            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [



                      Wrap(
                        direction: Axis.vertical,

                        spacing: 8,

                        // // alignment: WrapAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Correo electrónico", style: TextStyle(color: basicColor,fontSize: 12),),

                          //email textfield
                          Container(
                            width: width/1.2,
                            child: TextFormField(
                              style: TextStyle(
                                  color: basicColor,
                                  fontSize: 14
                              ),
                              validator: (val) {
                                if (val.isEmpty)
                                  return 'must required field';
                              },
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

                          const SizedBox(height: 6,),
                          Text("Contraseña:", style: TextStyle(color: basicColor,fontSize: 12),),

                          //password textfield
                          Container(
                            width: width/1.2,
                            child: TextFormField(

                              style: TextStyle(
                                  color: basicColor,
                                  fontSize: 14
                              ),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'Must Required field';
                                } else {
                                  if (val.length < 6) {
                                    return 'Your password is less than 6 characters';
                                  }
                                }
                              },

                              controller: password,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.visiblePassword,
                              onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),

                              cursorColor: basicColor,
                              obscureText: _obscureText,
                              decoration: new InputDecoration(
                                  contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),

                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.remove_red_eye),
                                    iconSize: 18,
                                    color: basicColor,
                                    onPressed: _toggle,
                                  ),

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
                                  hintStyle: new TextStyle(color: Colors.grey[400], fontSize: 14),
                                  hintText: "· · · · · · · · · · ",
                                  fillColor: textfieldColor),
                            ),
                          ),
                        ],
                      ),
                      //forget link
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                  curve: Curves.bounceOut,
                                  type: PageTransitionType.rightToLeftWithFade,
                                  duration: Duration(milliseconds: 1000),
                                  alignment: Alignment.topCenter,
                                  child: forgetPass(),
                                ));
                          },
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Text("¿Has olvidado tu contraseña? Ingresa aquí",style:
                              TextStyle(color: basicColor,fontSize: 12),)),
                        ),
                      ),

                      SizedBox(height: 16,),


                      //login button
                      Container(
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
                            if(formkey.currentState.validate()){
                              await login();
                            }
                          },
                          child: Text(
                            "Ingresar",
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 10,)

                    ],
                  ),
                ),
              ),
            ),





          ],
        ),

    );
  }

  login() async {
    try {
      if (email.text != null) {
        UserCredential result = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email.text.trim(), password: password.text);
        StaticInfo.currentUser = result.user;
        Navigator.push(
            context,
            PageTransition(
              curve: Curves.bounceOut,
              type: PageTransitionType.rightToLeftWithFade,
              duration: Duration(milliseconds: 1000),
              alignment: Alignment.topCenter,
              child: home(),
            ));
        }
        else{
        showAlertDialog('User not created in database');
        }
    }
    catch(e){
      showAlertDialog(e.toString());
    }
  }

  showSnackBar(String msg) {
    SnackBar snackBar = SnackBar(
      content: Text(msg),
    );
    key.currentState.showSnackBar(snackBar);
  }

  showAlertDialog(String msg) {

    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {

        Navigator.pop(context);

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: basicColor,
      title: Text("Error de inicio de sesion",style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,),
      content: Text("La combinación de correo electrónico / contraseña no es válida",style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.w500)),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }



}