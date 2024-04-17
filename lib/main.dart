import 'package:flutter/material.dart';

void main() => runApp(IMCCalculadora());

class IMCCalculadora extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CalculadoraIMC',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: TelaIMC(),
    );
  }
}

class TelaIMC extends StatefulWidget {
  @override
  _TelaIMC createState() => _TelaIMC();
}

class _TelaIMC extends State<TelaIMC> {
  TextEditingController AlturaControle = TextEditingController();
  TextEditingController PesoControle = TextEditingController();
  double resultado = 0;
  String state = '';

  void CalculoIMC() {
    double Altura = double.parse(AlturaControle.text) / 100;
    double Peso = double.parse(PesoControle.text);
    double imc = Peso / (Altura * Altura);
    setState(() {
      resultado = imc;

      if (imc < 18.5) {
        state = 'Abaixo do peso';
      } else if (imc < 24.9) {
        state = 'Peso normal';
      } else if (imc < 29.9) {
        state = 'Sobrepeso';
      } else if (imc < 34.9) {
        state = 'Obesidade grau I';
      } else if (imc < 39.9) {
        state = 'Obesidade grau II';
      } else {
        state = 'Obesidade grau III';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC: By Adriano e Giovanni'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: AlturaControle,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Altura (cm)',
              ),
            ),
            TextField(
              controller: PesoControle,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Peso (kg)',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: CalculoIMC,
              child: Text('Calculo IMC'),
            ),
            SizedBox(height: 20),
            Text(
              'Seu IMC é: ${resultado.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'IMC: $state',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
