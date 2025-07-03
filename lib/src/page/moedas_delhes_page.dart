import 'package:myapp/src/models/moeda.dart';
import 'package:myapp/src/viewmodels/moeda_nacionalidade_viewmodels.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MoedasDelhesPage extends StatefulWidget {
  final Moeda moeda;

  const MoedasDelhesPage({super.key, required this.moeda});

  @override
  State<MoedasDelhesPage> createState() => _MoedasDelhesPageState();
}

class _MoedasDelhesPageState extends State<MoedasDelhesPage> {
  late MoedaNacionalidadeViewmodels moedaNacionalidade;
  final _form = GlobalKey<FormState>();
  late double quantidade = 0.0;
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
        title: Text(widget.moeda.nome),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50,
                    child: Image.asset(widget.moeda.icone),
                  ),
                  Container(
                    width: 10,
                  ),
                  Text(
                    moedaNacionalidade.moedaBrasil(),
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
            (quantidade > 0)
                ? SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 24),
                      padding: const EdgeInsets.all(12),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 150, 135)
                            .withOpacity(0.05),
                      ),
                      child: Text(
                        '$quantidade ${widget.moeda.sigla} ',
                        style:
                            const TextStyle(fontSize: 20, color: Colors.teal),
                      ),
                    ),
                  )
                : Container(
                    margin: EdgeInsets.only(bottom: 24),
                  ),
            Form(
              key: _form,
              child: TextFormField(
                controller: _valor,
                style: const TextStyle(fontSize: 22),
                decoration: const InputDecoration(
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
                onChanged: (Value) {
                  setState(() {
                    quantidade = (Value.isEmpty)
                        ? 0.0
                        : double.parse(Value) / widget.moeda.preco;
                    //quantidade = double.parse(Value) / widget.moeda.preco;
                    print(quantidade);
                  });
                },
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(top: 24),
              child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
