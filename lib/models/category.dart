import 'dart:convert';

class Category {
    Category({
        required this.id,
        required this.nombre,
        required this.usuario,
    });

    String id;
    String nombre;
    Usuario usuario;

    factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["_id"],
        nombre: json["nombre"],
        usuario: Usuario.fromMap(json["usuario"]),
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "nombre": nombre,
        "usuario": usuario.toMap(),
    };
}

class Usuario {
    Usuario({
        required this.id,
        required this.nombre,
    });

    String id;
    String nombre;

    factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        id: json["_id"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "nombre": nombre,
    };
}
