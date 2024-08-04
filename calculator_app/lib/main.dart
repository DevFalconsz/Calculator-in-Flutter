// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() {
  runApp(const MyCalculator());

  doWhenWindowReady(() {
    final initialSize = Size(400, 650);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.maxSize = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.title = "Calculadora";
    appWindow.show();
  });
}

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  String numero = '0';

  double pimeiroNumero = 0.0;

  String operacao = '';

  void calculator(String tecla) {
    switch (tecla) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case ',':
        setState(() {
          numero += tecla;
          numero = numero.replaceAll(",", ".");
          if (numero.contains('.')) {
            //double numeroDouble = double.parse(numero);
            //numero = numeroDouble.toString();
          } else {
            int numeroInt = int.parse(numero);
            numero = numeroInt.toString();
          }
          numero = numero.replaceAll(".", ",");
        });
        break;

      case 'AC':
        setState(() {
          numero = '0';
        });
        break;

      case '<X':
        setState(() {
          if (numero.isNotEmpty) {
            numero = numero.substring(0, numero.length - 1);
          }
        });
        break;

      case '+':
      case '-':
      case 'X':
      case '/':
        operacao = tecla;
        numero = numero.replaceAll(",", ".");
        pimeiroNumero = double.parse(numero);
        numero = numero.replaceAll(".", ",");
        numero = '0';
        break;

      case '=':
        double resultado = 0.0;

        if (operacao == '/') {
          if (double.parse(numero) * 1 == 0) {
            return;
          }
        }

        if (operacao == '+') {
          numero = numero.replaceAll(",", ".");
          resultado = pimeiroNumero + double.parse(numero);
        }

        if (operacao == '-') {
          numero = numero.replaceAll(",", ".");
          resultado = pimeiroNumero - double.parse(numero);
        }

        if (operacao == 'X') {
          numero = numero.replaceAll(",", ".");
          resultado = pimeiroNumero * double.parse(numero);
        }

        if (operacao == '/') {
          numero = numero.replaceAll(",", ".");
          resultado = pimeiroNumero / double.parse(numero);
        }

        String resultadoString = resultado.toString();

        List<String> resultadoPartes = resultadoString.split('.');

        if (int.parse(resultadoPartes[1]) * 1 == 0) {
          setState(() {
            numero = int.parse(resultadoPartes[0]).toString();
          });
        } else {
          setState(() {
            numero = resultado.toString();
          });
        }
        break;

      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Calculator"),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  numero,
                  style: TextStyle(fontSize: 72),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    calculator('AC');
                  },
                  child: Text(
                    "AC",
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                Text(""),
                Text(""),
                GestureDetector(
                  onTap: () {
                    calculator('<X');
                  },
                  child: Image.asset(
                    'assets/images/arrow.png',
                    width: 70,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    calculator('7');
                  },
                  child: Text(
                    "7",
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calculator('8');
                  },
                  child: Text(
                    "8",
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calculator('9');
                  },
                  child: Text(
                    "9",
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calculator('/');
                  },
                  child: Text(
                    "/",
                    style: TextStyle(fontSize: 48),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    calculator('4');
                  },
                  child: Text(
                    "4",
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calculator('5');
                  },
                  child: Text(
                    "5",
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calculator('6');
                  },
                  child: Text(
                    "6",
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calculator('X');
                  },
                  child: Text(
                    "X",
                    style: TextStyle(fontSize: 48),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    calculator('1');
                  },
                  child: Text(
                    "1",
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calculator('2');
                  },
                  child: Text(
                    "2",
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calculator('3');
                  },
                  child: Text(
                    "3",
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calculator('-');
                  },
                  child: Text(
                    "-",
                    style: TextStyle(fontSize: 48),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    calculator('0');
                  },
                  child: Text(
                    "0",
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calculator(',');
                  },
                  child: Text(
                    ",",
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calculator('=');
                  },
                  child: Text(
                    "=",
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calculator('+');
                  },
                  child: Text(
                    "+",
                    style: TextStyle(fontSize: 48),
                  ),
                ),
              ],
            ),
            Text(""),
          ],
        ),
      ),
    );
  }
}
