// import 'package:flutter/material.dart';
// import 'cards.dart';
// import 'colors.dart';
// //
// // Container(
// // //                color: Colors.redAccent,
// // padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 0.0),
// // height: MediaQuery.of(context).size.height * 0.40,
// //
// // child: myPersonalCard()
// // ),
// // -----------------------------------
// class myPersonalCard extends StatefulWidget {
//   @override
//   _myPersonalCardState createState() => _myPersonalCardState();
// }
//
// class _myPersonalCardState extends State<myPersonalCard> {
//   String noOferta = "171";
//   String perso_Total = "192(KG)";
//   String cantidad = "1";
//   String precio_Total = "\$9,600.000";
//
//   void showInSnackBar(String value) {
//     Scaffold.of(context).showSnackBar(new SnackBar(
//         duration: Duration(seconds: 2),
//         content: new Text(value)
//     ));
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//
//
//
//     return ListView.separated(
//         itemCount: HomeOffersList.length,
//         shrinkWrap: false,
//         physics: ClampingScrollPhysics(),
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: ()
//             {
//
//             },
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 4),
//               child: Container(
//                 // height: MediaQuery.of(context).size.height * 0.1,
//                 width: MediaQuery.of(context).size.width / 1.2,
//
//                 // decoration: ,
//                 child: Card(
//                   elevation: 3,
//                   shadowColor: Colors.grey,
//                   color: Colors.grey[200],
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12.0),
//                     // side: BorderSide(width: 1,color: Colors.grey[200])
//                   ),
//                   child: Wrap(
//                     // crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//
//                       //image with title and address
//                       Stack(
//                         children: [
//
//
//                           ClipRRect(
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(12),
//                               topRight: Radius.circular(12),
//                             ),
//                             child: Opacity(
//                               opacity: 0.5,
//                               child: Image.asset(
//                                 HomeOffersList[index].imgeUrl,
//                                 height: MediaQuery.of(context).size.height *
//                                     0.24,
//                                 width: MediaQuery.of(context).size.width,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//
//                           Positioned(
//                               left: 10,
//                               bottom: 80,
//                               right: 0,
//
//                               child: Icon(Icons.play_circle_fill_rounded,color: declineColor,size: 34,)),
//
//                           Positioned(
//                               bottom:1,
//                               right: 12,
//
//                               child: Icon(Icons.share,color: declineColor,)),
//
//                           Positioned(
//                             left: 15,
//                             bottom: 15,
//                             right: 0,
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               crossAxisAlignment: CrossAxisAlignment.stretch,
//                               children: <Widget>[
//                                 Text(
//                                   HomeOffersList[index].videoTitle,
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: height / 36,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                                 Row(
//                                   children: [
//                                     Icon(Icons.location_on_rounded,color: declineColor, size: 12,),
//                                     Text(  HomeOffersList[index].addres, style: TextStyle(fontSize: 12,color: Colors.white)),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//
//                         ],
//                       ),
//
//
//
//
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10.0, top: 6,right: 10),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//
//                                 Text.rich(
//                                   TextSpan(
//                                       children: <InlineSpan>[
//                                         TextSpan(text: "No Oferta: ",
//                                           style: CustomTextStyle.display1(context),),
//                                         TextSpan(text: HomeOffersList[index].noOferta,
//                                           style: CustomTextStyle.display2(context),),
//                                       ]
//                                   ),
//                                 ),
//                                 //peso total
//                                 Text.rich(
//                                   TextSpan(
//                                       children: <InlineSpan>[
//                                         TextSpan(text: "Peso Total: ",
//                                           style: CustomTextStyle.display1(context),),
//                                         TextSpan(text: HomeOffersList[index].persoTotal,
//                                           style: CustomTextStyle.display2(context),),
//                                       ]
//                                   ),
//                                 ),
//
//                                 //cantidad
//                                 Text.rich(
//                                   TextSpan(
//                                       children: <InlineSpan>[
//                                         TextSpan(text: "Cantidad: ",
//                                           style: CustomTextStyle.display1(context),),
//                                         TextSpan(text: HomeOffersList[index].cantidad,
//                                           style: CustomTextStyle.display2(context),),
//                                       ]
//                                   ),
//                                 ),
//
//                                 //precio total
//                                 Text.rich(
//                                   TextSpan(
//                                       children: <InlineSpan>[
//                                         TextSpan(text: "Precio Total: ",
//                                           style: CustomTextStyle.display1(context),),
//                                         TextSpan(text: HomeOffersList[index].Preciototal,
//                                           style: CustomTextStyle.display2(context),),
//                                       ]
//                                   ),
//                                 ),
//
//                               ],
//                             ),
//
//                             Container(
//                               // color: Colors.red,
//                               width: MediaQuery.of(context).size.width/4,
//                               height: MediaQuery.of(context).size.height/22,
//                               child: RaisedButton(
//                                 onPressed: ()
//                                 {
//                                   showInSnackBar("Inicia sesión primero, gracias ^.^");
//                                 },
//                                 disabledColor: basicColor,
//                                 focusColor: basicColor,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(25.0),
//                                   // side: BorderSide(
//                                   //   color: basicColor,
//                                   // )
//                                 ),
//                                 color: basicColor,
//                                 textColor: Colors.white,
//                                 padding: EdgeInsets.all(8.0),
//                                 child: Text(
//                                   "Pujar a \$XXX",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 11.0,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//
//                       SizedBox(width: width/8,height: 13,),
//
//
//                       GestureDetector(
//                           onTap: (){
//                             showInSnackBar("Inicia sesión primero, gracias ^.^");
//                           },
//                           child: Center(child: Text(  "ver más...", style: TextStyle(fontSize: 12,color: Colors.grey)))),
//
//
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//         separatorBuilder: (BuildContext context, int index) {
//           return SizedBox(
//             height: 10,
//           );
//         }
//     );
//   }
// }
//
//
//
//
//
// // ------------------------------------------
//
//
//
//
//
//
// List HomeOffersList = [
//
//   offerDetail(
//     videoTitle:"Sultans dine",
//     addres:"Kingdom Tower, Brazil",
//     noOferta:"171",
//     persoTotal: "192(kG)",
//     imgeUrl: "images/pic.png",
//     Preciototal: "\$9,600.000",
//     cantidad: "1",
//   ),
//
//   offerDetail(
//     videoTitle:"King dine",
//     addres:"Kingdom Tower, Lahore",
//     noOferta:"181",
//     persoTotal: "122(kG)",
//     imgeUrl: "images/pic.png",
//     Preciototal: "\$2,800.000",
//     cantidad: "2",
//   ),
//
//   offerDetail(
//     videoTitle:"Queen dine",
//     addres:"Anar Kali Tower, Lahore",
//     noOferta:"120",
//     persoTotal: "100(kG)",
//     imgeUrl: "images/pic.png",
//     Preciototal: "\$4,800.000",
//     cantidad: "4",
//   ),
//
//
//
//
//
// ];
//
//
//
// class offerDetail{
// String imgeUrl;
// String videoTitle;
// String addres;
// String noOferta;
// String persoTotal;
// String Preciototal;
// String cantidad;
//
//
//
//
// offerDetail({
//   this.imgeUrl,
//   this.videoTitle,
//   this.addres,
//   this.noOferta,
//   this.persoTotal,
//   this.Preciototal,
//   this.cantidad,
//
//
// });
//
// }