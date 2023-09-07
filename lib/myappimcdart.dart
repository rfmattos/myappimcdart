import 'dart:io';
import 'package:myappimcdart/classes/pessoa.dart';
import 'package:myappimcdart/functions/util.dart';
import 'package:myappimcdart/exception/campo_invalido_exception.dart';

void execute() {
  print("============================================");
  print("============= Calculadora de IMC ===========");
  print("============================================");
  var pessoa = Pessoa();
  do {
    try {
      pessoa.setNome(Util.lerStringTexto("Digite o seu Nome:"));
    } on CampoInvalidoException {
      print("Nome inválido!");
    } catch (e) {
      print(e);
      exit(0);
    }
  } while (pessoa.getNome().trim() == "");

  do {
    try {
      pessoa.setPeso(
          Util.lerDoubleTexto("Digite o seu peso em kilos (Ex:70.5):"));
    } on CampoInvalidoException {
      print("Peso inválido!");
    } catch (e) {
      print(e);
      exit(0);
    }
  } while (pessoa.getPeso() == 0);

  do {
    try {
      pessoa.setAltura(
          Util.lerDoubleTexto("Digite a sua altura em centimetros (Ex:120):"));
    } on CampoInvalidoException {
      print("Altura inválida!");
    } catch (e) {
      print(e);
      exit(0);
    }
  } while (pessoa.getAltura() == 0);

  print("================= Resultado ================");
  print('  Nome:   ${pessoa.getNome()}');
  print('  Altura: ${pessoa.getAltura()}');
  print('  Peso:   ${pessoa.getPeso()}');
  print(
      '  IMC:    ${Util.classificacaoIMC(pessoa.getPeso(), pessoa.getAltura())}');
  print("============================================");
}
