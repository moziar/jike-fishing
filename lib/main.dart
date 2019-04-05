import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fishing',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(title: '即刻摸鱼'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _state = false; // true means the photo of Ar~~

  void _incrementCounter() {
    setState(() {
      _counter++;
      _state = !_state; // let the state opposite
    });
  }

  static String _logoPath1Default = 'images/logo.png';
  static String _logoPath2Default = 'images/logo2.png';

  String _logoPath1 = _logoPath1Default;
  String _logoPath2 = _logoPath2Default;

  String _logoPath = _logoPath1Default; // Set Default Path

  void _changeLogoPath() {
    setState(() {
      if (0 < _counter && _counter < 20) { _logoPath1 = _logoPath1Default };  //todo
    });
  }

  void _changePhoto() {
    // the method to change photo
    setState(() {
      if (_state) {
        _logoPath = _logoPath2;
      } else {
        _logoPath = _logoPath1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: '今天已经摸了  ',
                  style: TextStyle(
                    color: Color.fromARGB(255, 135, 135, 135),
                    fontSize: 17.0,
                  )),
              TextSpan(
                text: '$_counter',
                style: Theme.of(context).textTheme.display1,
              ),
              TextSpan(
                  text: '  次鱼',
                  style: TextStyle(
                    color: Color.fromARGB(255, 135, 135, 135),
                    fontSize: 17.0,
                  )),
            ])),
            FlatButton(
              onPressed: () => {_incrementCounter(), _changePhoto()},
              splashColor: Color(0x00000000),
              color: Color(0x00000000),
              highlightColor: Color(0x00000000),
              child: Image(
                image: AssetImage('$_logoPath'),
                width: 230.0,
                height: 220.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}