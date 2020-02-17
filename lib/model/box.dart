//import 'dart:math';
//import 'dart:ui';
//
//import 'package:flutter/material.dart';
//
//import '../box-game.dart';
//
//class Box {
//  final BoxGame game;
//  Rect boxRect;
//  Size screenSize;
//
//  Box(this.game, double x, double y) {
//    boxRect = Rect.fromLTWH(x, y, game.titleSizeX, game.titleSizeY);
//    targetOffset = Offset(boxRect.left + (game.titleSizeX * 3),
//        -(boxRect.left + (game.titleSizeY * 3)));
//  }
//
//  double get speed => game.titleSizeX;
//
//  void render(Canvas c) {
//    c.drawRect(boxRect, Paint()..color = Colors.red);
//  }
//
//  double counter = 0;
//  Offset targetOffset;
//  Rect rect1;
//  int count = 0;
//
//  void update(double t) {
//    double stepDistance = speed * t;
//    if (isJump) {
//
//      Offset offsetx = boxRect.translate(25, -80).center;
////      boxRect = boxRect.shift(offsetx);
//      double yForce = -80;
//      double xSpeed = 50;
//      yForce += yForce*t;
//      boxRect = boxRect.translate(xSpeed, yForce);
//
//    } else {
////      boxRect = boxRect.translate(game.titleSizeX * t, 0);
//      if (boxRect.left > screenSize.width || boxRect.top < 0) {
////        boxRect =
////            Rect.fromLTWH(0, game.titleSizeY, game.titleSizeX, game.titleSizeY);
//      }
//    }
//  }
//
//  bool isJump = false;
//
//  void onTapDown() {
//    isJump = true;
//  }
//
//  void onTapUp() {
//    isJump = false;
//  }
//}
