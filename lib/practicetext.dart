library practicetext;

import 'dart:html';

void practiceText(String contents) {
  var target = document.querySelector('#targettext');
  target.appendText(contents);
}