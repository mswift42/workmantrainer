import 'package:unittest/unittest.dart';
import 'package:unittest/html_config.dart';
import 'dart:html';
import 'package:workmantrainer/practicetext.dart' show practiceText;

void main() {
  var target = document.querySelector('#targettext');
  practiceText('Test Text 1');
  test('set practice text', () {
    expect(target.text, 'Test Text 1');
  });
}

