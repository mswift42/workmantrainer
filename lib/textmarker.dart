library textmarker;

import 'dart:html';

class TextMarker {
  List<String> characters;
  int startposition;
  int endposition;
  String textState; // were characters from start to end position typed correctly.

  TextMarker(this.characters,this.startposition, this.endposition,this.textState);
}
  

