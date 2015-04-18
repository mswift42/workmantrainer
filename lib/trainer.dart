library trainer;

import 'dart:html';
import 'dart:convert';
import 'package:workmantrainer/textmarker.dart' show TextMarker;


class Trainer {
  int _currentposition = 0;
  String targettext;
  int _errors;
  Map<int,bool> typeCheck = new Map<int,bool>();
  
  Trainer(this.targettext);

  int get currentposition => _currentposition;
  set currentposition(int n) => _currentposition = n;

  int currentposforward() => this._currentposition++;

  int currentposbackward() => _currentposition--;

  String charAtCurrentPosition() => targettext.split('')[this.currentposition];
  String targetCharAtPosition(int pos) => targettext.split('')[pos];

  set errors(int n) => _errors = n;
  
  // return ration of correctly typed characters to amount of text characters.
  int accuracy() {
    var sofar = targettext.split('').getRange(0, _currentposition + 1);
    return 100 - (_errors.toDouble() / sofar.length.toDouble() * 100).round();
  }
  void checkAtPosition(int pos, String character) {
    typeCheck[pos] = (targetCharAtPosition(pos) == character);
  }
  
  void handleKeyEvent(Event e) {  
    KeyEvent k = new KeyEvent.wrap(e);
    var tinput = querySelector('#tarea');
    switch (k.keyCode) {
      case KeyCode.SHIFT:
        break;
         case KeyCode.BACKSPACE:
        if (this.currentposition > 0) {
          this.currentposbackward();
          break;
        }
        break;
      default:
        var te = querySelector('#test');
        var typed = tinput.value.split('')[_currentposition];
        checkAtPosition(_currentposition,typed);
        this.currentposforward();
    }
  }
}
void initTrainer() {
  var target = querySelector('#targettext');
  var tr = new Trainer(target.text);
  var input = querySelector('#tarea');
  input.onKeyUp.listen((e) {
    if (tr.currentposition < target.length) {
      print(tr.currentposition);
      tr.handleKeyEvent(e);
    }
  });
}
