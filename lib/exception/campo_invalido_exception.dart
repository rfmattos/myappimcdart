class CampoInvalidoException implements Exception {
  String error() => "Campo invalido";
  @override
  String toString() {
    return "CampoInvalidoException ${error()}";
  }
}
