library textmarker;

import 'dart:html';

class TextMarker {
  List<String> characters;
  int startposition;
  int endposition;
  enum textState(CORRECT, INCORRECT, TOBETYPED);

  TextMarker(this.characters,this.startposition, this.endposition,this.textState);
}
  

