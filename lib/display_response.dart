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
    'https://grader-flask-model.herokuapp.com/',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'text': title,
      'password':'AQUA121G890UP002',
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
  final String wordscount;
  final String title;

  Album({this.title, this.wordscount});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      //results: json['results'],
      wordscount: (json['results']['count']).toString(), 
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
          title: Text(''),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //return Text(snapshot.data.title,style: new TextStyle(fontSize: 80.0));
                return Center( 
                  heightFactor: 20,
                  widthFactor: 40,
                child: new ListView(
                  padding: const EdgeInsets.fromLTRB(20,150,10,10),
                  children: <Widget>[
                    Text('Your Score',style: new TextStyle(fontSize: 40.0)),
                    Text(snapshot.data.title+" %",style: new TextStyle(fontSize: 80.0)),
                    Text('Word Count',style: new TextStyle(fontSize: 40.0)),
                    Text(snapshot.data.wordscount,style: new TextStyle(fontSize: 60.0)),

                  ],
                  ),
                );
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
