import 'package:flutter/material.dart';


void main()=>runApp(MaterialApp(home: MyApps(),));
class MyApps extends StatefulWidget {
  @override
  _MyAppsState createState() => _MyAppsState();
}

class _MyAppsState extends State<MyApps> with TickerProviderStateMixin {
Animation animation;
AnimationController controller;

@override
  void initState() {
    controller=AnimationController(duration:Duration(milliseconds: 1000),vsync: this);
    CurvedAnimation curvedAnimation=CurvedAnimation(parent: controller, curve: Curves.bounceInOut);
    animation=Tween(begin: 0.0,end: 360.0).animate(curvedAnimation);
    animation.addStatusListener((AnimationStatus animationStatus){
      if(animationStatus==AnimationStatus.completed){
        controller.reverse();
      }else if(animationStatus==AnimationStatus.dismissed){
        controller.forward();
      }
    });
    controller.forward();
    super.initState();
  }

  Widget rasel(BuildContext context,Widget child){
  return Transform.rotate(
    angle: animation.value,
    child: Container(
      height: 200.0,
      width: 200.0,
      color: Colors.transparent,
      child: FlutterLogo(size: animation.value,),
    ),
  );

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child:AnimatedBuilder(animation: animation, builder: rasel)
      )
    );
  }
}
