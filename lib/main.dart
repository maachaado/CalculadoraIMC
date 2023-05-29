import 'package:calc_imc/util.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController pesoController = new TextEditingController();
  TextEditingController alturaController = new TextEditingController();

  GlobalKey<FormState> formController = GlobalKey<FormState>();

  String msg = "Informe os seus dados";

  limparCampos() {
    pesoController.text = "";
    alturaController.text = "";
    setState(() {
      msg = "Informe seus dados";
      formController = GlobalKey<FormState>();
    });
  }

  calcularImc() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text);
      double imc = peso / (altura * altura);
      String imcTxt = imc.toStringAsPrecision(4);

      if (imc < 18.6) {
        msg = "Abaixo do peso ($imcTxt)";
      } else if (imc > 18.6 && imc < 24.9) {
        msg = "Peso ideal ($imcTxt)";
      } else {
        msg = "Acima do peso ($imcTxt)";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: paginaPrincipal(),
    );
  }

  paginaPrincipal() {
    return Scaffold(
      appBar: Componentes().appBar(limparCampos),
      body: Form(
        key: formController,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Componentes().iconeGrande(),
            Componentes().criaInputTexto(TextInputType.number, 'Peso(Kg)',
                pesoController, 'Informe seu peso'),
            Componentes().criaInputTexto(TextInputType.number, 'Altura',
                alturaController, 'Informe sua altura'),
            Componentes().criaBotao(formController, calcularImc, 'Calcular'),
            Componentes().criaTexto(msg, 20, Colors.red),
          ],
        ),
      ),
    );
  }
}
