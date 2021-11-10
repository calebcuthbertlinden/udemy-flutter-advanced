import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Advanced - Udemy'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool visible = false;
  double value = 0.0;
  int turns = 0;

  @override
  void initState() {
    visible = !visible;
  }

  void toggleVisible() {
    setState(() {
      visible = !visible;
    });
  }

  void onChanged(double value) {
    setState(() {
      value = value;
      turns = value.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
      // 1.3
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text(
      //         visible ? 'Now you see me' : 'Now you dont',
      //       ),
      //       Opacity(
      //           opacity: visible ? 1.0 : 0.2,
      //           child: Text(
      //             '$_counter',
      //             style: Theme.of(context).textTheme.headline4,
      //           )),
      //     ],
      //   ),
      // ),

      //1.4
      Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            children: <Widget>[
              Slider(value: value, onChanged: onChanged, min: 0.0, max: 4.0),
              RotatedBox(quarterTurns: turns,
              child: Text('Hello world'))
            ]
          )
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleVisible,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
