library trainer;


class Trainer{
  int _currentposition = 0;
  String targettext;
  int _errors;

  Trainer(this.targettext);
  int get currentposition => _currentposition;
  int currentposforward() => _currentposition++;
  int currentposbackward()=> _currentposition--;
  set errors(int n) => _errors = n;
  
  int accuracy() {
    return 100 - (_errors.toDouble() / targettext.length.toDouble() * 100).round();
  }
}