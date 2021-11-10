import 'package:flutter/material.dart';


class GrapgicsManipulation extends StatefulWidget {
  GrapgicsManipulation({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _GrapgicsManipulationState createState() => _GrapgicsManipulationState();
}

class _GrapgicsManipulationState extends State<GrapgicsManipulation> {
  int _counter = 0;
  bool visible = false;
  double value = 0.0;
  int turns = 0;

  // Transformations
  double x = 0.0;
  double y = 0.0;
  double z = 0.0;

  @override
  void initState() {
    visible = !visible;
    x = 0.0;
    y = 0.0;
    z = 0.0;
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

        // 1.3 - Opacity

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

      //------------------------------------------------------------------------------------

        // 1.4 - Rotate box

        // Container(
        //   padding: EdgeInsets.all(32),
        //   child: Center(
        //     child: Column(
        //       children: <Widget>[
        //         Slider(value: value, onChanged: onChanged, min: 0.0, max: 4.0),
        //         RotatedBox(quarterTurns: turns,
        //         child: Text('Hello world'))
        //       ]
        //     )
        //   )
        // ),

      //------------------------------------------------------------------------------------

        // 1.5 - Border Decoration

        // Container(
        //   padding: EdgeInsets.all(32),
        //   child: Center(
        //     child: Column(
        //       children: <Widget>[
        //         Text('Sun shine'),
        //         Container(
        //           child: Image(image: AssetImage('images/smile.png')),
        //           padding: EdgeInsets.all(32.0),
        //           decoration: BoxDecoration(
        //             border: Border.all(color: Colors.orange, width: 2.0),
        //             gradient: RadialGradient(colors: <Color>[Colors.red, Colors.yellow])
        //           )
        //         )
        //       ]
        //     )
        //   )
        // ),

      //------------------------------------------------------------------------------------

      // 1.6 - Transformation

      // Container(
      //   padding: EdgeInsets.all(32),
      //   child: Center(
      //     child: Column(
      //       children: <Widget>[
      //         Row(
      //           children: <Widget>[
      //             Text('X'),
      //             Slider(value: x, onChanged: (double value) => setState(() => x = value))
      //           ]
      //         ),
      //         Row(
      //             children: <Widget>[
      //               Text('Y'),
      //               Slider(value: y, onChanged: (double value) => setState(() => y = value))
      //             ]
      //         ),
      //         Row(
      //             children: <Widget>[
      //               Text('Z'),
      //               Slider(value: z, onChanged: (double value) => setState(() => z = value))
      //             ]
      //         ),
      //         Transform(transform: Matrix4.skewY(y),
      //           child: Transform(transform: Matrix4.skewY(x),
      //             child: Transform(transform: Matrix4.rotationZ(z),
      //               child: Padding(padding: EdgeInsets.all(10.0),
      //                 child: Text('Hello world')))))
      //       ]
      //     )
      //   )
      // ),

      //------------------------------------------------------------------------------------

      // 1.7 - Custom painter

      Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Hello world',style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
              CustomPaint(painter: painter())
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

class painter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final radius = 100.0;
    final Offset offset = Offset(0.0, 75.0);
    final Paint paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 10.0
      ..color = Colors.blue
      ..style = PaintingStyle.stroke;

    final Offset bodyStart = Offset(0.0, 50.0);
    final Offset bodyEnd = Offset(0.0, 0.0);

    canvas.drawCircle(offset, radius, paint);
    canvas.drawLine(bodyStart, bodyEnd, paint);

    final Rect rect = Rect.fromCircle(center: offset, radius: radius);
    final Paint rectPaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth =12.0
      ..color = Colors.orange
      ..style = PaintingStyle.stroke;
    canvas.drawRect(rect, rectPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}
