library textmarker;

import 'dart:html';     

class TextMarker {
  String targettext;
  int startposition;
  int endposition;
  String textState; // were characters from start to end position typed correctly.

  TextMarker(this.targettext,this.startposition, this.endposition,this.textState);

  SpanElement textSpan(int start,end, String classname) {
    var span = new SpanElement()
      ..classes.add(classname)
      ..text = targettext.substring(start,end);
    return span;
  }
  SpanElement typedCorrectly(int start,end) {
    return textSpan(start,end, 'typedcorrect');
  }
  SpanElement typedIncorrectly(int start,end) {
    return textSpan(start,end, 'typedincorrect');
  }
  SpanElement yetToBeTyped(int start,end) {
    return textSpan(start,end, 'nottyped');
  }
}

