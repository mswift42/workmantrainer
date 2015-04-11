import 'package:unittest/unittest.dart';

import 'package:workmantrainer/trainer.dart' show Trainer;

void main() {

  test('initialize class', () {
    var tr = new Trainer();
    expect(tr.currentposition, 0);
  });
  test('set position forward', () {
    var tr = new Trainer();
    tr.currentposforward();
    tr.currentposforward();
    tr.currentposforward();
    expect(tr.currentposition, 3);
  });
  test('set position backward', () {
    var tr = new Trainer();
    tr.currentposforward();
    tr.currentposforward();
    expect(tr.currentposition, 2);
    tr.currentposbackward();
    tr.currentposbackward();
    expect(tr.currentposition, 0);
  });
}
