import 'dart:ui';

import 'package:box2d_flame/box2d.dart';
import 'package:flame/box2d/box2d_component.dart';
import 'package:flutter/material.dart';

class BoxComponent extends BodyComponent {
  bool jumping;
  bool forward;
  bool idle;

  BoxComponent(Box2DComponent box) : super(box) {
    loadImage();
    createBody();
  }

  void loadImage() {}

  void createBody() {
    final shape = CircleShape();
    shape.radius = 25;
    shape.p.x = 0.0;

    final activeFixtureDef = new FixtureDef();
    activeFixtureDef.shape = shape;
    activeFixtureDef.restitution = 0.0;
    activeFixtureDef.density = 0.05;
    activeFixtureDef.friction = 0.2;
    FixtureDef fixtureDef = activeFixtureDef;
    final activeBodyDef = new BodyDef();
    activeBodyDef.linearVelocity = new Vector2(0.0, 0.0);
    activeBodyDef.position = new Vector2(0.0, 15.0);
    activeBodyDef.type = BodyType.DYNAMIC;
    activeBodyDef.bullet = true;
    BodyDef bodyDef = activeBodyDef;

    this.body = world.createBody(bodyDef)
      ..createFixtureFromFixtureDef(fixtureDef);
  }

  @override
  void update(double t) {
    super.update(t);
    this.idle =
        body.linearVelocity.x.abs() < 0.1 && body.linearVelocity.y.abs() < 0.1;
    this.forward = body.linearVelocity.x >= 0.0;
    this.jumping = body.getContactList() == null;
  }

  Rect boxRect = Rect.fromLTWH(0, 300, 50, 50);

  @override
  void renderCircle(Canvas c, Offset center, double radius) {
//    boxRect = Rect.fromCenter(center: center) ;
//    print(center);
    c.drawRect(boxRect, Paint()..color = Colors.red);
//    c.drawCircle(boxRect.center, radius, Paint()..color=Colors.red);
  }

  void impulse(Offset velocity) {
    Vector2 force = Vector2(velocity.dx, -velocity.dy)..scale(100.0);
    body.applyLinearImpulse(force, center, true);
  }

  void stop() {
    body.linearVelocity = Vector2(0, 0);
    body.angularVelocity = 0;
  }

  void handleDragUpdate(DragUpdateDetails details) {
    impulse(details.delta);
  }

  void handleDragEnd(DragEndDetails details) {
    impulse(details.velocity.pixelsPerSecond);
  }
}
