library trainer;

import 'dart:html';
import 'dart:convert';


class Trainer{
  int _currentposition = 0;
  String targettext;
  int _errors;

  Trainer(this.targettext);
  
  int get currentposition => _currentposition;
  set currentposition(int n) => _currentposition = n;
  
  int currentposforward() => _currentposition++;
  
  int currentposbackward()=> _currentposition--;

  String charAtPosition() => targettext.split('')[_currentposition];
  
  set errors(int n) => _errors = n;
  
  int accuracy() {
    var sofar = targettext.split('').getRange(0, _currentposition + 1);
    return 100 - (_errors.toDouble() / sofar.length.toDouble() * 100).round();

  }
}

void initTrainer() {
  var target = querySelector('#targettext').text;
  var tr = new Trainer(target);
  var input = querySelector('#tarea');
  var output = querySelector('#test');
  input.onKeyUp.listen((e) {
        
        String typed = input.value.split('')[tr.currentposition];
    if (typed != tr.charAtPosition() ) {
      output.text = 'Error: ' + typed;

      tr.currentposforward();
    } else {
      tr.currentposforward();
    }
  });
}