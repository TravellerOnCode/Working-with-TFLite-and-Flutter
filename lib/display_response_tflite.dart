import 'package:flutter/material.dart';
import 'package:scan_score/prediction_tflite.dart';

//void main() => runApp(MyApp());

class GradingTFLite extends StatefulWidget {
  @override
  _GradingTFLite createState() => _GradingTFLite();
}

class _GradingTFLite extends State<GradingTFLite> {
  TextEditingController _controller;
  Classifier _classifier;
  List<Widget> _children;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _classifier = Classifier();
    _children = [];
    _children.add(Container());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: const Text('Text classification'),
        ),
        body: Container(
          padding: const EdgeInsets.all(4),
          child: Column(
            children: <Widget>[
              Expanded(
                  child: ListView.builder(
                itemCount: _children.length,
                itemBuilder: (_, index) {
                  return _children[index];
                },
              )),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.orangeAccent)),
                child: Row(children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                          hintText: 'Write some text here'),
                      controller: _controller,
                    ),
                  ),
                  FlatButton(
                    child: const Text('Classify'),
                    onPressed: () {
                      final text = _controller.text;
                      final prediction = _classifier.predict(text);
                      print(prediction);
                      
                      setState(() {
                        print(prediction);
                      /*
                        _children.add(Dismissible(
                          key: GlobalKey(),
                          onDismissed: (direction) {},
                          child: Card(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              color: prediction == 1
                                  ? Colors.lightGreen
                                  : Colors.red,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    text,
                                    style: const TextStyle(fontSize: 16),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ));
                        _controller.clear();
                        */
                      }
                      
                      );
                    },
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}