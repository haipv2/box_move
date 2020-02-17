import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';

import 'model/box-world.dart';
import 'model/box.dart';

class BoxGame extends Game with TapDetector, PanDetector {
  final BoxWorld boxWorld = new BoxWorld();

//  Box box;
  double titleSizeX, titleSizeY;

//  Size screenSize;

  BoxGame() {
//    init();
    boxWorld.initializeWorld();
  }

  @override
  void resize(Size size) {
    super.resize(size);
//    screenSize = size;
    boxWorld.resize(size);
  }

  @override
  void render(Canvas c) {
//    box.render(c);
    boxWorld.render(c);
  }

  @override
  void update(double t) {
//    box.update(t);
    boxWorld.update(t);
  }

  void init() async {
    resize(await Flame.util.initialDimensions());
    titleSizeX = 50;
    titleSizeY = 50;
//    box = Box(this, 0,screenSize.height*2/3);
//    box.screenSize = screenSize;
  }

  void onTapDown(TapDownDetails d) {
//    if (box.boxRect.contains(d.globalPosition)) {
//      box.onTapDown();
//    }
//  boxWorld.handleTap(d.globalPosition);

  }

  void onTapUp(TapUpDetails d) {
//    box.onTapUp();
    boxWorld.handleTap(d.globalPosition);
  }

  @override
  void onPanUpdate(DragUpdateDetails details) {
    super.onPanUpdate(details);
    boxWorld.handleDragUpdate(details);
  }

  @override
  void onPanEnd(DragEndDetails details) {
    super.onPanEnd(details);
    boxWorld.handleDragEnd(details);
  }
}
