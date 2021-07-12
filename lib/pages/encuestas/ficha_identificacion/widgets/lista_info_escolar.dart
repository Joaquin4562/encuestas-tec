import 'package:encuestas_tec/pages/encuestas/widgets/dropdown.dart';
import 'package:encuestas_tec/pages/encuestas/widgets/input_text.dart';
import 'package:flutter/cupertino.dart';

List<Widget> listaInfoEscolar(modeloFicha) {
  return [
    Text(
      'Informacion escolar',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold
      ),
    ),
    InputTextWidget(
      label: 'Institución de procedencia',
      onSaved: (value) {
        modeloFicha.institucionProcedencia = value;
      },
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: InputTextWidget(
              label: 'Especialidad',
              onSaved: (value) {
                modeloFicha.especialidad = value;
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: InputTextWidget(
              label: 'Promedio',
              onSaved: (value) {
                modeloFicha.promedio = value;
              },
            ),
          ),
        )
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: DropDownWidged(
              onSaved: (value) => modeloFicha.becado = value,
              label: '¿Estas becado?',
              items: <String>['si', 'no'],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: InputTextWidget(
              label: 'Tipo de beca',
              onSaved: (value) => modeloFicha.tipoBeca = value,
            ),
          ),
        )
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: DropDownWidged(
              onSaved: (value) => modeloFicha.trabaja = value,
              label: '¿Trabajas?',
              items: <String>['si', 'no'],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: InputTextWidget(
              label: 'Horario',
              onSaved: (value) => modeloFicha.direccionTrabajo = value,
            ),
          ),
        )
      ],
    ),
  ];
}
