class OfferModel{

  String imgeUrl;
  String videoTitle;
  String videoLink;
  String addres;
  int noOferta;
  int persoTotal;
  int Preciototal;
  int cantidad;

  int incrementoPuja;
  double precioKilo;
  int pujaActual;
  String observaciones;
  int precioAnimal;
  int pesoPro;
  int precioTotal;

  OfferModel({
      this.imgeUrl,
      this.videoTitle,
      this.videoLink,
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
      this.precioTotal});

  factory OfferModel.fromMap(Map map) {
    return new OfferModel(
      imgeUrl: map['imgeUrl'] as String,
      videoTitle: map['videoTitle'] as String,
      videoLink: map['videoLink'] as String,
      addres: map['addres'] as String,
      noOferta: map['noOferta'] as int,
      persoTotal: map['persoTotal'] as int,
      Preciototal: map['Preciototal'] as int,
      cantidad: map['cantidad'] as int,
      incrementoPuja: map['incrementoPuja'] as int,
      precioKilo: map['precioKilo'] as double,
      pujaActual: map['pujaActual'] as int,
      observaciones: map['observaciones'] as String,
      precioAnimal: map['precioAnimal'] as int,
      pesoPro: map['pesoPro'] as int,
      precioTotal: map['precioTotal'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'imgeUrl': this.imgeUrl,
      'videoTitle': this.videoTitle,
      'videoLink': this.videoLink,
      'addres': this.addres,
      'noOferta': this.noOferta,
      'persoTotal': this.persoTotal,
      'Preciototal': this.Preciototal,
      'cantidad': this.cantidad,
      'incrementoPuja': this.incrementoPuja,
      'precioKilo': this.precioKilo,
      'pujaActual': this.pujaActual,
      'observaciones': this.observaciones,
      'precioAnimal': this.precioAnimal,
      'pesoPro': this.pesoPro,
      'precioTotal': this.precioTotal,
    } as Map<String, dynamic>;
  }
}