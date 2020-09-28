import 'package:cloud_firestore/cloud_firestore.dart';

class Capital {
  num altitud;
  GeoPoint coordenadasGeograficas;
  String coverCapital;
  String horario;
  String idCapital;
  List<String> imagenesCapital;
  int likes;
  String nombreCapital;
  String nombrePais;
  int poblacion;
  String referenciaInformativa;
  String resenaHistorica;
  num superficie;
  num temperaturaMediaAnual;

  // Constructor
  Capital();

  /// Metodo para parsear la clase [Capital] a partir de un objeto JSON
  Capital.parse(dynamic json) {
    this.altitud = json['Altitud'];
    this.coordenadasGeograficas = json['CoordenadasGeograficas'];
    this.coverCapital = json['CoverCapital'];
    this.horario = json["horario"];
    this.idCapital = json["ID"];
    this.imagenesCapital = new List<String>();
    json["Imagenes"].forEach((imagen) {
      this.imagenesCapital.add(imagen);
    });
    this.likes = json['Likes'];
    this.nombreCapital = json['NombreCapital'];
    this.nombrePais = json['NombrePais'];
    this.poblacion = json['Poblacion'];
    this.referenciaInformativa = json['ReferenciaInformativa'];
    this.resenaHistorica = json['ResenaHistorica'];
    this.superficie = json['Superficie'];
    this.temperaturaMediaAnual = json['TemperaturaMediaAnual'];
  }

  /// Metodo para convertir la clase [Capital] a un objeto JSON
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = new Map<String, dynamic>();

    json['Altitud'] = this.altitud;
    json['CoordenadasGeograficas'] = this.coordenadasGeograficas;
    json['CoverCapital'] = this.coverCapital;
    json["horario"] = this.horario;
    json["ID"] = this.idCapital;
    json["Imagenes"] = this.imagenesCapital;
    json['Likes'] = this.likes;
    json['NombreCapital'] = this.nombreCapital;
    json['NombrePais'] = this.nombrePais;
    json['Poblacion'] = this.poblacion;
    json['ReferenciaInformativa'] = this.referenciaInformativa;
    json['ResenaHistorica'] = this.resenaHistorica;
    json['Superficie'] = this.superficie;
    json['TemperaturaMediaAnual'] = this.temperaturaMediaAnual;

    return json;
  }
}
