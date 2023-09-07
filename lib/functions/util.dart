import 'dart:convert';
import 'dart:io';
import 'package:myappimcdart/exception/campo_invalido_exception.dart';

class Util {
  static String lerStringTexto(String texto) {
    print(texto);
    return lerString();
  }

  static String lerString() {
    String linha = stdin.readLineSync(encoding: utf8) ?? "";
    if (linha.trim() == "") {
      throw CampoInvalidoException();
    } else {
      return linha;
    }
  }

  static double lerDouble() {
    var value = lerString();
    try {
      double valor = double.parse(value);
      if (valor == 0) {
        throw CampoInvalidoException();
      }
      return valor.isNaN ? throw CampoInvalidoException() : valor;
    } catch (e) {
      throw CampoInvalidoException();
    }
  }

  static double lerDoubleTexto(texto) {
    print(texto);
    return lerDouble();
  }

  static double calculaIMC(double peso, double altura) {
    return (peso / ((altura / 100) * (altura / 100)));
  }

  static String classificacaoIMC(double peso, double altura) {
    double imc = calculaIMC(peso, altura);
    switch (imc) {
      case < 16:
        return "${imc.toStringAsFixed(2)} - Magreza grave";
      case >= 16 && < 17:
        return "${imc.toStringAsFixed(2)} - Magreza moderada";
      case >= 17 && < 18.5:
        return "${imc.toStringAsFixed(2)} - Magreza leve";
      case >= 18.5 && < 25:
        return "${imc.toStringAsFixed(2)} - Saudável";
      case >= 25 && < 30:
        return "${imc.toStringAsFixed(2)} - Sobrepeso";
      case >= 30 && < 25:
        return "${imc.toStringAsFixed(2)} - Obsidade Grau I";
      case >= 35 && < 40:
        return "${imc.toStringAsFixed(2)} - Obsidade Grau II (severa)";
      case >= 40:
        return "${imc.toStringAsFixed(2)} - Obsidade Grau III (mórbida)";
      default:
        return "${imc.toStringAsFixed(2)} - IMC inválido";
    }
  }
}
