import 'package:encuestas_tec/pages/auth/login.dart';
import 'package:encuestas_tec/pages/auth/sign-up.dart';
import 'package:encuestas_tec/pages/encuestas/estudio_socioeconomico/estudio_socioeconomico.dart';
import 'package:encuestas_tec/pages/encuestas/ficha_identificacion/ficha_identificacion.dart';
import 'package:encuestas_tec/pages/encuestas/formato_encuesta/FormatoEncuesta.dart';
import 'package:encuestas_tec/pages/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'login',
      routes: {
        'home': (_) => HomePage(),
        'ficha_identificacion': (context) => FichaIdentificacionPage(),
        'login': (_) => LoginPage(),
        'sign-up': (_) => SignUpPage(),
        'estudio_socioeconomico': (_) => EstudioSocioeconomicoPage(),
        'formato_encuesta': (_) => FormatoEncuestaPage()
      },
    );
  }
}
