import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String data;
/*
Future<Album> fetchAlbum(String data) async {
  //final response =
  //    await http.get('https://jsonplaceholder.typicode.com/albums/1');

  final http.Response response = await http.post(
    'https://jsonplaceholder.typicode.com/albums/',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': data,
    }),
  );
  
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
*/
Future<Album> fetchAlbum(String title) async {
  final http.Response response = await http.post(
    //'https://jsonplaceholder.typicode.com/albums',
    'http://7035ca45.ngrok.io',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 200) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}


class Album {
  //final int results;
  final String wwords;
  final String title;

  Album({this.title, this.wwords});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      //results: json['results'],
      wwords: json['wwords'],
      title: (json['results']['results']).toString()
    );
  }
}

//void main() => runApp(MyApp());

class DisplayResponse extends StatefulWidget {
  //DisplayResponse({Key key}) : super(key: key);
  final String value;
  DisplayResponse({Key key, @required this.value}) : super(key: key);
  

  @override
  _DisplayResponse createState() => _DisplayResponse(value);
}

class _DisplayResponse extends State<DisplayResponse> {
Future<Album> futureAlbum;
  String value;
  _DisplayResponse(this.value);
  @override
  void initState() { 
    super.initState();
    data = value;
    print(data);
    futureAlbum = fetchAlbum(data);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Score'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.title);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
