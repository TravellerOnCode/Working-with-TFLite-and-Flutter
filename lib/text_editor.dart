// Flutter code sample for TextField

// This sample shows how to get a value from a TextField via the [onSubmitted]
// callback.

import 'package:flutter/material.dart';
//import 'package:scan_score/load_image.dart';

const s = "Type Something !";
//void main() => runApp(TextEditor());
  
/// This Widget is the main application widget.
class TextEditor extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';
  final String data;
  //TextEditor({this.data});
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
            onPressed: null,
            child: Text(
              'Evaluate',
              style: TextStyle (
                fontSize: 20,
                color: Colors.black
              ),
            )
          ),
          ],
      ),
      ),
      /*
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.clear),
        onPressed: () => print('clear'),
      ),*/
    );
  }
}
