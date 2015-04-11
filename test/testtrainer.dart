import 'package:unittest/unittest.dart';

import 'package:workmantrainer/trainer.dart' show Trainer;

void main() {
  var tr = new Trainer();
  test('initialize class', () {
    expect(tr.currentposition, 0);
  });
  test('set position forward', () {
    tr.currentposforward();
    tr.currentposforward();
    tr.currentposforward();
    expect(tr.currentposition, 3);
  });
}
