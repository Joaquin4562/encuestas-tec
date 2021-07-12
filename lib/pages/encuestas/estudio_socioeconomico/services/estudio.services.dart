import 'package:dio/dio.dart';
import 'package:encuestas_tec/pages/encuestas/ficha_identificacion/services/ficha_services.dart';

const URL = 'https://app-survey-backend.herokuapp.com/surverys/estudio_socioeconomico/';
Future<ResponseSurver?> postSurveyEstudio(var body) async {
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