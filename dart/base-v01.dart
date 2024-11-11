#!/usr/bin/dart

import 'dart:io';

// [ zrfisaac ]

// [ about ]
// - author : Isaac Caires
// . - email : zrfisaac@gmail.com
// . - site : zrfisaac.github.io
// version : zrfisaac.dart.base.v01 : 1.0.0

void main() {
  // - variable
  bool vEndError = false;
  String vEndMessage = '';

  // : - about
  print('# [ about ]');
  print('# - author : Isaac Caires');
  print('# . - email : zrfisaac@gmail.com');
  print('# . - site : zrfisaac.github.io');
  print('# - version : zrfisaac.dart.base.v01 : 3.1.9');
  print('');

  // : - main
  if (!vEndError) {
    print('# [ main ]');
    try {
      // : - routine
      print('# - routine');
    } catch (e) {
      vEndError = true;
      vEndMessage = e.toString();
    }
    print('');
  }

  // : - end
  print('# [ end ]');
  if (vEndError) {
    print('# - error');
  } else {
    print('# - success');
  }
  if (vEndMessage != '') {
    print('# . - message : $vEndMessage');
  }

  // Simulating input in Dart
  stdout.write('Press Enter to exit...');
  stdin.readLineSync();
}
