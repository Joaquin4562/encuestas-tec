import 'dart:convert';
class ModeloFichaIdentificacion {
  String? nombreCompleto;
  String? telefono;
  String? numControl;
  String? facebook;
  String? semestre;
  String? correo;
  String? sexo;
  String? edad;
  String? peso;
  String? estadoCivil;
  String? fechaNacimiento;
  String? noHijos;
  String? calle;
  String? colonia;
  String? delegacion;
  String? numeroInt;
  String? numeroExt;
  String? lugarNacimiento;
  String? codigoPostal;
  String? institucionProcedencia;
  String? especialidad;
  String? promedio;
  String? becado;
  String? tipoBeca;
  String? trabaja;
  String? direccionTrabajo;



  ModeloFichaIdentificacion(
      {this.nombreCompleto,
      this.telefono,
      this.numControl,
      this.facebook,
      this.semestre,
      this.correo,
      this.sexo,
      this.edad,
      this.estadoCivil,
      this.fechaNacimiento,
      this.peso,
      this.lugarNacimiento,
      this.delegacion,
      this.calle,
      this.colonia,
      this.numeroExt,
      this.numeroInt,
      this.codigoPostal,
      this.noHijos,
      this.becado,
      this.direccionTrabajo,
      this.especialidad,
      this.institucionProcedencia,
      this.promedio,
      this.tipoBeca,
      this.trabaja,
    });

  dataToJson() {
    return jsonEncode(
      {
      'nombre' : nombreCompleto,
      'telefono' : telefono,
      'numero_control' : numControl,
      'facebook' : facebook,
      'semestre' : semestre,
      'correo' : correo,
      'sexo' : sexo,
      'edad' : edad,
      'estado_civil' : estadoCivil,
      'fecha_nacimiento' : fechaNacimiento,
      'peso': peso,
      'lugar_nacimiento' : lugarNacimiento,
      'delegacion_mpio' : delegacion,
      'calle' : calle,
      'colonia' : colonia,
      'num_exterior' : numeroExt,
      'num_interior' : numeroInt,
      'codigo_postal' : codigoPostal,
      'num_hijos' : noHijos,
      'becado' : becado,
      'direccion_trabajo' : direccionTrabajo,
      'especialidad' : especialidad,
      'institucion_procedencia' : institucionProcedencia,
      'promedio' : promedio,
      'tipo_beca' : tipoBeca,
      'trabaja' : trabaja,
      }
    );
  }
}
