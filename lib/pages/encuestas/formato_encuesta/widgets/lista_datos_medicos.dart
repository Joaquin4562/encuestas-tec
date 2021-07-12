import 'package:encuestas_tec/clases/modelo_estudio_socioeconomico.dart';
import 'package:encuestas_tec/clases/modelo_familia.dart';
import 'package:encuestas_tec/clases/modelo_formato_encuesta.dart';
import 'package:encuestas_tec/pages/encuestas/widgets/dropdown.dart';
import 'package:encuestas_tec/pages/encuestas/widgets/input_text.dart';
import 'package:encuestas_tec/pages/global_widgets/custom_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Widget> listaDatosMedicos(ModeloFormatoEncuesta modeloFormatoEncuesta) {
  return [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: InputTextWidget(
              label: '¿Padeces de alguna deficiencia?',
              onSaved: (value) => modeloFormatoEncuesta.deficiencia = value,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: InputTextWidget(
              label: '¿Padeces de alguna enfermedad cronica?',
              onSaved: (value) =>
                  modeloFormatoEncuesta.enfermedadCronica = value,
            ),
          ),
        ),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: InputTextWidget(
              label: '¿Que medicamentos consumes?',
              onSaved: (value) => modeloFormatoEncuesta.medicamentos = value,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: DropDownWidged(
              onSaved: (value) => modeloFormatoEncuesta.horario = value,
              label: '¿En que horario?',
              items: <String>['Por la mañana', 'Por la tarde', 'Por la noche'],
            ),
          ),
        ),
      ],
    ),
  ];
}
