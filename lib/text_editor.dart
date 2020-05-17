// Flutter code sample for TextField

// This sample shows how to get a value from a TextField via the [onSubmitted]
// callback.
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:scan_score/display_response.dart';
import 'package:scan_score/display_response_tflite.dart';


const s = "Type Something !";
  
/// This Widget is the main application widget.
class TextEditor extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';
  final String data;
  TextEditor({this.data});
  

  @override
  //s = this.data;
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(value: data),
      debugShowCheckedModeBanner: false,
    );
  }
}


class MyStatefulWidget extends StatefulWidget {
  final String value;
  MyStatefulWidget({Key key, @required this.value}) : super(key: key);
  //final Data data;
  //MyStatefulWidget(String data1);
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState(value);
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String value;
  _MyStatefulWidgetState(this.value);
  TextEditingController _controller;
  //Classifier _classifier;
  
  Future<Album> futureAlbum;
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: value
    );
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Editor'),
      ),
      body: SafeArea(
      child: ListView (
        padding: const EdgeInsets.fromLTRB(10,100,10,10),
        children: <Widget>[
        Center(
        child: TextField(
          decoration: const InputDecoration(
            hintText: "Write some text here"
          ),
          maxLines: null,
          autocorrect: true,
          controller: _controller,
          onSubmitted: (String value) async {
            await showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Thanks!'),
                  content: Text('You typed "$value".'),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
          ),
        ),
          RaisedButton (
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DisplayResponse(value: _controller.text)),
            );
            },
            child: Text(
              'Evaluate (API)',
              style: TextStyle (
                fontSize: 20,
                color: Colors.black
              ),
            )
          ),
          SizedBox(height: 50),
          RaisedButton (
            onPressed: () {
              //double s =_classifier.predict(_controller.text);
              //print("Score : "+s.toString());
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GradingTFLite(textvalue: _controller.text)),
            );
            },
            child: Text(
              'Evaluate (TFLite)',
              style: TextStyle (
                fontSize: 20,
                color: Colors.black
              ),
            )
          ),
          ],
      ),
      ),
    );
  }
}
