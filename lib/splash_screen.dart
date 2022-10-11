import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sama/bottom navegation bar.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
 late AnimationController animationController ;
  double rotationAngle = 0;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 500));
    animationController.repeat(reverse: true);
    animationController.addListener(() {
      setState((){
        rotationAngle = animationController.value;
      });
    });
    Timer(Duration(seconds: 5),navigatoTo);
  }
  void navigatoTo() {
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => HomeScreen()), (
        route) => false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.translate(
              offset: Offset(0,rotationAngle * 30),
              child: CircleAvatar(
                radius: 90,
                backgroundImage: AssetImage('images/samaculture.png'),
                backgroundColor: Colors.green[600],
              ),
            ),
            SizedBox(height: 40,),
            Text('مركز سما للثقافة والفنون', style:TextStyle(fontFamily: 'Reem Kufi',fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black)),
            SizedBox(height: 10,),
            Text('Sama Center for Culture and Arts', style:TextStyle(fontFamily: 'Reem Kufi',fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black)),



          ],
        ),
      ),
    );
  }
}
