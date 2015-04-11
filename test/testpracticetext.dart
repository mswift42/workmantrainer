import 'package:unittest/unittest.dart';
import 'dart:html';
import 'package:workmantrainer/practicetext.dart' show practiceText;
import 'package:workmantrainer/trainer.dart' show Trainer;

void main() {
  var target = document.querySelector('#targettext');
  practiceText('Test Text 1');
  test('set practice text', () {
    expect(target.text, 'Test Text 1');
  });
  var t1 = new Trainer();
  test('initialize class', () {
    expect(t1.currentposition, 0);
  });
}
