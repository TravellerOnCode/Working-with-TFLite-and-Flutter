import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class Classifier {
  //final _modelFile = 'grading.tflite';
  //final _vocabFile = 'tokenizer_labels.txt';

  final int _sentenceLen = 1024;

  //final String start = '<START>';
  final String pad = '<PAD>';
  final String unk = '<OOV>';

  Map<String, int> _dict;

  Interpreter _interpreter;

  Classifier() {
    _loadModel();
    _loadDictionary();
  }

  void _loadModel() async {

    _interpreter = await Interpreter.fromAsset('grading.tflite');
    print('Interpreter loaded successfully');
  }

  void _loadDictionary() async {
    final vocab = await rootBundle.loadString('assets/tokenizer_labels.txt');
    var dict = <String, int>{};
    final vocabList = vocab.split('\n');
    for (var i = 0; i < vocabList.length; i++) {
      var entry = vocabList[i].trim().split(':');
      //print(entry);
      String key = entry[0];
      key = key.replaceAll(RegExp(r'"'), '');
      /*
      if (i<=3){
        print(key);

      }
      */
      dict[key] = int.parse(entry[1]);
    }
    _dict = dict;
    print('Dictionary loaded successfully');
  }

  String countwords(String rawText)
  {
    final toks = rawText.split(' ');
    int a = toks.length; 
    return a.toString();
  }

  double predict(String rawText) {
    //_loadModel();
    //_loadDictionary();
    print("Prediction Called !");
    print(rawText);
    var input = tokenizeInputText(rawText);
    print("Text Converted Successfully !");
    var output = List<double>(1).reshape([1, 1]);
    print("It's time to Call the interpreter !");
    _interpreter.run(input, output);

    print("Output Received !");

    double s = 0;
    s = (output[0][0] as double)*10;
    /*
    if ((output[0][0] as double) > (output[0][1] as double)) {
      s = 0;
    } else {
      s = 1;
    }
    */
    return s;
  }

  List<List<double>> tokenizeInputText(String text) {
    final toks = text.split(' ');
    //print(toks);
    //print(_dict);
    var v = 0;
    var vec = List<double>.filled(_sentenceLen,v.toDouble() );

    var index = 0;
    //if (_dict.containsKey(start)) {
    //  vec[index++] = _dict[start].toDouble();
    //}

    for (var tok in toks) {
      if (index > _sentenceLen) {
        break;
      }
      //print(tok);
      tok = tok.replaceAll(RegExp(r'\w\s'), '');
      vec[index++] = _dict.containsKey(tok)
          ? _dict[tok].toDouble()
          : _dict[unk].toDouble();
    }

    return [vec];
  }
}