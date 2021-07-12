import 'package:encuestas_tec/clases/modelo_formato_encuesta.dart';
import 'package:encuestas_tec/pages/encuestas/widgets/dropdown.dart';
import 'package:encuestas_tec/pages/encuestas/widgets/input_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Widget> listaDesajustesPisicofisicos(
    ModeloFormatoEncuesta modeloFormatoEncuesta) {
  return [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: DropDownWidged(
              onSaved: (value) => modeloFormatoEncuesta.doloresVientre = value,
              label: '¿Tienes dolores en el vientre?',
              items: <String>['Si', 'No'],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: DropDownWidged(
              onSaved: (value) => modeloFormatoEncuesta.hinchados = value,
              label: '¿Tienes los ojos hinchados?',
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
            child: DropDownWidged(
              onSaved: (value) => modeloFormatoEncuesta.doloresCabeza = value,
              label: '¿Tienes dolores de cabeza?',
              items: <String>['Si', 'No'],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: DropDownWidged(
              onSaved: (value) => modeloFormatoEncuesta.perdidaEquilibrio = value,
              label: '¿Tienes perdida de equilibrio?',
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
            child: DropDownWidged(
              onSaved: (value) => modeloFormatoEncuesta.fatiga = value,
              label: '¿Tienes fatiga?',
              items: <String>['Si', 'No'],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: DropDownWidged(
              onSaved: (value) => modeloFormatoEncuesta.perdidaVista = value,
              label: '¿Tienes perdida de vista?',
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
            child: DropDownWidged(
              onSaved: (value) => modeloFormatoEncuesta.dificultadesDormir = value,
              label: '¿Tienes dificultad para dormir?',
              items: <String>['Si', 'No'],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: DropDownWidged(
              onSaved: (value) => modeloFormatoEncuesta.pesadillas = value,
              label: '¿Tienes pesadillas?',
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
            child: DropDownWidged(
              onSaved: (value) => modeloFormatoEncuesta.incontinencia = value,
              label: '¿Tienes incontinencia?',
              items: <String>['Si', 'No'],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: DropDownWidged(
              onSaved: (value) => modeloFormatoEncuesta.tartamudeos = value,
              label: '¿Tienes tartamudeos?',
              items: <String>['Si', 'No'],
            ),
          ),
        ),
      ],
    ),
    DropDownWidged(
      onSaved: (value) => modeloFormatoEncuesta.miedosIntensos = value,
      label: '¿Tienes miedos intensos?',
      items: <String>['Si', 'No'],
    ),
  ];
}
