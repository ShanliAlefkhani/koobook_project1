import 'dart:async';
import 'package:flutter/material.dart';
import 'time.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Timer _timer;
  Time _time = new Time(7, 0, 0);
  bool _received = false;

  void _startTimer() {
    _received = false;
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      setState(() {
        if (_time.b)
          _time.minus();
        else
          _time.plus();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightGreenAccent,
          title: Text(
            "TIMER APP",
            style: TextStyle(color: Colors.black),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (_time.b)
                ? Text(
                    _time.toString(),
                    style: TextStyle(color: Colors.green, fontSize: 28),
                  )
                : Text(
                    "-" + _time.toString(),
                    style: TextStyle(color: Colors.red, fontSize: 28),
                  ),
            RaisedButton(
              onPressed: () => _startTimer(),
              child: Text("START!"),
            ),
            RaisedButton(
              onPressed: () => _received = true,
              child: Text("END!"),
            )
          ],
        ),
      ),
    );
  }
}
