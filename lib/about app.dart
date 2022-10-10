import 'package:flutter/material.dart';

class T6beeq extends StatefulWidget {
  const T6beeq({Key? key}) : super(key: key);

  @override
  State<T6beeq> createState() => _T6beeqState();
}

class _T6beeqState extends State<T6beeq> with SingleTickerProviderStateMixin{
  AnimationController? animationController ;
  double rotationAngle = 10;
  
  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 950));
    animationController!.repeat(reverse: true);
    animationController?.addListener(() {
      setState((){
        rotationAngle = animationController!.value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Text("معلومات عن التطبيق",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,fontFamily: 'Tajawal'),),
          ),
          SizedBox(width: 10,),
          IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios,textDirection: TextDirection.rtl,color: Colors.white,)),
        ],
        leading: Icon(Icons.add,color: Colors.green[600],),
        elevation: 40,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
             SizedBox(height: 30,),
             Padding(
               padding: const EdgeInsets.only(left: 18.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Transform.scale(
                     scale: rotationAngle*1,
                       child: CircleAvatar(
                         radius: 60,backgroundImage: AssetImage('images/samamedia.png'),
                         backgroundColor: Colors.green[600],
                       ),

                   ),
                   SizedBox(width: 20,),
                   Transform.scale(
                     scale: rotationAngle*1,
                       child: CircleAvatar(
                         radius: 60,backgroundImage: AssetImage('images/samaculture.png'),
                         backgroundColor: Colors.green[600],
                       ),
                   ),
                 ],
               ),
             ),
             SizedBox(height: 20,),
             Padding(
               padding: const EdgeInsets.only(left: 10.0),
               child: Text("هذا التطبيق وشعاراته ومحتواه علامة تجارية لصالح مركز سما",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: 'Harmattan',color: Colors.red[800]),textAlign: TextAlign.right,),
             ),
             SizedBox(height: 10,),
             Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text("جميع الحقوق محفوظة",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: 'Harmattan',color: Colors.red[800]),textAlign: TextAlign.right,),
            ),
             SizedBox(height: 10,),
             Text("تم تطوير هذا التطبيق من قبل: م. عبدالله يوسف سبيته",style: TextStyle(fontSize: 14,fontFamily: 'Tajawal',fontWeight: FontWeight.bold,color: Colors.green[800]),),
             SizedBox(height: 10,),
             Text("جوال رقم: 0598267845",style: TextStyle(fontSize: 14,fontFamily: 'Tajawal',fontWeight: FontWeight.bold,color: Colors.green[800]))
          ],
        ),
      )
    );
  }
}
