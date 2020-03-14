import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker_modern/image_picker_modern.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
//import 'package:photo_view/photo_view.dart';
import 'package:scan_score/text_editor.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';
/*
class Data{
  String scannedtext = "";
  Data({this.scannedtext});
}*/
String scannedtext = "";
var imagepropeties;

class LoadImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
} 


class MyHomePage extends StatefulWidget {
  //MyHomePage({Key key, @required this.data}) : super(key: key);
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File pickedImage;
  
  bool isImageLoaded = false;

  Future pickImage() async {
    var tempStore = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      pickedImage = tempStore;
      isImageLoaded = true;
      //imagepropeties = decodeImageFromList(pickedImage.readAsBytesSync());
    });
    //return pickedImage;
  }

  Future readText() async {
    FirebaseVisionImage ourImage = FirebaseVisionImage.fromFile(pickedImage);
    TextRecognizer recognizeText = FirebaseVision.instance.textRecognizer();
    VisionText readText = await recognizeText.processImage(ourImage);
    //String scannedtextt = "";
    
    for (TextBlock block in readText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement word in line.elements) {
          String s = word.text;
          scannedtext = scannedtext + " " + s;
          //print(s);
        }}}
    
    //final data1 = Data(
    //  scannedtext: scannedtextt);
    

    Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TextEditor(data: scannedtext)),
            );
  } 
  /*Future result() async {
       scannedtext = "Avijit India";
       print (scannedtext);
  }*/

  @override

  Widget build(BuildContext context) {
    //File pickedImage_;

    //pickedImage_ = pickImage();
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text("Image Picker"),
          backgroundColor: Colors.blueGrey
        ),
        body: ListView(
      children: <Widget>[
        /*
        Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: FileImage(pickedImage),
          fit: BoxFit.cover
        ) ,
      ),
    ),
    isImageLoaded
            ?     PhotoView(
          imageProvider: FileImage(pickedImage),
        ),
         */           
        
        //SizedBox(height: 100.0),
        isImageLoaded
            ? Center(
                child: Container(
                    height: 500,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: FileImage(pickedImage), 
                            fit: BoxFit.cover))),
                            
              )
            : Container(),
          
        SizedBox(height: 10.0),
        RaisedButton(
          child: Text('Pick an image'),
          onPressed: pickImage,
        ),
        
        RaisedButton(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text('Read Text'),
                  ),
                  onPressed: readText,
                  color: Colors.blue,
                  ) ,

        /*
        SizedBox(height: 10.0),
        RaisedButton(
          child: Text('Read Text'),
          onPressed: readText,
        ),
        RaisedButton(
          child: Text('Show Text'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
            );
          },
        )*/
      ],
    ));
  }
}


class SecondRoute extends StatelessWidget {
Future result() async {
       scannedtext = "Avijit";
       print (scannedtext);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scanned Text"),
      ),
      /*
      body: SizedBox.expand(
        child: DraggableScrollableSheet(
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              color: Colors.blue[100],
              child: Column(
                children: <Widget>[
                    SizedBox(height: 10.0),
                    Text(
                          scannedtext,
                          style: new TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
            );
            },
      ),
      ),*/
      body:Column(
        children: <Widget>[
          //SizedBox(height: 10.0),
        Flexible(child:
        Text(
          scannedtext,
                    style: new TextStyle(fontSize: 20.0),
        ), 
        ),
        FloatingActionButton(
        child: new Icon(Icons.clear),
        onPressed: () { 
          scannedtext="";
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
            );
          /*Text(
          scannedtext,
                    style: new TextStyle(fontSize: 20.0),
        );*/
        },
      )
        ],
      )
      );   
  }
}
