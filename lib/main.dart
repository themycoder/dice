import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(DiceApp());
}

class DiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DiceScreen(
      
      ),
    );
  }
}

class DiceScreen extends StatefulWidget {
  @override
  _DiceScreenState createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  // Hàm để xoay xúc xắc ngẫu nhiên
  void rollDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;  // số ngẫu nhiên từ 1 đến 6
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100], // Màu nền
      appBar: AppBar(
        title: Text('Dice Roller'),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onDoubleTap: rollDice, // Xử lý khi nhấn đúp
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset('img/dice$leftDiceNumber.png'), // Hình ảnh xúc xắc trái
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset('img/dice$rightDiceNumber.png'), // Hình ảnh xúc xắc phải
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
