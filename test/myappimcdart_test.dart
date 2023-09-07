import 'package:myappimcdart/functions/util.dart';
import 'package:test/test.dart';

void main() {
  test('Calcula IMC', () {
    expect(Util.calculaIMC(73, 172), lessThanOrEqualTo(25));
  });
}
