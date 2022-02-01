import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lucky Money',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const Welcome(),
    );
  }
}

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late CurvedAnimation curve;
  bool welcomed = false;

  void _changeState() {
    setState(() {
      welcomed = !welcomed;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    curve = CurvedAnimation(parent: _controller, curve: Curves.ease);
    _controller.forward();
    // Future.delayed(const Duration(seconds: 2));
    // _controller.reverse();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return !welcomed
        ? Scaffold(
            appBar: AppBar(title: const Text('Happy New Year')),
            body: Center(
                child: FadeTransition(
                    opacity: curve,
                    child: const FittedBox(
                      child: Image(image: AssetImage('assets/back.jpg')),
                      fit: BoxFit.cover,
                    ))),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                _changeState();
                _controller.forward();
              },
              label: const Text('Nhận Lì Xì'),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          )
        : const LuckyMoney();
  }
}

class LuckyMoney extends StatefulWidget {
  const LuckyMoney({Key? key}) : super(key: key);

  @override
  _LuckyMoneyState createState() => _LuckyMoneyState();
}

class _LuckyMoneyState extends State<LuckyMoney> {
  bool _flicked = false;
  StreamController<int> controller = StreamController<int>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Happy New Year'),
      ),
      body: Center(
          child: FortuneWheel(
        selected: Stream.value(0),
        indicators: const <FortuneIndicator>[
          FortuneIndicator(
            alignment: Alignment
                .bottomCenter, // <-- changing the position of the indicator
            child: TriangleIndicator(
              color: Colors.red, // <-- changing the color of the indicator
            ),
          ),
        ],
        physics: CircularPanPhysics(
          duration: const Duration(seconds: 1),
          curve: Curves.decelerate,
        ),
        onFling: () {
          if (!_flicked) {
            controller.add(1);
            _changeState();
          }
        },
        items: const [
          FortuneItem(
              child: Text(
                '20.000đ',
                style: TextStyle(
                    color: Color.fromRGBO(255, 250, 208, 1.0),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              style: FortuneItemStyle(
                color: Color.fromRGBO(125, 36, 5, 1.0),
              )),
          FortuneItem(
              child: Text(
                '50.000đ',
                style: TextStyle(
                    color: Color.fromRGBO(255, 250, 208, 1.0),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              style: FortuneItemStyle(
                color: Color.fromRGBO(191, 61, 13, 1.0),
              )),
          FortuneItem(
              child: Text(
                '20.000đ',
                style: TextStyle(
                    color: Color.fromRGBO(255, 250, 208, 1.0),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              style: FortuneItemStyle(
                color: Color.fromRGBO(125, 36, 5, 1.0),
              )),
          FortuneItem(
              child: Text(
                '100.000đ',
                style: TextStyle(
                    color: Color.fromRGBO(255, 250, 208, 1.0),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              style: FortuneItemStyle(
                color: Color.fromRGBO(191, 61, 13, 1.0),
              )),
          FortuneItem(
              child: Text(
                '10.000đ',
                style: TextStyle(
                    color: Color.fromRGBO(255, 250, 208, 1.0),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              style: FortuneItemStyle(
                color: Color.fromRGBO(125, 36, 5, 1.0),
              )),
          FortuneItem(
              child: Text(
                '20.000đ',
                style: TextStyle(
                    color: Color.fromRGBO(255, 250, 208, 1.0),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              style: FortuneItemStyle(
                color: Color.fromRGBO(191, 61, 13, 1.0),
              )),
          FortuneItem(
              child: Text(
                '10.000đ',
                style: TextStyle(
                    color: Color.fromRGBO(255, 250, 208, 1.0),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              style: FortuneItemStyle(
                color: Color.fromRGBO(125, 36, 5, 1.0),
              )),
          FortuneItem(
              child: Text(
                '20.000đ',
                style: TextStyle(
                    color: Color.fromRGBO(255, 250, 208, 1.0),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              style: FortuneItemStyle(
                color: Color.fromRGBO(191, 61, 13, 1.0),
              )),
        ],
      )),
    );
  }

  void _changeState() {
    setState(() {
      _flicked = !_flicked;
    });
  }
}
