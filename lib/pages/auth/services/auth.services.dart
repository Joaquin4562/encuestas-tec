
import 'package:dio/dio.dart';
import 'package:encuestas_tec/clases/response.api.dart';
import 'package:encuestas_tec/clases/response.sign-up.dart';
const URL = 'https://app-survey-backend.herokuapp.com/users/';
Future<ResponseAPI?> postSignIn(var body) async {
  try {
    final response = await Dio().post(URL + 'sign-in', data: body);
    if (response.statusCode == 200) {
      return ResponseAPI.fromJson(response.data);
    } else {
      throw Exception('Ocurrio un error en el servidor');
    }
  } catch (e) {
    print(e);
  }
}

Future<ResponseSignUp?> postSignUp(var body) async {
  try {
    final response = await Dio().post(URL + 'sign-up', data: body);
    if (response.statusCode == 200) {
      return ResponseSignUp.formJson(response.data);
    } else {
      throw Exception('Ocurrio un error en el servidor');
    }
  } catch (e) {
    print(e);
  }
}
