import 'package:myapp/src/models/moeda.dart';
import 'package:myapp/src/viewmodels/moedas_selecionadas_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MoedasListtile extends StatelessWidget {
  final Moeda moeda;

  final VoidCallback onTap;

  const MoedasListtile({
    super.key,
    required this.moeda,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final selecionadas = Provider.of<MoedasSelecionadasViewmodel>(context);
    final bool isSelected = selecionadas.isSelecionada(moeda);
    NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');

    return ListTile(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      leading: isSelected
          ? const CircleAvatar(
              child: Icon(Icons.check),
            )
          : SizedBox(
              width: 40,
              child: Image.asset(moeda.icone),
            ),
      title: Text(
        moeda.nome,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Text(
        real.format(moeda.preco),
      ),
      selected: isSelected,
      selectedTileColor: Colors.indigo.shade50,
      onLongPress: ()=> selecionadas.alternarSelecionadas(moeda),
      onTap: onTap,

    );
  }
}
