library trainer;

import 'dart:html';
import 'dart:convert';

class Trainer {
  int _currentposition = 0;
  String targettext;
  int _errors;

  Trainer(this.targettext);

  int get currentposition => _currentposition;
  set currentposition(int n) => _currentposition = n;

  int currentposforward() => _currentposition++;

  int currentposbackward() => _currentposition--;

  String charAtPosition() => targettext.split('')[this.currentposition];

  set errors(int n) => _errors = n;

  int accuracy() {
    var sofar = targettext.split('').getRange(0, _currentposition + 1);
    return 100 - (_errors.toDouble() / sofar.length.toDouble() * 100).round();
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
        te.text = 'Typed: ' + tinput.text.split('')[this.currentposition];
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
      tr.handleKeyEvent(e);
    }
  });
}
