import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';
//import 'dart:ui' as ui;
import 'dart:typed_data';


class Painterwindow extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
/*
void main() => runApp(new MaterialApp(
      home: new HomePage(),
      debugShowCheckedModeBanner: false,
    ));
*/
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Offset> _points = <Offset>[];
  ByteData imgBytes;

  //static final recorder = ui.PictureRecorder();
  //final _canvas = Canvas();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Text('Sketch Board'),
      ),
      body: new Container(
        child: new GestureDetector(
          onPanUpdate: (DragUpdateDetails details) {
            setState(() {
              RenderBox object = context.findRenderObject();
              Offset _localPosition =
                  object.globalToLocal(details.globalPosition);
              _points = new List.from(_points)..add(_localPosition);
            });
          },
          onPanEnd: (DragEndDetails details) => _points.add(null),
          child: new CustomPaint(
            painter: new DrawLetter(points: _points),//, canvas: _canvas),
            size: Size.infinite,
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.clear),
        //onPressed: () => generateImage(recorder), //_points.clear(),
        onPressed: () => _points.clear(),
      ),
    );
  }

  //genarate image function
  void generateImage(PictureRecorder recorder) async {
    
    final picture = recorder.endRecording();
    final img = await picture.toImage(200, 200);
    final pngBytes = await img.toByteData(format: ImageByteFormat.png);

    setState(() {
      imgBytes = pngBytes;
    });
  }
}

class DrawLetter extends CustomPainter {
  List<Offset> points;
  Canvas canvas;

  //DrawLetter({this.points,this.canvas});
  DrawLetter({this.points});


  @override
  void paint(canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }
  @override
  bool shouldRepaint(DrawLetter oldDelegate) => oldDelegate.points != points;
  
}

