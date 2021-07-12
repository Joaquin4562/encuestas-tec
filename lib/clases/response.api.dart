class ResponseAPI {
  bool? error;
  dynamic? message;
  User? data;

  ResponseAPI({this.error, this.message, this.data});

  factory ResponseAPI.fromJson(Map<String, dynamic> json) {
    if (json['error'] == true) {
      return ResponseAPI(
        error: json['error'],
        message: json['message'],
      );
    } else {
      return ResponseAPI(
        error: json['error'],
        message: json['message'],
        data: User.formJson(json['data']),
      );
    }
  }
}

class User {
  String? usuario;
  String? rol;
  String? id;

  User({this.usuario, this.id, this.rol});

  factory User.formJson(Map<String, dynamic> json) {
    return User(id: json['id'], rol: json['rol'], usuario: json['usuario']);
  }
}
