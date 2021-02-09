import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Practice App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.yellow,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = '0';

  String _output = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = '';

  buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      _output = '0';
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    } else if (buttonText == '/' ||
        buttonText == 'X' ||
        buttonText == '-' ||
        buttonText == '+' ||
        buttonText == '%') {
      num1 = double.parse(output);
      operand = buttonText;
      _output = '0';
    } else if (buttonText == '.') {
      if (_output.contains('.')) {
        print('Already contains decimal');
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == '=') {
      num2 = double.parse(output);
      if (operand == '+') {
        _output = (num1 + num2).toString();
      }
      if (operand == '-') {
        _output = (num1 - num2).toString();
      }
      if (operand == 'X') {
        _output = (num1 * num2).toString();
      }
      if (operand == '/') {
        _output = (num1 / num2).toString();
      }
      if (operand == '%') {
        _output = (num1 / 100).toString();
      }
      // num1 = 0.0;
      // num2 = 0.0;
      // operand = '';
      output = '0';
    } else {
      _output = _output + buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: RaisedButton(
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.normal),
        ),
        padding: EdgeInsets.all(24),
        color: Colors.orange,
        onPressed: () {
          buttonPressed(buttonText);
        },
        elevation: 5,
      ),
    );
  }

  Widget buildColorButton(String buttonText) {
    return Expanded(
      child: RaisedButton(
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.normal),
        ),
        padding: EdgeInsets.all(24),
        color: Colors.black,
        textColor: Colors.orange,
        onPressed: () {
          buttonPressed(buttonText);
        },
        elevation: 5,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Calculator'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(top: 185),
                alignment: Alignment.bottomRight,
                child: Text(
                  num1.toString(),
                  //output,
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  //operand,
                  operand,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.only(bottom: 0),
                child: Text(
                  num2.toString(),
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.only(bottom: 0),
                child: Text('= ' + output,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              ),
              Expanded(
                child: new Divider(),
              ),
              Container(
                color: Colors.grey[850],
                padding: EdgeInsets.only(top: 1),
              ),
              Container(
                //padding: EdgeInsets.only(top: 5),
                color: Colors.black,
                child: Column(
                  children: [
                    Row(
                      children: [
                        buildColorButton('C'),
                        //buildColorButton('<-'),
                        buildColorButton('%'),
                        buildColorButton('/'),
                      ],
                    ),
                    Row(
                      children: [
                        buildButton('7'),
                        buildButton('8'),
                        buildButton('9'),
                        buildColorButton('X'),
                      ],
                    ),
                    Row(
                      children: [
                        buildButton('4'),
                        buildButton('5'),
                        buildButton('6'),
                        buildColorButton('-'),
                      ],
                    ),
                    Row(
                      children: [
                        buildButton('1'),
                        buildButton('2'),
                        buildButton('3'),
                        buildColorButton('+'),
                      ],
                    ),
                    Row(
                      children: [
                        buildButton('00'),
                        buildButton('0'),
                        buildButton('.'),
                        buildColorButton('='),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
