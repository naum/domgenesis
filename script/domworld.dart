library domworld;

import 'dart:math';
import 'horatio.dart';

var WIDTH_MULT = [2, 3, 4, 5, 6];
var HEIGHT_MULT = [2, 3, 4];
var PROV_PER_NATION = [10, 15, 20];
var DEFAULT_SEA = 30;
var DEFAULT_MOUNTAIN = 20;
var DEFAULT_RUGGED = 30;
var DEFAULT_RIVER = 100;
var AGES = ['EA', 'MA', 'LA'];
var HOF = [5, 10, 15];
var RESEARCH = ['easy', 'standard', 'difficult', 'very difficult'];
  
var RNG = new Random();

class DomWorld {

  var totnations;
  var prov, sea, mountain, rugged, river;
  var mapdim, mapname;
  var age, startprov, indstr, ssf;
  var moneymult, resourcemult, supplymult;
  var refreq, hofentries, researchdifficulty;

  DomWorld(words) {
    totnations = 1 + RNG.nextInt(RNG.nextInt(11) + 1) + 1;
    var x;
    x = RNG.nextInt(2) + RNG.nextInt(2);
    prov = totnations * PROV_PER_NATION[x];
    var wmx = RNG.nextInt(3) + RNG.nextInt(3);
    var hmx = RNG.nextInt(2) + RNG.nextInt(2);
    var aspectRatio = WIDTH_MULT[wmx] / HEIGHT_MULT[hmx];
    var mapWidth = prov * 15;
    var mapHeight = (mapWidth * (1 / aspectRatio)).ceil();
    mapdim = "${mapWidth}x${mapHeight}";
    sea = rollSucc(20, DEFAULT_SEA, 100) * 5;
    mountain = rollSucc(20, DEFAULT_MOUNTAIN, 100) * 5;
    rugged = rollSucc(20, DEFAULT_RUGGED, 100) * 5;
    river = rollSucc(20, DEFAULT_RIVER, 1000) * 50;
    mapname = drawMapName(words);
    age = AGES[RNG.nextInt(AGES.length)];
    startprov = RNG.nextInt(RNG.nextInt(9) + 1) + 1;
    indstr = rollSucc(9, 5, 9);
    if (age == 'EA') {
      ssf = rollSucc(15, 9, 15) * 5;
    } else if (age == 'MA') {
      ssf = rollSucc(15, 8, 15) * 5;
    } else if (age == 'LA') {
      ssf = rollSucc(15, 7, 15) * 5;
    }
    moneymult = 50 + (rollSucc(10, 2, 10) * 25);
    resourcemult = 50 + (rollSucc(10, 2, 10) * 25);
    supplymult = 50 + (rollSucc(10, 2, 10) * 25);
    refreq = (RNG.nextInt(4) < 3) ? 'common' : 'rare';
    var hofx = RNG.nextInt(2) + RNG.nextInt(2);
    hofentries = HOF[hofx];    
    var researchx = rollSucc(3, 1, 3);
    researchdifficulty = RESEARCH[researchx];
  }

  String drawMapName(String words) {
    var wl = words.split("\n");
    var reProperName = new RegExp(r'^[A-Z]\w{1,11}$');
    var vmnl = wl.where((w) => reProperName.hasMatch(w)).toList();
    return vmnl[RNG.nextInt(vmnl.length)];
  }

  num rollSucc(rolls, succ, tot) {
    var totHit = 0;
    for (var i = 0; i < rolls; i += 1) {
      if (RNG.nextInt(tot) < succ) {
        totHit += 1;
      }
    }
    return totHit;
  }

  String toString() {
    return '''
TOTAL NATIONS: ${totnations}

MAP DIMENSIONS: ${mapdim}
PROVINCES: ${prov}
SEA: ${sea}
MOUNTAIN: ${mountain}
RUGGED: ${rugged}
RIVER: ${river}

MAP NAME: ${mapname}

AGE: ${age}
STARTING PROVINCES: ${startprov}
STRENGTH OF INDEPENDENTS: ${indstr}
SPECIAL SITE FREQUENCY: ${ssf}
MONEY MULTIPLE: ${moneymult}
RESOURCE MULTIPLE: ${resourcemult}
SUPPLY MULTIPLE: ${supplymult}
RANDOM EVENTS: ${refreq}
HALL OF FAME ENTRIES: ${hofentries}
MAGIC RESEARCH: ${researchdifficulty}
    ''';
  }

}
