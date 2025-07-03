import 'package:myapp/src/models/moeda.dart';
import 'package:flutter/material.dart';

class MoedasSelecionadasViewmodel extends ChangeNotifier {
  late final List<Moeda> _selecionadas = [];

  List<Moeda> get selecionadas => _selecionadas;

  void alternarSelecionadas(Moeda moeda) {
    selecionadas.contains(moeda)
        ? _selecionadas.remove(moeda)
        : _selecionadas.add(moeda);

    notifyListeners();
  }

  void limparSelecionadas() {
    _selecionadas.clear();
    notifyListeners();
  }

  bool isSelecionada(Moeda moeda) {
    return _selecionadas.contains(moeda);
  }
  bool vazio(){
    return selecionadas.isEmpty;
  }
}
