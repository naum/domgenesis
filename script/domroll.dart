#!/usr/bin/env dart

import 'dart:io';
import 'domworld.dart';

main() {
  var fcWords = new File("/usr/share/dict/words").readAsStringSync();
  var domworld = new DomWorld(fcWords);
  print(domworld);
}
