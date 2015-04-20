import 'package:unittest/unittest.dart';
import 'package:workmantrainer/practicetext.dart' as pt;

void main() {
  
  test('make a list of random words', () {
    var words = pt.randomWords(pt.pluswf);
    expect(words.length, 140);
  });
 
}
