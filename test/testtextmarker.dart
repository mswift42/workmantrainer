import 'package:unittest/unittest.dart';
import 'package:workmantrainer/textmarker.dart';

void main() {
  test('check initialisation of TextMarker Class works.', () {
    var tm = new TextMarker('some text',0,2,"CORRECT");
    expect(tm.targettext, 'some text');
    expect(tm.startposition,0);
    expect(tm.endposition,2);
    expect(tm.textState, 'CORRECT');
  });
  test('typedCorrectly returns correct span element.', () {
    var tm = new TextMarker('some text', 0, 2, "CORRECT");
    var span = tm.typedCorrectly();
    expect(span.text, 'so');
    expect(span.className, 'typedcorrect');
  });
  test('typedIncorrectly returns correct span element.', () {
    var tm = new TextMarker('some text', 0, 9, "INCORRECT");
    var span = tm.typedIncorrectly();
    expect(span.text, 'some text');
    expect(span.className, 'typedincorrect');
  });
  test('yetToBeTyped returns correct span element.', () {
    var tm = new TextMarker('some text', 0,1,'NOTTYPED');
    var span = tm.yetToBeTyped();
    expect(span.text, 's');
    expect(span.className, 'nottyped');
  });
}