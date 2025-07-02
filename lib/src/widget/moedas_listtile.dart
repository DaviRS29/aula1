import 'package:myapp/src/models/moeda.dart';
import 'package:myapp/src/viewmodels/moedas_selecionadas_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MoedasListtile extends StatelessWidget {
  final Moeda moeda;

  final VoidCallback onTap;

  MoedasListtile({
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      leading: isSelected
          ? CircleAvatar(
              child: Icon(Icons.check),
            )
          : SizedBox(
              child: Image.asset(moeda.icone),
              width: 40,
            ),
      title: Text(
        moeda.nome,
        style: TextStyle(
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
