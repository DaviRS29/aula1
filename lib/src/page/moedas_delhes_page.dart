import 'package:myapp/src/models/moeda.dart';
import 'package:myapp/src/viewmodels/moeda_nacionalidade_viewmodels.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MoedasDelhesPage extends StatefulWidget {
  final Moeda moeda;

  MoedasDelhesPage({super.key, required this.moeda});

  @override
  State<MoedasDelhesPage> createState() => _MoedasDelhesPageState();
}

class _MoedasDelhesPageState extends State<MoedasDelhesPage> {
  late MoedaNacionalidadeViewmodels moedaNacionalidade;
  final _form = GlobalKey<FormState>();
  late int quantidade = 0;
  final _valor = TextEditingController();

  @override
  void initState() {
    super.initState();
    moedaNacionalidade = MoedaNacionalidadeViewmodels(moeda: widget.moeda);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.moeda.nome}'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Image.asset(widget.moeda.icone),
                    width: 50,
                  ),
                  Container(
                    width: 10,
                  ),
                  Text(
                    '${moedaNacionalidade.moedaBrasil()}',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -1,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Container(
                child: Text(
                  '$quantidade ${widget.moeda.sigla} ',
                  style: TextStyle(fontSize: 20, color: Colors.teal),
                ),
                margin: EdgeInsets.only(bottom: 24),
                padding: EdgeInsets.all(12),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.teal.withOpacity(0.05),
                ),
              ),
            ),
            Form(
              key: _form,
              child: TextFormField(
                controller: _valor,
                style: TextStyle(fontSize: 22),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Valor',
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                  suffix: Text(
                    'reais',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe o valor de compra';
                  } else if (double.parse(value) < 50) {
                    return 'Compra minima é 50';
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {
                  setState(() {

                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}