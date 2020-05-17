import 'package:flutter/material.dart';
import 'package:scan_score/prediction_tflite.dart';
    
class Scorecard extends StatelessWidget{

    final List scores;
    Scorecard({Key key, @required this.scores}) : super(key: key);
    @override
    Widget build(BuildContext context)
    {
      return Scaffold(
                            appBar: AppBar(
                                      title: Text(''),
                              ),
                    body: Center( 
                  heightFactor: 20,
                  widthFactor: 40,
                child: new ListView(
                  padding: const EdgeInsets.fromLTRB(20,150,10,10),
                  children: <Widget>[
                    Text('Your Score',style: new TextStyle(fontSize: 40.0)),
                    Text(scores[0]+" %",style: new TextStyle(fontSize: 80.0)),
                    Text('Word Count',style: new TextStyle(fontSize: 40.0)),
                    Text(scores[1],style: new TextStyle(fontSize: 60.0)),

                  ],
                  ),
                ),
                );
    }
  }


class GradingTFLite extends StatefulWidget {
  @override

  final String textvalue;
  GradingTFLite({Key key, @required this.textvalue}) : super(key: key);
  _GradingTFLite createState() => _GradingTFLite(textvalue);
}

class _GradingTFLite extends State<GradingTFLite> {
  //TextEditingController _controller;
    
  Classifier _classifier;
  List<Widget> _children;
  String textvalue,score;
  double scoreval;
  _GradingTFLite(this.textvalue);
  @override
  void initState() {
    super.initState();
    //_controller = TextEditingController();
    _classifier = Classifier();
    _children = [];
    _children.add(Container());
    
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SafeArea(
      child: ListView (
        padding: const EdgeInsets.fromLTRB(10,200,10,10),
        children: <Widget>[
          RaisedButton(
                    child: const Text("Let's Go",
                    style: TextStyle (
                fontSize: 30,
                color: Colors.black
              ),),
                    onPressed: () {
                      final prediction = _classifier.predict(textvalue);
                      final scores = prediction.toStringAsFixed(2);
                      final count = _classifier.countwords(textvalue);
                      var arr = [scores,count];
                      print(scores);

                      Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Scorecard(scores: arr),
                    
                  ));
                  //return CircularProgressIndicator();
                    }

                      ),
                      TextField(
                        textAlign: TextAlign.center,
                        

                      ),
        ],
      ),
      ),
      ),
    );
  }
}
   