import 'package:unittest/unittest.dart';

import 'package:workmantrainer/trainer.dart' show Trainer;

void main() {

  test('initialize class', () {
    var tr = new Trainer('some text');
    expect(tr.currentposition, 0);
    expect(tr.targettext, 'some text');
  });
  test('set position forward', () {
    var tr = new Trainer('');
    tr.currentposforward();
    tr.currentposforward();
    tr.currentposforward();
    expect(tr.currentposition, 3);
  });
  test('set position backward', () {
    var tr = new Trainer('');
    tr.currentposforward();
    tr.currentposforward();
    expect(tr.currentposition, 2);
    tr.currentposbackward();
    tr.currentposbackward();
    expect(tr.currentposition, 0);
  });
  test('calculate accuracy', () {
    var tr = new Trainer('some text');
    tr.errors = 2;
    tr.currentposition = 8;
    expect(tr.accuracy(), 78);
    tr.errors = 1;
    tr.currentposition = 8;
    expect(tr.accuracy(), 89);
    tr.errors = 9;
    tr.currentposition = 8;
    expect(tr.accuracy(), 0);
    tr.errors = 0;
    tr.currentposition = 8;
    expect(tr.accuracy(), 100);
    tr.errors = 1;
    tr.currentposition = 0;
    expect(tr.accuracy(),0);
  });
  test('add to checkTypedCorrectly', () {
    var tr = new Trainer('some text');
    tr.checkAtPosition(0,'t');
    tr.checkAtPosition(1,'o');
    tr.checkAtPosition(8,'t');
    expect(tr.typeCheck[0],false);
    expect(tr.typeCheck[1],true);
    expect(tr.typeCheck[2],true);
  });
    
  
}
  
