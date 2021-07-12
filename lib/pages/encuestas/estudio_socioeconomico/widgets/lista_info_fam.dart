import 'package:encuestas_tec/clases/modelo_estudio_socioeconomico.dart';
import 'package:encuestas_tec/clases/modelo_familia.dart';
import 'package:encuestas_tec/pages/encuestas/widgets/dropdown.dart';
import 'package:encuestas_tec/pages/encuestas/widgets/input_text.dart';
import 'package:encuestas_tec/pages/global_widgets/custom_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Widget> listaInfoFamilia(ModeloEstudioSocioeconomico modeloEstudio, VoidCallback? onPress(Familia fam)) {
  Familia _modeloFamilia = Familia();

  return [
    DropDownWidged(
      onSaved: (value) => _modeloFamilia.parentesco = value,
      label: 'Familiar',
      items: <String>['Padre', 'Madre', 'Hijo', 'Hermano', 'Otro'],
    ),
    InputTextWidget(
      label: 'Nombre completo',
      onSaved: (value) => _modeloFamilia.nombre = value,
    ),
    InputTextWidget(
      label: 'Numero de telefono',
      onSaved: (value) => _modeloFamilia.telefono = value,
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: InputTextWidget(
              label: 'Edad',
              onSaved: (value) => _modeloFamilia.edad = value,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
            child: DropDownWidged(
              onSaved: (value) => _modeloFamilia.gradoAcademico = value,
              label: 'Grado academico',
              items: <String>[
                'Primaria',
                'Secundaria',
                'Preparatoria',
                'Universidad',
                'Otro'
              ],
            ),
          ),
        )
      ],
    ),
    Padding(
      padding: const EdgeInsets.all(14.0),
      child: CustomButton(
        onPressed: () {
          onPress(_modeloFamilia);
        },
        label: 'Registrar',
        ftShadow: true,
        padding: 15,
        colorText: Colors.white,
        icon: Icons.person_add,
        colorIcon: Colors.white,
        fillColor: Color.fromARGB(255, 0, 91, 160),
      ),
    ),
  ];
}
