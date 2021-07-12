import 'package:encuestas_tec/clases/modelo_formato_encuesta.dart';
import 'package:encuestas_tec/pages/encuestas/widgets/dropdown.dart';
import 'package:encuestas_tec/pages/encuestas/widgets/input_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Widget> listaIntegracionFamiliar(
    ModeloFormatoEncuesta modeloFormatoEncuesta) {
  return [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: DropDownWidged(
              onSaved: (value) => modeloFormatoEncuesta.relacionFamilia = value,
              label: '¿Como es tu relacion con tu familia?',
              items: <String>['Buena', 'Mala'],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: DropDownWidged(
              onSaved: (value) => modeloFormatoEncuesta.dificultades = value,
              label: '¿Hay dificultades?',
              items: <String>['Si', 'No'],
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
              label: 'Menciona las dificultades',
              onSaved: (value) =>
                  modeloFormatoEncuesta.tipoDificultades = value,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: InputTextWidget(
              label: 'Menciona la actitud de tu famiulia',
              onSaved: (value) => modeloFormatoEncuesta.actitudFamilia = value,
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
            child: DropDownWidged(
              onSaved: (value) => modeloFormatoEncuesta.relacionPadre = value,
              label: '¿Como es la relacion con tu padre?',
              items: <String>['Buena', 'Mala'],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: InputTextWidget(
              label: 'Menciona la actitud de tu padre',
              onSaved: (value) => modeloFormatoEncuesta.acitudPadre = value,
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
            child: DropDownWidged(
              onSaved: (value) => modeloFormatoEncuesta.relacionMadre = value,
              label: '¿Como es la relacion con tu madre?',
              items: <String>['Buena', 'Mala'],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: InputTextWidget(
              label: 'Menciona la actitud de tu madre',
              onSaved: (value) => modeloFormatoEncuesta.actitudMadre = value,
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
            child: DropDownWidged(
              onSaved: (value) => modeloFormatoEncuesta.relacionMadre = value,
              label: '¿Como es la relacion con tu madre?',
              items: <String>['Buena', 'Mala'],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: InputTextWidget(
              label: 'Menciona la actitud de tu madre',
              onSaved: (value) => modeloFormatoEncuesta.actitudMadre = value,
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
            child: DropDownWidged(
              onSaved: (value) =>
                  modeloFormatoEncuesta.ligadoAfectivamente = value,
              label: '¿Estas ligado afectivamente a tu familia?',
              items: <String>['Si', 'No'],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: InputTextWidget(
              label: '¿Quien interfirio en tus estudios?',
              onSaved: (value) =>
                  modeloFormatoEncuesta.decisionEstudiar = value,
            ),
          ),
        ),
      ],
    ),
    InputTextWidget(
      label: 'Mencione otro dato familiar',
      onSaved: (value) => modeloFormatoEncuesta.otroDatoFamiliar = value,
    ),
  ];
}
