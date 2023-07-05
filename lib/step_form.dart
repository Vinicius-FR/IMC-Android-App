import 'package:flutter/material.dart';

class StepForm extends StatelessWidget {
  final _stepFormController = PageController();

  List _pageList = [
    Text('page 1'),
    Text('page 2'),
    Text('page 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IMC App'),
      ),
      body: PageView.builder(
          controller: _stepFormController,
          itemBuilder: (BuildContext context, int index) {
            return _pageList[index];
          }),
    );
  }
}
