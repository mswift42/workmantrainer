library textmarker;

import 'dart:html';     

class TextMarker {
  String targettext;
  int startposition;
  int endposition;
  String textState; // were characters from start to end position typed correctly.

  TextMarker(this.targettext,this.startposition, this.endposition,this.textState);

  SpanElement textSpan(String classname) {
    var span = new SpanElement()
      ..className = classname
      ..text = targettext.substring(startposition,endposition);
    return span;
  }
  SpanElement typedCorrectly() {
    return textSpan('typedcorrect');
  }
  SpanElement typedIncorrectly() {
    return textSpan('typedincorrect');
  }
  SpanElement yetToBeTyped() {
    return textSpan('nottyped');
  }
  SpanElement markedText() {
    switch (textState) {
     case  'CORRECT': 
      return typedCorrectly();
     case  'INCORRECT':
        return typedIncorrectly();
      default:
        return yetToBeTyped();
    }
  }
        
}

