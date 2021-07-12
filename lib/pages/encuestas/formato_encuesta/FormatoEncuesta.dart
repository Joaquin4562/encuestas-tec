import 'package:encuestas_tec/clases/listData.dart';
import 'package:encuestas_tec/clases/modelo_estudio_socioeconomico.dart';
import 'package:encuestas_tec/clases/modelo_familia.dart';
import 'package:encuestas_tec/clases/modelo_formato_encuesta.dart';
import 'package:encuestas_tec/pages/encuestas/estudio_socioeconomico/services/estudio.services.dart';
import 'package:encuestas_tec/pages/encuestas/estudio_socioeconomico/widgets/lista_info_fam.dart';
import 'package:encuestas_tec/pages/encuestas/estudio_socioeconomico/widgets/lista_info_hogar.dart';
import 'package:encuestas_tec/pages/encuestas/ficha_identificacion/services/ficha_services.dart';
import 'package:encuestas_tec/pages/encuestas/formato_encuesta/widgets/lista_datos_medicos.dart';
import 'package:encuestas_tec/pages/encuestas/formato_encuesta/widgets/lista_integracion_familiar.dart';
import 'package:encuestas_tec/pages/encuestas/formato_encuesta/widgets/lsita_desajustes.dart';
import 'package:encuestas_tec/pages/encuestas/widgets/dropdown.dart';
import 'package:encuestas_tec/pages/encuestas/widgets/dropdown.ficha.dart';
import 'package:encuestas_tec/pages/global_widgets/custom_btn.dart';
import 'package:flutter/material.dart';

class FormatoEncuestaPage extends StatefulWidget {
  const FormatoEncuestaPage({Key? key}) : super(key: key);

  @override
  _FormatoEncuestaPageState createState() => _FormatoEncuestaPageState();
}

class _FormatoEncuestaPageState extends State<FormatoEncuestaPage> {
  bool expandedMedicos = false;
  bool expandedDesajustes = false;
  bool expandedAreaInegracionFamiliar = false;
  bool expandedAreaInegracionSocial = false;
  bool expandedAreaInegracionPiscopedagogico = false;
  bool expandedCaracteristicasPersonales = false;
  bool expandedPlanDeVida = false;

  final _keyDatosMedicos = GlobalKey<FormState>();
  final _keyDesajustes = GlobalKey<FormState>();
  final _keyIntegracionFamilia = GlobalKey<FormState>();
  final _keyIntegracionSocial = GlobalKey<FormState>();
  final _keyIntegracionPedagogico = GlobalKey<FormState>();
  final _formKeyFormatoEncuesta = GlobalKey<FormState>();
  final modeloFormatoEncuesta = ModeloFormatoEncuesta();
  List<Familia> listdoFamilia = [];
  @override
  Widget build(BuildContext context) {
    final listaDatos = [
      ListData(
        globalKey: _keyDatosMedicos,
        header: 'Datos Medicos',
        listaDatos: listaDatosMedicos(modeloFormatoEncuesta),
      ),
      ListData(
        globalKey: _keyDesajustes,
        header: 'Desajustes psicofisicos',
        listaDatos: listaDesajustesPisicofisicos(modeloFormatoEncuesta),
      ),
      ListData(
        globalKey: _keyIntegracionFamilia,
        header: 'Integracion familiar',
        listaDatos: listaIntegracionFamiliar(modeloFormatoEncuesta),
      ),
    ];
    final time = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 0, 91, 160),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: Column(
            children: [
              Text(
                'Formato encuesta',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 100),
                child: SizedBox(
                  height: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    '${time.day}/${time.month}/${time.year}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: _formKeyFormatoEncuesta,
                child: FutureBuilder<ResponseSurver?>(
                    future: getAllFichas(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.error == true) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: DropDownWidged(
                              label: 'Ficha de identificación',
                              items: ['Ocurrio un error'],
                            ),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: DropDownWidgedFicha(
                              label: 'Ficha de identificación',
                              items: snapshot.data!.message,
                              onSaved: (value) {
                                modeloFormatoEncuesta.fichaIdentificacion =
                                    value;
                              },
                            ),
                          );
                        }
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              ExpansionPanelList(
                elevation: 0,
                dividerColor: Colors.blue[50],
                expandedHeaderPadding: EdgeInsets.only(top: 20),
                animationDuration: Duration(milliseconds: 300),
                children: listaDatos.map((item) {
                  return ExpansionPanel(
                    backgroundColor: Colors.blue[50],
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        dense: true,
                        title: Text(
                          item.header,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text('3/10'),
                      );
                    },
                    body: Form(
                      key: item.globalKey,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: item.listaDatos,
                        ),
                      ),
                    ),
                    isExpanded: true,
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: CustomButton(
                  onPressed: () {
                    if (_formKeyFormatoEncuesta.currentState!.validate()) {
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Rellena los datos de forma correcta'),
                        ),
                      );
                    }
                  },
                  label: 'Terminar',
                  padding: 15,
                  colorText: Colors.white,
                  icon: Icons.exit_to_app,
                  colorIcon: Colors.white,
                  fillColor: Color.fromARGB(255, 0, 91, 160),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
