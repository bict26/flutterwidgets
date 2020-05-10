import 'package:flutter/material.dart';
import 'package:flutterwidgets/src/pages/alert_page.dart';
import 'package:flutterwidgets/src/pages/animated_container_page.dart';
import 'package:flutterwidgets/src/pages/avatar_page.dart';
import 'package:flutterwidgets/src/pages/card_page.dart';
import 'package:flutterwidgets/src/pages/home_page.dart';
import 'package:flutterwidgets/src/pages/input_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes(){

  return <String, WidgetBuilder>{
        '/'    : (context) => HomePage(),
        '/alert': (context) => AlertPage(),
        '/avatar':(context) =>AvatarPage(),
        "/card" : (context) => CardPage(), 
        "/animatideContainer" : (context) => AnimatedContainerPage(),
        "/inputs" : (context) => InputPage(),
};

}
