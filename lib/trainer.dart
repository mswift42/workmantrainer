library trainer;

import 'dart:html';
import 'dart:convert';

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
  String targetCharAtPosition(int index) => targettext.split('')[index];

  set errors(int n) => _errors = n;

  int accuracy() {
    var sofar = targettext.split('').getRange(0, _currentposition + 1);
    return 100 - (_errors.toDouble() / sofar.length.toDouble() * 100).round();
  }
  void checkAtPosition(int pos, String character) {
    typeCheck[pos] = (targettext.split('')[pos] == character);
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
        print(typeCheck.toString());
        if (typed != charAtCurrentPosition()) {
          
        
        te.text = 'Error: ' + charAtCurrentPosition() + '!=' + typed;
        }
        this.currentposforward();
    }
  }
}
void initTrainer() {
  var target = querySelector('#targettext').text;
  var tr = new Trainer(target);
  var input = querySelector('#tarea');
  input.onKeyUp.listen((e) {
    if (tr.currentposition < target.length) {
      print(tr.currentposition);
      tr.handleKeyEvent(e);
    }
  });
}
