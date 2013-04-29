
import 'dart:async';
import 'dart:html';
import 'domworld.dart';

var pageactionbar = query('#pageactionbar');
var pageboard = query('#pageboard');
var properwords = '';

main() {
  HttpRequest.getString('/properwords.txt').then(prepareUI);
}

void prepareUI(respcont) {
  properwords = respcont;
  var buGenesis = new ButtonElement();
  buGenesis.text = 'genesis';
  buGenesis.onClick.listen((e) {
    rollDomWorld();
  });
  pageactionbar.children.add(buGenesis);
  window.onKeyPress.listen((e) {
    print('charCode: ${e.charCode}');
    if (e.charCode == 71 || e.charCode == 103) {
      buGenesis.click();
    }
  });
}

void rollDomWorld() {
  var domworld = new DomWorld(properwords);
  pageboard.innerHtml = '<pre>${domworld}</pre>'; 
}
