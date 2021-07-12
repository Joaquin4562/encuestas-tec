import 'package:encuestas_tec/clases/modelo_estudio_socioeconomico.dart';
import 'package:encuestas_tec/clases/modelo_familia.dart';
import 'package:encuestas_tec/pages/encuestas/estudio_socioeconomico/services/estudio.services.dart';
import 'package:encuestas_tec/pages/encuestas/estudio_socioeconomico/widgets/lista_info_fam.dart';
import 'package:encuestas_tec/pages/encuestas/estudio_socioeconomico/widgets/lista_info_hogar.dart';
import 'package:encuestas_tec/pages/encuestas/ficha_identificacion/services/ficha_services.dart';
import 'package:encuestas_tec/pages/encuestas/widgets/dropdown.dart';
import 'package:encuestas_tec/pages/encuestas/widgets/dropdown.ficha.dart';
import 'package:encuestas_tec/pages/global_widgets/custom_btn.dart';
import 'package:flutter/material.dart';

class EstudioSocioeconomicoPage extends StatefulWidget {
  const EstudioSocioeconomicoPage({Key? key}) : super(key: key);

  @override
  _EstudioSocioeconomicoPageState createState() =>
      _EstudioSocioeconomicoPageState();
}

class _EstudioSocioeconomicoPageState extends State<EstudioSocioeconomicoPage> {
  bool expandedHogar = false;
  bool expandedFamilia = false;
  final _formKey = GlobalKey<FormState>();
  final _formKeyFam = GlobalKey<FormState>();
  final _formKeyFicha = GlobalKey<FormState>();
  ModeloEstudioSocioeconomico _modeloEstudio = ModeloEstudioSocioeconomico();
  List<Familia> listdoFamilia = [];
  @override
  Widget build(BuildContext context) {
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
                'Estudio socioeconomico',
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
                key: _formKeyFicha,
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
                                _modeloEstudio.idFichaIdentificacion = value;
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
              _buildPanel(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: CustomButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (listdoFamilia.length > 0) {
                        _formKey.currentState!.save();
                        _formKeyFicha.currentState!.save();
                        _modeloEstudio.listaFamiliares = listdoFamilia;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Procesando data...'),
                          ),
                        );
                        var res =
                            postSurveyEstudio(_modeloEstudio.toJsonData());
                        res.then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(value!.message.toString()),
                            ),
                          );
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Registra por lo menos a un familiar'),
                          ),
                        );
                      }
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

  Widget _buildPanel() {
    return ExpansionPanelList(
      elevation: 0,
      dividerColor: Colors.blue[50],
      expandedHeaderPadding: EdgeInsets.only(top: 20),
      animationDuration: Duration(milliseconds: 300),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          if (index == 0) {
            expandedFamilia = !isExpanded;
          } else {
            expandedHogar = !isExpanded;
          }
        });
      },
      children: [
        ExpansionPanel(
          backgroundColor: Colors.blue[50],
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              dense: true,
              title: Text(
                'Datos de familia',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              subtitle: Text('3/10'),
            );
          },
          body: Form(
            key: _formKeyFam,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: listaInfoFamilia(
                  _modeloEstudio,
                  (familia) {
                    if (_formKeyFam.currentState!.validate()) {
                      listdoFamilia.add(familia);
                      _formKeyFam.currentState!.save();
                      _formKeyFam.currentState?.reset();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Se registro el familiar'),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Rellena todos los campos'),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          isExpanded: expandedFamilia,
        ),
        ExpansionPanel(
          backgroundColor: Colors.blue[50],
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              dense: true,
              title: Text(
                'Datos del hogar',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              subtitle: Text('2/${listaInfoHogar(_modeloEstudio).length}'),
            );
          },
          body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(children: listaInfoHogar(_modeloEstudio)),
            ),
          ),
          isExpanded: expandedHogar,
        ),
      ],
    );
  }
}
