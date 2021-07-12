
import 'package:encuestas_tec/pages/encuestas/widgets/dropdown.dart';
import 'package:encuestas_tec/pages/encuestas/widgets/input_text.dart';
import 'package:flutter/cupertino.dart';

List<Widget> listaInfoPersonal(modeloFicha) {
  return [
    Text(
      'Informacion personal',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold
      ),
    ),
    InputTextWidget(
      label: 'Nombre completo',
      onSaved: (value) {
        modeloFicha.nombreCompleto = value;
      },
    ),
    InputTextWidget(
      label: 'Facebook',
      onSaved: (value) {
        modeloFicha.facebook = value;
      },
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: InputTextWidget(
              label: 'Numero de control',
              onSaved: (value) {
                modeloFicha.numControl = value;
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: DropDownWidged(
              onSaved: (value) {
                modeloFicha.semestre = value;
              },
              label: 'Semestre',
              items: <String>[
                'primero',
                'segundo',
                'tercero',
                'cuarto',
                'quinto',
                'sexto',
                'septimo',
                'octavo',
                'noveno'
              ],
            ),
          ),
        )
      ],
    ),
    InputTextWidget(
      label: 'Correo electronico',
      onSaved: (value) {
        modeloFicha.correo = value;
      },
    ),
    InputTextWidget(
      label: 'Numero de telefono',
      onSaved: (value) {
        modeloFicha.telefono = value;
      },
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: DropDownWidged(
              onSaved: (value) => modeloFicha.sexo = value,
              label: 'Sexo',
              items: <String>['Masculino', 'Femenino'],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: InputTextWidget(
              label: 'Edad',
              onSaved: (value) => modeloFicha.edad = value,
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
              label: 'N° hijos',
              onSaved: (value) {
                modeloFicha.noHijos = value;
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: DropDownWidged(
              onSaved: (value) {
                modeloFicha.estadoCivil = value;
              },
              label: 'Estado civil',
              items: <String>['Soltero', 'Casado'],
            ),
          ),
        )
      ],
    ),
    InputTextWidget(
      label: 'Peso',
      onSaved: (value) {
        modeloFicha.peso = value;
      },
    ),
    InputTextWidget(
      label: 'Fecha de nacimineto',
      onSaved: (value) {
        modeloFicha.fechaNacimiento = value;
      },
    ),
    InputTextWidget(
      label: 'Lugar de nacimiento',
      onSaved: (value) {
        modeloFicha.lugarNacimiento = value;
      },
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: InputTextWidget(
              label: 'Codigo postal',
              onSaved: (value) {
                modeloFicha.codigoPostal = value;
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: InputTextWidget(
              label: 'Municipio',
              onSaved: (value) {
                modeloFicha.delegacion = value;
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
              label: 'Colonia',
              onSaved: (value) {
                modeloFicha.colonia = value;
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: InputTextWidget(
              label: 'Calle',
              onSaved: (value) {
                modeloFicha.calle = value;
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
              label: 'No interior',
              onSaved: (value) {
                modeloFicha.numeroInt = value;
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: InputTextWidget(
              label: 'No exterior',
              onSaved: (value) {
                modeloFicha.numeroExt = value;
              },
            ),
          ),
        )
      ],
    ),
  ];
}
