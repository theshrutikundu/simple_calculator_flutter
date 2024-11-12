import 'package:flutter/material.dart';
import 'calculator_logic.dart';
import 'button_widget.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  late CalculatorLogic _calculatorLogic;

  @override
  void initState() {
    super.initState();
    _calculatorLogic = CalculatorLogic(onUpdate: updateState);
  }

  // Function to update the UI whenever state changes
  void updateState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding:
                const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  _calculatorLogic.equation,
                  style: const TextStyle(
                    fontSize: 24.0,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  _calculatorLogic.output,
                  style: const TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: Divider(),
          ),
          Column(
            children: [
              Row(
                children: [
                  CalculatorButton('7',
                      onPressed: _calculatorLogic.buttonPressed),
                  CalculatorButton('8',
                      onPressed: _calculatorLogic.buttonPressed),
                  CalculatorButton('9',
                      onPressed: _calculatorLogic.buttonPressed),
                  CalculatorButton('÷',
                      onPressed: _calculatorLogic.buttonPressed),
                ],
              ),
              Row(
                children: [
                  CalculatorButton('4',
                      onPressed: _calculatorLogic.buttonPressed),
                  CalculatorButton('5',
                      onPressed: _calculatorLogic.buttonPressed),
                  CalculatorButton('6',
                      onPressed: _calculatorLogic.buttonPressed),
                  CalculatorButton('×',
                      onPressed: _calculatorLogic.buttonPressed),
                ],
              ),
              Row(
                children: [
                  CalculatorButton('1',
                      onPressed: _calculatorLogic.buttonPressed),
                  CalculatorButton('2',
                      onPressed: _calculatorLogic.buttonPressed),
                  CalculatorButton('3',
                      onPressed: _calculatorLogic.buttonPressed),
                  CalculatorButton('-',
                      onPressed: _calculatorLogic.buttonPressed),
                ],
              ),
              Row(
                children: [
                  CalculatorButton('.',
                      onPressed: _calculatorLogic.buttonPressed),
                  CalculatorButton('0',
                      onPressed: _calculatorLogic.buttonPressed),
                  CalculatorButton('00',
                      onPressed: _calculatorLogic.buttonPressed),
                  CalculatorButton('+',
                      onPressed: _calculatorLogic.buttonPressed),
                ],
              ),
              Row(
                children: [
                  CalculatorButton('CLEAR',
                      onPressed: _calculatorLogic.buttonPressed),
                  CalculatorButton('=',
                      onPressed: _calculatorLogic.buttonPressed),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
