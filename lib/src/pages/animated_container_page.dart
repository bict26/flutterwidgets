import 'dart:math';

import 'package:flutter/material.dart';


class AnimatedContainerPage extends StatefulWidget {
  AnimatedContainerPage({Key key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
 
  double _with = 50.0;
  double _height = 50.0;
  Color _color = Colors.pinkAccent;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Animacion")),
      body: Center(

        child: AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.easeOutQuint,
            width:  _with,
            height: _height,
            decoration: BoxDecoration(borderRadius: _borderRadius, color: _color ),
        ),
     ),
    floatingActionButton: FloatingActionButton(
      onPressed: _pressButton,
      child: Icon(Icons.play_arrow),
    )
    );
  }

  void _pressButton(){

    final random = Random();

    setState(() {
      _with = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(255), 
        random.nextInt(255),
        1);


      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());



    });
  }

}