import 'package:myapp/src/models/moeda.dart';
import 'package:myapp/src/page/moedas_delhes_page.dart';
import 'package:myapp/src/repository/moeda_repository.dart';
import 'package:myapp/src/viewmodels/appbar_alternar_viewmodels.dart';
import 'package:myapp/src/viewmodels/moedas_selecionadas_viewmodel.dart';
import 'package:myapp/src/widget/moedas_listtile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoedasPage extends StatefulWidget {
  const MoedasPage({super.key});

  @override
  State<MoedasPage> createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
  final tabela = MoedaRepository.tabela;

  mostrarDetalhes(Moeda moeda) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => MoedasDelhesPage(moeda: moeda)));
  }

  @override
  Widget build(BuildContext context) {
    final selecionadas = Provider.of<MoedasSelecionadasViewmodel>(context);

    return Scaffold(
      appBar: AppBarAlternar(selecionadas: selecionadas),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int moeda) {
            return MoedasListtile(
              moeda: tabela[moeda],
              onTap: () {
                selecionadas.vazio()
                    ? mostrarDetalhes(tabela[moeda])
                    : selecionadas.alternarSelecionadas(tabela[moeda]);
              },
            );
          },
          padding: const EdgeInsets.all(8),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: tabela.length),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: selecionadas.selecionadas.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () {},
              icon: const Icon(Icons.star),
              label: const Text(
                'Favoritar',
                style: TextStyle(
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : null,
    );
  }
}
