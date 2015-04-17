
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
  test('mark Text function returns appropriate span element', () {
    var tm = new TextMarker('some text', 0, 1,'CORRECT');
    var span = tm.markedText();
    expect(span.text, 's');
    expect(span.className, 'typedcorrect');
    var tm2 = new TextMarker('some text', 0,3,'INCORRECT');
    var span2 = tm2.markedText();
    expect(span2.text, 'som');
    expect(span2.className, 'typedincorrect');
    var tm3 = new TextMarker('some text', 0,2,'NOTTYPED');
    var span3 = tm3.markedText();
    expect(span3.text, 'so');
    expect(span3.className, 'nottyped');
      });
}