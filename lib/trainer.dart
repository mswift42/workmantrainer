library trainer;

class Trainer{
  int _currentposition = 0;

  Trainer();
  num currentposforward() => this._currentposition++;
  num currentposbackward() => this._currentposition--;
}