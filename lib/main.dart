//import 'dart:io';
import 'package:flutter/material.dart';
import 'package:scan_score/load_image.dart';
import 'package:scan_score/painter.dart';
import 'package:scan_score/text_editor.dart';
import 'package:scan_score/speech_to_text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppMainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppMainScreen extends StatefulWidget {
  AppMainScreen({Key key}) : super(key: key);

  @override
  _AppMainScreenState createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {

  void _onItemTapped(int index) {
    if (index==0){
      Text('Welcome',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ));
    }
    if (index==1) {
      Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>  LoadImage(),
                    //builder: (BuildContext context) => MyHomePage(),
                  ));
    }
    else if (index==2){
      Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => TextEditor(),
                    //builder: (BuildContext context) => MyHomePage(),
                  ));
    }
    else if (index==3){
      Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Painterwindow(),
                    //builder: (BuildContext context) => MyHomePage(),
                  ));
    }
    else if (index==4){
      Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => SpeechToText(),
                    //builder: (BuildContext context) => MyHomePage(),
                  ));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /*appBar: AppBar(
        title: Text('Scan _ Score',
        style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 30,
              fontWeight: FontWeight.normal,
            ),
            ),
        ),*/
      body: Center(
        child: Text("\n<Name>\n\nLet's \nstart \nwriting...",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 70,
              fontWeight: FontWeight.w300,
              //textAlign: 
            )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
            color: Colors.black,
            ),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera,
            color: Colors.black),
            title: Text('Gallery',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black12
            )
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create,
            color: Colors.black,
            )
            ,
            title: Text('Editor'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.brush,
            color: Colors.black,
            ),
            title: Text('SketchBoard'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.audiotrack,
            color: Colors.black,
            ),
            title: Text('SpeechToText'),
          ),
        ],
        //currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        backgroundColor: Colors.blueGrey,
        onTap: _onItemTapped,
      ),
    );
  }
}
/*
class AppMainScreen extends StatelessWidget {

  _onTap(int index) {
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return new NewPage();
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white60,
        appBar: AppBar(
          title: Text("Scan_Grade"),
          backgroundColor: Colors.black
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(10),
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(5.0),
                child:
                    FlatButton(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Icon(Icons.camera,
                             size: 200.0),
                  ),
                  onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>  LoadImage(),
                    //builder: (BuildContext context) => MyHomePage(),
                  ));
                  },
                      //color: Colors.white60,
                  ),
                       
              ),
              Container(
                margin: const EdgeInsets.all(5.0),
                //color: Colors.blue,
                 child:
                    FlatButton(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Icon(Icons.create,
                             size: 200.0),
                  ),
                  onPressed: (){
                    print("Button Pressed !!");
                     Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => TextEditor(),
                    //builder: (BuildContext context) => MyHomePage(),
                  ));
                  },
                      //color: Colors.white60,
                  )   
              ),
              Container(
                margin: const EdgeInsets.all(5.0),
                //color: Colors.blue,
                 child:
                    FlatButton(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Icon(Icons.brush,
                             size: 200.0),
                  ),
                  onPressed: (){
                    print("Button Pressed !!");
                     Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Painterwindow(),
                    //builder: (BuildContext context) => MyHomePage(),
                  ));
                  },
                      //color: Colors.white60,
                  )   
              )             
            ]
          ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera),
          title: Text('Gallery'),
          
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.create),
          title: Text('TextEditor'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.brush),
          title: Text('Slate'),
        ),
      ],
      //currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onTap
        ),
        
    );
  }
}
*/
