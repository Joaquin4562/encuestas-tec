import 'package:encuestas_tec/clases/auth.models.dart';
import 'package:encuestas_tec/pages/auth/services/auth.services.dart';
import 'package:encuestas_tec/pages/encuestas/widgets/input_text.dart';
import 'package:encuestas_tec/pages/global_widgets/custom_btn.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final userModel = User();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 80, 110, 255),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Inicio de sesión',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image(
                      image: AssetImage('assets/work.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  InputTextWidget(
                    label: 'Nombre de usuario:',
                    textColor: Colors.white,
                    onSaved: (value) => userModel.username = value,
                  ),
                  InputTextWidget(
                      isPassword: true,
                      label: 'Contraseña:',
                      textColor: Colors.white,
                      onSaved: (value) => userModel.passowrd = value),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        var resp = postSignIn(userModel.dataToJSON());
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('cargando...'),
                                  Icon(
                                    Icons.access_time,
                                    color: Colors.white,
                                    size: 30,
                                  )
                                ],
                              ),
                            ),
                          );
                        resp.then((value) {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          if (value!.error == true) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(value.message),
                              ),
                            );
                          } else {
                            Navigator.pushReplacementNamed(context, 'home');
                          }
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Rellena los campos'),
                          ),
                        );
                      }
                    },
                    fillColor: Colors.white,
                    ftShadow: true,
                    icon: Icons.login_outlined,
                    colorIcon: const Color.fromARGB(255, 0, 91, 160),
                    colorText: const Color.fromARGB(255, 0, 91, 160),
                    label: 'Iniciar sesión',
                    padding: 12.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: const SizedBox(
                      child: Text(
                        'O',
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  CustomButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'sign-up');
                    },
                    fillColor: Colors.white,
                    ftShadow: true,
                    icon: Icons.login_outlined,
                    colorIcon: const Color.fromARGB(255, 0, 91, 160),
                    colorText: const Color.fromARGB(255, 0, 91, 160),
                    label: 'Registrarse',
                    padding: 12.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
