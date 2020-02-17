import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'box-game.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    Util flameUtil = Util();
    flameUtil.fullScreen();
    flameUtil.setOrientation(DeviceOrientation.portraitUp);



    BoxGame boxGame = BoxGame();
    TapGestureRecognizer tapper = TapGestureRecognizer();
    tapper.onTapDown = boxGame.onTapDown;
    tapper.onTapUp = boxGame.onTapUp;
    flameUtil.addGestureRecognizer(tapper);

    runApp(boxGame.widget);
}