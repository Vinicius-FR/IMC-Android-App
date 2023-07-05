import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Calculadora de IMC',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: IMCCalculator(),
  ));
}

class IMCCalculator extends StatefulWidget {
  @override
  _IMCCalculatorState createState() => _IMCCalculatorState();
}

class _IMCCalculatorState extends State<IMCCalculator> {
  TextEditingController _weightController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  String _result = '';
  String _description = '';

  void _calculateBMI() {
    double? weight = double.tryParse(_weightController.text);
    double? height = double.tryParse(_heightController.text);

    if (weight != null && height != null && height > 0 && weight > 0) {
      double bmi = weight / (height * height);
      setState(() {
        _result = 'Seu IMC: ${bmi.toStringAsFixed(2)}';

        if (bmi < 18.5) {
          _description = 'Abaixo do peso';
        } else if (bmi >= 18.5 && bmi < 25) {
          _description = 'Peso normal';
        } else if (bmi >= 25 && bmi < 30) {
          _description = 'Sobrepeso';
        } else if (bmi >= 30 && bmi < 35) {
          _description = 'Obesidade grau 1';
        } else if (bmi >= 35 && bmi < 40) {
          _description = 'Obesidade grau 2';
        } else {
          _description = 'Obesidade grau 3';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Peso (em kg)',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Altura (em metros)',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text('Calcular'),
            ),
            SizedBox(height: 16.0),
            Text(
              _result,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16.0),
            Text(
              _description,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
