import 'package:flutter/material.dart';

import './step_form.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Calculadora de IMC',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: StepForm(),
  ));
}
