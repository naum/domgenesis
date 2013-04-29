library horatio;

import 'dart:math';

var RNG = new Random();

void shuffle(List l) {
  var n = l.length;
  while (n > 0) {
    var i = RNG.nextInt(n);
    n -= 1;
    var t = l[n];
    l[n] = l[i];
    l[i] = t;
  }
}
