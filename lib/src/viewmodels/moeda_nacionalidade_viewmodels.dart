import 'package:myapp/src/models/moeda.dart';
import 'package:intl/intl.dart';

class MoedaNacionalidadeViewmodels {
  final Moeda moeda;
  final NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');

  MoedaNacionalidadeViewmodels({required this.moeda});

  String moedaBrasil() {
    return real.format(moeda.preco);
  }
}
