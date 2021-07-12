import 'package:dio/dio.dart';

const URL = 'https://app-survey-backend.herokuapp.com/surverys/ficha_identificacion/';
Future<ResponseSurver?> postSurveyFicha(var body) async {
  try {
    final response = await Dio().post(URL + 'new', data: body);
    if (response.statusCode == 200) {
      return ResponseSurver.fromJson(response.data);
    } else {
      throw Exception('Ocurrio un error en el servidor');
    }
  } catch (e) {
    print(e);
  }
}

Future<ResponseSurver?> getAllFichas() async {
  try {
    final response = await Dio().get(URL + 'get-all',);
    if (response.statusCode == 200) {
      return ResponseSurver.fromJson(response.data);
    } else {
      throw Exception('Ocurrio un error en el servidor');
    }
  } catch (e) {
    print(e);
  }
}

class ResponseSurver {
  bool? error;
  dynamic message;

  ResponseSurver({this.error, this.message});

  factory ResponseSurver.fromJson(Map<String, dynamic> json) {
    return ResponseSurver(
        error: json['error'],
        message: json['message'],
      );
  }
}