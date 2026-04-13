import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {

  String display = "0000";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [

            /// DISPLAY
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(20),
                child: Text(
                  display,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                  ),
                ),
              ),
            ),

            /// BUTTONS
            Expanded(
              flex: 2,
              child: Column(
                children: [

                  buildButtonRow(["C", "()", "%", "÷"]),
                  buildButtonRow(["7", "8", "9", "×"]),
                  buildButtonRow(["4", "5", "6", "-"]),
                  buildButtonRow(["1", "2", "3", "+"]),
                  buildButtonRow(["+/-", "0", ".", "="]),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }

  /// Row buttons
  Widget buildButtonRow(List<String> buttons) {
    return Expanded(
      child: Row(
        children: buttons.map((text) => buildButton(text)).toList(),
      ),
    );
  }

  /// Button style
  Widget buildButton(String text) {

    Color buttonColor = const Color(0xFF2D2D2D);

    /// Top row
    if (text == "()" || text == "%") {
      buttonColor = Colors.grey;
    }

    /// C button
    if (text == "C") {
      buttonColor = Colors.red;
    }

    /// Right column
    if (text == "÷" ||
        text == "×" ||
        text == "-" ||
        text == "+" ||
        text == "=") {
      buttonColor = Colors.green;
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
          ),
          onPressed: () {},
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}