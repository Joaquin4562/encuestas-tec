import 'package:encuestas_tec/clases/model_ficha_identificacion.dart';
import 'package:encuestas_tec/pages/encuestas/ficha_identificacion/services/ficha_services.dart';
import 'package:encuestas_tec/pages/encuestas/ficha_identificacion/widgets/lista_info_escolar.dart';
import 'package:encuestas_tec/pages/encuestas/ficha_identificacion/widgets/lsita_info_personal.dart';
import 'package:encuestas_tec/pages/global_widgets/custom_btn.dart';
import 'package:flutter/material.dart';

class FichaIdentificacionPage extends StatefulWidget {
  const FichaIdentificacionPage({Key? key}) : super(key: key);

  @override
  _FichaIdentificacionPageState createState() =>
      _FichaIdentificacionPageState();
}

class _FichaIdentificacionPageState extends State<FichaIdentificacionPage> {
  bool expandedPersonal = false;
  bool expandedEscolar = false;
  bool expandedHogar = false;
  bool isVisible = false;
  int _currentPage = 0;
  final _formKey = GlobalKey<FormState>();
  final PageController controller = PageController();
  ModeloFichaIdentificacion _modeloFicha = ModeloFichaIdentificacion();

  void _controllerListener() {
    setState(() {
      _currentPage = controller.page!.round();
    });
    if (controller.page == 1) {
      setState(() {
        isVisible = true;
      });
    } else {
      setState(() {
        isVisible = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(_controllerListener);
  }

  @override
  void dispose() {
    controller.removeListener(_controllerListener);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final time = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 0, 91, 160),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.east_rounded),
        label: Text('Terminar'),
        isExtended: isVisible,
        tooltip: 'Terminar',
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            var resp = postSurveyFicha(_modeloFicha.dataToJson());
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
              if (value!.error == true) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      value.message.toString(),
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(value.message.toString()),
                  ),
                );
                _formKey.currentState!.reset();
              }
            });
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Verifica los campos'),
              ),
            );
          }
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Ficha de identificación',
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
              CustomButton(
                onPressed: () {},
                label: 'Subir una foto',
                padding: 17,
                fillColor: Color.fromARGB(255, 80, 110, 255),
                icon: Icons.people,
                colorText: Colors.white,
                colorIcon: Colors.white,
              ),
              const SizedBox(
                height: 10,
              ),
              _buildPageView(),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    2,
                    (index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            controller.animateToPage(
                              index,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeOut,
                            );
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                          child: AnimatedContainer(
                            duration: Duration(microseconds: 500),
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.5,
                                color: Colors.blue,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              color: _currentPage == index
                                  ? Colors.blue
                                  : Colors.transparent,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageView() {
    final _scrollController = ScrollController();
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(10),
        ),
        height: 480,
        child: Form(
          key: _formKey,
          child: PageView(
            controller: controller,
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 25.0,
                    bottom: 10,
                    left: 10,
                    right: 10,
                  ),
                  child: Scrollbar(
                    controller: _scrollController,
                    isAlwaysShown: true,
                    child: ListView(
                      addAutomaticKeepAlives: true,
                      controller: _scrollController,
                      children: listaInfoPersonal(_modeloFicha),
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 25.0,
                    bottom: 10,
                    left: 10,
                    right: 10,
                  ),
                  child: Scrollbar(
                    controller: _scrollController,
                    isAlwaysShown: true,
                    child: ListView(
                      addAutomaticKeepAlives: true,
                      controller: _scrollController,
                      children: listaInfoEscolar(_modeloFicha),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
