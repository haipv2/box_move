import 'dart:ui';

import 'package:box_move/component/box-component.dart';
import 'package:flame/box2d/box2d_component.dart';
import 'package:flutter/material.dart';

class BoxWorld extends Box2DComponent {
  BoxComponent boxComponent;

  @override
  void initializeWorld() {
//    addAll(DemoLevel(this).bodies);
  add(boxComponent = BoxComponent(this));
  }

  @override
  void update(double t) {
    super.update(t);
    cameraFollow(boxComponent,horizontal: 0.4, vertical: 0.4);
  }

  void handleTap(Offset globalPosition) {
    boxComponent.stop();
  }

  void handleDragUpdate(DragUpdateDetails details) {
    boxComponent.handleDragUpdate(details);
  }

  void handleDragEnd(DragEndDetails details) {
    boxComponent.handleDragEnd(details);
  }


}