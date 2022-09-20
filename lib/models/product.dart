// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

class Product {
  Product({
    required this.direccionOrigen,
    required this.direccionDestino,
    required this.descripcion,
    required this.nombre,
    required this.apellido,
    required this.telefono,
    this.picture,
    this.id,
  });

  String direccionOrigen;
  String direccionDestino;
  String descripcion;
  String nombre;
  String? picture;
  String? id;
  String apellido;
  int telefono;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        direccionOrigen: json["direccionOrigen"],
        direccionDestino: json["direccionDestino"],
        descripcion: json["descripcion"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        telefono: json["telefono"],
        picture: json["picture"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "direccionOrigen": direccionOrigen,
        "direccionDestino": direccionDestino,
        "descripcion": descripcion,
        "nombre": nombre,
        "apellido": apellido,
        "telefono": telefono.toInt(),
        "picture": picture,
        "id": id,
      };
  Product copy() => Product(
        direccionOrigen: this.direccionOrigen,
        direccionDestino: this.direccionDestino,
        descripcion: this.descripcion,
        nombre: this.nombre,
        apellido: this.apellido,
        telefono: this.telefono,
        picture: this.picture,
        id: this.id,
      );
}
