import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main()=>runApp(MaterialApp(home: MyApps(),));
class MyApps extends StatefulWidget {
  @override
  _MyAppsState createState() => _MyAppsState();
}

class _MyAppsState extends State<MyApps> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller=AnimationController(duration: Duration(milliseconds: 5000),vsync: this);
    animation= Tween(begin: 0.0,end: 400.0).animate(controller);
    animation.addListener((){
      setState(() {

      });
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(child: FlutterLogo(size: animation.value,),)),
    );
  }
}
