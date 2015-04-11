library trainer;


class Trainer{
  int _currentposition = 0;

  Trainer();
  num get currentposition => _currentposition;
  num currentposforward() => _currentposition++;
  num currentposbackward()=> _currentposition--;
}