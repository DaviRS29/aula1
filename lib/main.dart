import 'package:myapp/src/meu_aplicativo.dart';
import 'package:myapp/src/viewmodels/moedas_selecionadas_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MoedasSelecionadasViewmodel(),
      child:  MeuAplicativo(),
    ),
  );
}
