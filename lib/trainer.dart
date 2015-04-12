library trainer;


class Trainer{
  int _currentposition = 0;
  String targettext;
  int _errors;

  Trainer(this.targettext);
  
  int get currentposition => _currentposition;
  void set currentposition(int n) => _currentposition = n;
  
  int currentposforward() => _currentposition++;
  
  int currentposbackward()=> _currentposition--;
  
  set errors(int n) => _errors = n;
  
  int accuracy() {
    var sofar = targettext.split('').getRange(0, _currentposition + 1);
    return 100 - (_errors.toDouble() / sofar.length.toDouble() * 100).round();

  }
}