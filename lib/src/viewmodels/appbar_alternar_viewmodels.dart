import 'package:myapp/src/viewmodels/moedas_selecionadas_viewmodel.dart';
import 'package:flutter/material.dart';

class AppBarAlternar extends StatelessWidget implements PreferredSizeWidget {
  final MoedasSelecionadasViewmodel selecionadas;

  const AppBarAlternar({super.key, required this.selecionadas});

  @override
  Widget build(BuildContext context) {
    return selecionadas.selecionadas.isEmpty
        ? AppBar(
      title: const Text('Cripto Moedaa'),
      centerTitle: true,
    )
        : AppBar(
      leading: IconButton(
        onPressed: () => selecionadas.limparSelecionadas(),
        icon: const Icon(Icons.close),
      ),
      title: Text(
        '${selecionadas.selecionadas.length} selecionadas',
        style: const TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.blueGrey.shade50,
      elevation: 1,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.black87),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
