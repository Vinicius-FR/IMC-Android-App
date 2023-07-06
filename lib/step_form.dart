import 'package:flutter/material.dart';
import './page_indicator.dart';
import './first_page_body.dart';

class StepForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StepFormState();
  }
}

class _StepFormState extends State<StepForm> {
  final _stepFormController = PageController();
  int _page = 0;

  List _pageList = [
    IMCCalculator(),
    Text('page 2'),
    Text('page 3'),
  ];

  void _changeStep(bool nextPage) {
    if (_page < 2 && nextPage) {
      setState(() {
        _page++;
      });

      _stepFormController.nextPage(
        duration: const Duration(microseconds: 300),
        curve: Curves.easeIn,
      );
    } else if (_page > 0 && !nextPage) {
      setState(() {
        _page--;
      });

      _stepFormController.previousPage(
          duration: const Duration(microseconds: 300), curve: Curves.easeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC App'),
      ),
      body: PageView.builder(
          controller: _stepFormController,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return _pageList[index];
          }),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () => _changeStep(false),
            child: const Text('Anterior'),
          ),
          pageIndicator(_page == 0),
          pageIndicator(_page == 1),
          pageIndicator(_page == 2),
          TextButton(
            onPressed: () => _changeStep(true),
            child: const Text('Próximo'),
          ),
        ],
      ),
    );
  }
}
