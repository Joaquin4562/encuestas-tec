class Familia {
  String? parentesco;
  String? nombre;
  String? telefono;
  String? edad;
  String? gradoAcademico;

  Familia({
    this.edad,
    this.gradoAcademico,
    this.nombre,
    this.parentesco,
    this.telefono,
  });


  Map<String, dynamic> toJson() {
    return {
      'edad' : edad,
      'grado_academico' : gradoAcademico,
      'nombre' : nombre,
      'parentesco' : parentesco,
      'telefono' : telefono,
    };
  }
}