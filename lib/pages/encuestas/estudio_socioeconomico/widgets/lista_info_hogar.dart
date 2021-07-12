import 'package:encuestas_tec/clases/modelo_estudio_socioeconomico.dart';
import 'package:encuestas_tec/pages/encuestas/widgets/dropdown.dart';
import 'package:encuestas_tec/pages/encuestas/widgets/input_text.dart';
import 'package:flutter/cupertino.dart';

List<Widget> listaInfoHogar(ModeloEstudioSocioeconomico modeloEstudio) {
  return [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: InputTextWidget(
              label: 'Ingreso mensual',
              onSaved: (value) {
                modeloEstudio.ingresoMensual = value;
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: InputTextWidget(
              label: 'Gastos mensuales',
              onSaved: (value) {
                modeloEstudio.gastoMensual = value;
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
            child: InputTextWidget(
              label: 'Tipo de vivienda',
              onSaved: (value) => modeloEstudio.tipoDeHogar = value,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: DropDownWidged(
              onSaved: (value) => modeloEstudio.materialHogar = value,
              label: '¿Material de está?',
              items: <String>['Lamina', 'Concreto', 'Ladrillo', 'Block'],
            ),
          ),
        ),
      ],
    ),
    Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Tus gastos...',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: DropDownWidged(
              onSaved: (value) => modeloEstudio.cubreGasto = value,
              label: '¿Quien los cubre?',
              items: <String>['Padre', 'Madre', 'Yo', 'Familiar', 'Tutor'],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: InputTextWidget(
              label: '¿Cuanto dinero es?',
              onSaved: (value) => modeloEstudio.dineroRecibido = value,
            ),
          ),
        )
      ],
    ),
  ];
}
