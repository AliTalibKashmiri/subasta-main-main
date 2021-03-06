import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:subasta/Views/login.dart';
import 'package:subasta/models/offerModel.dart';
import 'package:subasta/widgets/Lists.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'colors.dart';
import 'offersCardDesign.dart';

class myPersonalCard extends StatefulWidget {
  @override
  _myPersonalCardState createState() => _myPersonalCardState();
}

class _myPersonalCardState extends State<myPersonalCard> {
  List<OfferModel> allOffersList = [];
  dynamic link;
  String title;
  String docId;
  bool bidding;
  List<bool> bidBool = [];
  List<int> allValues = [];
  List<String> listDoc = [];

  var user = FirebaseAuth.instance.currentUser;
  var formatter = NumberFormat('#,##,000');
  var pesoTotal = NumberFormat('#.##');

  var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),
      animationDuration: Duration(milliseconds: 500),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(
        color: basicColor,
      ),
      constraints: BoxConstraints.expand(width: 300),
      //First to chars "55" represents transparency of color
      overlayColor: Color(0x55000000),
      alertElevation: 0,
      alertAlignment: Alignment.center
  );

  // void showInSnackBar(String value) {
  //   Scaffold.of(context).showSnackBar(
  //       new SnackBar(duration: Duration(seconds: 2), content: new Text(value)));
  // }

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ListView.builder(
      itemCount: allOffersList.length,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),

          //main Card started
          child: Container(
            width: width/1.1,
            child: Card(
              elevation: 3,
              shadowColor: Colors.grey,
              color: Colors.grey[200],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
                // side: BorderSide(width: 1,color: Colors.grey[200])
              ),
              child: Wrap(
                direction: Axis.horizontal,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //image with title and address
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: Opacity(
                          opacity: 0.6,
                          child: Image.network(
                            allOffersList[index].imgeUrl,
                            height: MediaQuery.of(context).size.height * 0.24,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),


                      Positioned(
                          left: 10,
                          bottom: 80,
                          right: 0,

                          child: Icon(Icons.play_circle_fill_rounded,color: declineColor,size: 34,)),

                      //shre icon
                      Positioned(
                          bottom: 10,
                          right: 12,
                          child: GestureDetector(
                            onTap: ()
                            {
                              share(link,title,index);
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle
                              ),
                              child: Icon(
                                Icons.share,
                                color: declineColor,
                                size: 20,
                              ),
                            ),
                          )),
                      //title and location
                      Positioned(
                        left: 15,
                        bottom: 15,
                        right: 0,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment:
                          CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              allOffersList[index].videoTitle,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: height / 36,
                                  fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_rounded,
                                  color: declineColor,
                                  size: 12,
                                ),
                                Text(allOffersList[index].addres,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Container(
                    height: height/5.8,

                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, top: 6, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text.rich(
                                    TextSpan(children: <InlineSpan>[
                                      TextSpan(
                                        text: "No Oferta: ",
                                        style:
                                        CustomTextStyle.display1(context),
                                      ),
                                      TextSpan(
                                        text: allOffersList[index].noOferta.toString(),
                                        style:
                                        CustomTextStyle.display2(context),
                                      ),
                                    ]),
                                  ),
                                  Text.rich(
                                    TextSpan(children: <InlineSpan>[
                                      TextSpan(
                                        text: "Peso Total: ",
                                        style:
                                        CustomTextStyle.display1(context),
                                      ),
                                      // Text('\$${cart.totalAmount.toStringAsFixed(2)}'), //2.34
                                      TextSpan(
                                        text:  formatter.format(allOffersList[index].persoTotal),
                                        style: CustomTextStyle.display2(context),
                                      ),
                                    ]),
                                  ),
                                  Text.rich(
                                    TextSpan(children: <InlineSpan>[
                                      TextSpan(
                                        text: "Cantidad: ",
                                        style:
                                        CustomTextStyle.display1(context),
                                      ),
                                      TextSpan(
                                        text: allOffersList[index].cantidad.toString(),
                                        style:
                                        CustomTextStyle.display2(context),
                                      ),
                                    ]),
                                  ),

                                  // Text.rich(
                                  //   TextSpan(children: <InlineSpan>[
                                  //     TextSpan(
                                  //       text: "Precio Total: ",
                                  //       style:
                                  //           CustomTextStyle.display1(context),
                                  //     ),
                                  //     TextSpan(
                                  //       text: allOffersList[index].Preciototal.toString(),
                                  //       style:
                                  //           CustomTextStyle.display2(context),
                                  //     ),
                                  //   ]),
                                  // ),
                                ],
                              ),
                              Container(
                                // color: Colors.red,
                                width: MediaQuery.of(context).size.width /3,
                                height:
                                MediaQuery.of(context).size.height / 20,
                                child: RaisedButton(
                                    onPressed: (){

                                      if(user!=null){
                                        Alert(
                                          context: context,
                                          style: alertStyle,
                                          // type: AlertType.success,
                                          title: "Estás haciendo una oferta por \$" +formatter.format(allValues[index] + allOffersList[index].incrementoPuja),
                                          image: Icon(Icons.warning_sharp,color: declineColor,size: 50,),

                                          desc: "Su paleta es # 68122.Estas segura?",
                                          buttons: [
                                            DialogButton(
                                                child: Text(
                                                  "No, cancelar",
                                                  style: TextStyle(color: basicColor, fontSize: 14),
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  // Navigator.pushReplacement(
                                                  //     context,
                                                  //     PageTransition(
                                                  //       curve: Curves.bounceOut,
                                                  //       type: PageTransitionType.rightToLeftWithFade,
                                                  //       duration: Duration(milliseconds: 800),
                                                  //       alignment: Alignment.topCenter,
                                                  //       child: jobs_page(),
                                                  //     ));
                                                },
                                                color: Color.fromRGBO(255, 255, 255, 1.0),
                                                radius: BorderRadius.circular(0.0,),
                                                border: Border.all(
                                                    color: basicColor
                                                )
                                            ),
                                            DialogButton(
                                              child: Text(
                                                "¡Sí, puja!",
                                                style: TextStyle(color: Colors.white, fontSize: 14),
                                              ),
                                              onPressed: () {
                                                bid(index);
                                                Navigator.pop(context);
                                              },
                                              color: Color.fromRGBO(50, 80, 120, 1.0),
                                              radius: BorderRadius.circular(0.0),
                                            ),
                                          ],
                                        ).show();

                                      }else
                                      {
                                        Alert(
                                          context: context,
                                          style: alertStyle,
                                          // type: AlertType.success,
                                          title: "Permiso requerido para comenzar!",
                                          image: Icon(Icons.warning_sharp,color: declineColor,size: 50,),

                                          desc: "Primero debe iniciar sesión antes de ofertar",
                                          buttons: [
                                            DialogButton(
                                                child: Text(
                                                  "Cancelar",
                                                  style: TextStyle(color: basicColor, fontSize: 14),
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  // Navigator.pushReplacement(
                                                  //     context,
                                                  //     PageTransition(
                                                  //       curve: Curves.bounceOut,
                                                  //       type: PageTransitionType.rightToLeftWithFade,
                                                  //       duration: Duration(milliseconds: 800),
                                                  //       alignment: Alignment.topCenter,
                                                  //       child: jobs_page(),
                                                  //     ));
                                                },
                                                color: Color.fromRGBO(255, 255, 255, 1.0),
                                                radius: BorderRadius.circular(0.0,),
                                                border: Border.all(
                                                    color: basicColor
                                                )
                                            ),
                                            DialogButton(
                                              child: Text(
                                                "Iniciar sesión",
                                                style: TextStyle(color: Colors.white, fontSize: 14),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).
                                                push(MaterialPageRoute(builder: (context)=>logIn()));
                                              },
                                              color: Color.fromRGBO(50, 80, 120, 1.0),
                                              radius: BorderRadius.circular(0.0),
                                            ),
                                          ],
                                        ).show();
                                      }
                                    },
                                    disabledColor: basicColor,
                                    focusColor: basicColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    color: basicColor,
                                    textColor: Colors.white,
                                    padding: EdgeInsets.all(6.0),
                                    child:
                                    bidBool[index] == true ?
                                    Text(
                                      "Pujar a \$" + formatter.format(allValues[index] + allOffersList[index].incrementoPuja),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11.0,
                                      ),
                                      textAlign: TextAlign.center,
                                    ) : Text(
                                      "Pujar a \$" + formatter.format(allValues[index]),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11.0,
                                      ),
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, top: 0, right: 10,bottom: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text.rich(
                                        TextSpan(children: <InlineSpan>[
                                          TextSpan(
                                            text: "Incremento Puja: ",
                                            style: CustomTextStyle.display1(
                                                context),
                                          ),
                                          TextSpan(
                                            text: "\$"+ formatter.format(allOffersList[index]
                                                .incrementoPuja),
                                            style: CustomTextStyle.display2(
                                                context),
                                          ),
                                        ]),
                                      ),
                                      Text.rich(
                                        TextSpan(children: <InlineSpan>[
                                          TextSpan(
                                            text: "Precio Kilo: ",
                                            style: CustomTextStyle.display1(
                                                context),
                                          ),
                                          TextSpan(
                                            text: '${allOffersList[index].precioKilo}' == null
                                                ? '${allOffersList[index].precioKilo}'
                                                : "-",
                                            style: CustomTextStyle.display2(
                                                context),
                                          ),
                                        ]),
                                      ),
                                      Text.rich(
                                        TextSpan(children: <InlineSpan>[
                                          TextSpan(
                                            text: "Puja Actual: ",
                                            style: CustomTextStyle.display1(
                                                context),
                                          ),
                                          TextSpan(
                                            text: "\$"+ formatter.format(allOffersList[index]
                                                .pujaActual),
                                            style: CustomTextStyle.display2(
                                                context),
                                          ),
                                        ]),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text.rich(
                                        TextSpan(children: <InlineSpan>[
                                          TextSpan(
                                            text: "Precio Animal: ",
                                            style: CustomTextStyle.display1(
                                                context),
                                          ),
                                          TextSpan(
                                            text: "\$"+ formatter.format(allOffersList[index].precioAnimal),
                                            style: CustomTextStyle.display2(
                                                context),
                                          ),
                                        ]),
                                      ),
                                      Text.rich(
                                        TextSpan(children: <InlineSpan>[
                                          TextSpan(
                                            text: "Peso Pro: ",
                                            style: CustomTextStyle.display1(
                                                context),
                                          ),
                                          TextSpan(
                                            text: formatter.format(allValues[index]),
                                            style: CustomTextStyle.display2(
                                                context),
                                          ),
                                        ]),
                                      ),
                                      Text.rich(
                                        TextSpan(children: <InlineSpan>[
                                          TextSpan(
                                            text: "Precio Total: ",
                                            style: CustomTextStyle.display1(
                                                context),
                                          ),
                                          TextSpan(
                                            text: "\$"+ formatter.format(allOffersList[index]
                                                .precioTotal),
                                            style: CustomTextStyle.display2(
                                                context),
                                          ),
                                        ]),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              Container(
                                // width: 300.0,
                                // height: double.maxFinite,
                                child: Text.rich(
                                  TextSpan(children: <InlineSpan>[
                                    TextSpan(
                                      text: "Observaiones: \n",
                                      style:
                                      CustomTextStyle.display1(context),
                                    ),
                                    TextSpan(
                                      text: allOffersList[index].observaciones,
                                      style:
                                      CustomTextStyle.display2(context),
                                    ),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )




                ],
              ),
            ),
          ),
        );
      },
      // separatorBuilder: (BuildContext context, int index) {
      //   return SizedBox(
      //     height: 10,
      //   );
      // }
    );
  }

  Future<void> share(dynamic link, String title, int index)
  async {
    await FlutterShare.share(
        title: 'SUBASTA EN VIVO',
        linkUrl: allOffersList[index].imgeUrl,
        text:allOffersList[index].videoTitle,
        chooserTitle: 'Where you want to share'
    );
  }
  bid(int index) async {
    int total = allOffersList[index].pesoPro + allOffersList[index].incrementoPuja;
    await FirebaseFirestore.instance.collection("ofertas").doc(listDoc[index]).update({
      "pesoPro" : total,
      "bid" : true
    });
    allValues[index] = total;
    setState(() {});
  }

  readData() async {
    Map lote;
    Map media;
    Map oferta;
    List loteList = [];
    List mediaList = [];
    List ofertaList = [];
    FirebaseFirestore.instance.collection("ofertas").get().then((data) {
      if(data != null){
        data.docs.forEach((result) {
          OfferModel offerModel = new OfferModel();
          docId = result.data()['DocId'];
          bidding = result.data()['bid'];
          offerModel.pesoPro = result.data()['pesoPro'];
          allValues.add(offerModel.pesoPro);
          print(offerModel.pesoPro);
          lote = result.data()['lote'];
          media = result.data()['media'];
          oferta = result.data()['oferta'];
          print(lote.keys);
          loteList = lote.keys.toList();
          mediaList = media.keys.toList();
          ofertaList = oferta.keys.toList();
          if(lote != null){
            for (int i = 0; i < loteList.length; i++) {
              offerModel.cantidad = lote['cantidad'];
              offerModel.noOferta = lote['numero_oferta'];
              offerModel.observaciones = lote['observaciones'];
              offerModel.Preciototal = lote['peso_total'];
              offerModel.persoTotal = lote['peso_total'];
            }
          }
          else{
            print('not available');
          }
          if(media != null){
            for (int i = 0; i < mediaList.length; i++) {
              offerModel.imgeUrl = media['portada'];
            }
          }
          else{
            print('not available');
          }
          if(oferta != null){
            for (int i = 0; i < ofertaList.length; i++) {
              offerModel.precioAnimal = oferta['valor_animal'];
              offerModel.incrementoPuja = oferta['valor_incremento'];
              offerModel.precioKilo = media['valor_kilo'];
              offerModel.precioTotal = oferta['valor_total'];
              offerModel.pujaActual = oferta['valor_oferta_base'];
              offerModel.videoTitle = "Sultans dine";
              offerModel.addres = "Kingdom Tower, Brazil";
            }
          }
          else{
            print('not available');
          }
          allOffersList.add(offerModel);
          listDoc.add(docId);
          bidBool.add(bidding);
        });
        setState(() {});
      };
      print('${allOffersList.length}-------------');
      print(bidBool);
    });
  }


}



class CustomTextStyle {
  static TextStyle display1(BuildContext context) {
    return TextStyle(
        color: basicColor,
        fontSize: MediaQuery.of(context).size.height / 60,
        fontWeight: FontWeight.bold);
  }

  static TextStyle display2(BuildContext context) {
    return TextStyle(
        color: basicColor,
        fontSize: MediaQuery.of(context).size.height / 60,
        fontWeight: FontWeight.w400);
  }

  static TextStyle title(BuildContext context) {
    return TextStyle(
        color: basicColor,
        fontSize: MediaQuery.of(context).size.height / 40,
        fontWeight: FontWeight.w400);
  }
}
