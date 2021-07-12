import 'dart:convert';

import 'package:encuestas_tec/clases/modelo_familia.dart';

class ModeloEstudioSocioeconomico {
  //info hogar
  String? ingresoMensual;
  String? tipoDeHogar;
  String? materialHogar;
  String? gastoMensual;
  String? cubreGasto;
  String? dineroRecibido;
  String? idFichaIdentificacion;

  //info familiares
  List<Familia>? listaFamiliares;

  ModeloEstudioSocioeconomico({
    this.cubreGasto,
    this.dineroRecibido,
    this.gastoMensual,
    this.ingresoMensual,
    this.materialHogar,
    this.tipoDeHogar,
    this.listaFamiliares,
    this.idFichaIdentificacion
  });


  toJsonData() {
    return jsonEncode({
      'ingreso_mensual' : ingresoMensual,
      'tipo_vivienda' :   tipoDeHogar,
      'material_vivienda' :   materialHogar,
      'gastos_mensuales' :   gastoMensual,
      'cubre_gastos' :   cubreGasto,
      'dinero_padres' :   dineroRecibido,
      'id_ficha_identificacion': idFichaIdentificacion,
      'lista_familiares': listaFamiliares!.map((e) => e.toJson()).toList()
    });
  }
}
