import 'package:encuestas_tec/clases/auth.models.dart';
import 'package:encuestas_tec/pages/auth/services/auth.services.dart';
import 'package:encuestas_tec/pages/encuestas/widgets/input_text.dart';
import 'package:encuestas_tec/pages/global_widgets/custom_btn.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final modelRegistro = UserRegister();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
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
                    'Registro',
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
                    onSaved: (value) => modelRegistro.usuario = value,
                  ),
                  InputTextWidget(
                    label: 'Contraseña:',
                    textColor: Colors.white,
                    onSaved: (value) => modelRegistro.contrasena = value,
                  ),
                  InputTextWidget(
                    label: 'Repetir contraseña:',
                    textColor: Colors.white,
                    onSaved: (value) => modelRegistro.repContrasena = value,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        if (modelRegistro.contrasena ==
                            modelRegistro.repContrasena) {
                          var resp = postSignUp(modelRegistro.dataToJson());
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
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(value!.message.toString()),
                              ),
                            );
                            Navigator.pushReplacementNamed(context, 'login');
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Las contraseñas no coinciden'),
                            ),
                          );
                        }
                      }
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
