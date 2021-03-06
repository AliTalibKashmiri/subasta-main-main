import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


String noOferta = "171";
String perso_Total = "192(KG)";
String cantidad = "1";
String precio_Total = "\$9,600.000";


List offersList = [

  offerDetail(
      videoTitle:"Sultans dine",
      addres:"Kingdom Tower, Brazil",
      noOferta:"171",
      persoTotal: "192(kG)",
      imgeUrl: "images/pic.png",
      Preciototal: "\$9,600.000",
      cantidad: "1",

      incrementoPuja: "\$9,600",
      precioKilo: "33",
      pujaActual: "\$9,600",
      precioAnimal: "\$9,600",
      pesoPro: "--",
      precioTotal: "\$9,600",
      observaciones: "Lorem ipsum is a placeholder text commonly used to "
          "demonstrate the visual form of a document or a typeface without "
          "relying on meaningful content. Lorem ipsum may be used as a placeholder "
          "before final copy is available.",
  ),

];

class offerDetail{
  String imgeUrl;
  String videoTitle;
  String addres;
  String noOferta;
  String persoTotal;
  String Preciototal;
  String cantidad;

  String incrementoPuja;
  String precioKilo;
  String pujaActual;
  String observaciones;
  String precioAnimal;
  String pesoPro;
  String precioTotal;


  offerDetail({
    this.imgeUrl,
    this.videoTitle,
    this.addres,
    this.noOferta,
    this.persoTotal,
    this.Preciototal,
    this.cantidad,


    this.incrementoPuja,
    this.precioKilo,
    this.pujaActual,
    this.observaciones,
    this.precioAnimal,
    this.pesoPro,
    this.precioTotal
  });

}