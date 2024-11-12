class CalculatorLogic {
  String output = "0";
  String _output = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";
  String equation = ""; // To store the equation history
  bool isResult = false; // Flag to check if the last input was result
  final Function onUpdate; // Callback to notify state change

  CalculatorLogic({required this.onUpdate});

  void buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
      equation = ""; // Reset the equation when cleared
      isResult = false;
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "×" ||
        buttonText == "÷") {
      if (isResult) {
        num1 = double.parse(output);
        _output = "0";
        equation = output + " " + buttonText + " ";
        isResult = false;
      } else {
        num1 = double.parse(output);
        equation = equation + output + " " + buttonText + " ";
        _output = "0";
      }
      operand = buttonText;
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      } else if (operand == "-") {
        _output = (num1 - num2).toString();
      } else if (operand == "×") {
        _output = (num1 * num2).toString();
      } else if (operand == "÷") {
        _output = (num1 / num2).toString();
      }

      equation = _formatOutput(_output);
      num1 = 0;
      num2 = 0;
      operand = "";
      isResult = true;
    } else {
      if (isResult) {
        _output = buttonText;
        equation = "";
        isResult = false;
      } else {
        if (_output == "0") {
          _output = buttonText;
        } else {
          _output = _output + buttonText;
        }
      }
    }

    output = _formatOutput(_output);
    onUpdate(); // Notify state change
  }

  String _formatOutput(String value) {
    if (value.contains(".")) {
      double parsedValue = double.parse(value);
      if (parsedValue == parsedValue.roundToDouble()) {
        return parsedValue.toInt().toString();
      }
    }
    return value;
  }
}
