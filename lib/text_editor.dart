// Flutter code sample for TextField

// This sample shows how to get a value from a TextField via the [onSubmitted]
// callback.
import 'dart:async';
//import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'package:scan_score/display_response.dart';
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

//Add code to make HTTP Request
//START
/*
Future<Album> fetchAlbum() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/albums/1');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}


class Album {
  final int userId;
  final int id;
  final String title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
*/

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
  Future<Album> futureAlbum;
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: value
    );

    //HTTP Request
    //super.initState();
    //futureAlbum = fetchAlbum();
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
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DisplayResponse(value: _controller.text)),
            );

            },
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
