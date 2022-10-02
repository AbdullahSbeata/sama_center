import 'package:admob_flutter/admob_flutter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marquee/marquee.dart';
import 'package:sama/ads.dart';
import 'package:sama/the works.dart';
import 'package:sama/cources.dart';
import 'package:sama/about center.dart';
import 'package:sama/about app.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  AdmobInterstitial? admobInterstitial;
  AnimationController? animationController ;
  double rotationAngle = 0;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 500));
    animationController!.repeat(reverse: true);
    animationController?.addListener(() {
      setState((){
        rotationAngle = animationController!.value;
      });
    });
    admobInterstitial = AdmobInterstitial(
        adUnitId: AdsManager.interstatialAdUnitId,
        listener: (AdmobAdEvent event, Map<String,dynamic>? args) {
          if(event == AdmobAdEvent.closed) admobInterstitial?.load();
        }
    );

    admobInterstitial?.load();
  }

  @override
  void dispose() {
    admobInterstitial?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'images/image1.png',
      'images/image2.png',
      'images/image5.png',
      'images/image6.png',
      'images/image7.png',
      'images/image29.png',
      'images/image30.png',
      'images/image31.png',
      'images/image32.png',
      'images/image33.png',
      'images/image34.png',
      'images/image35.png',
      'images/image36.png',
      'images/image38.png',
      'images/image39.png',
      'images/image40.png',
      'images/image41.png',
      'images/image42.png',
      'images/image43.png',
      'images/image44.png',
      'images/dbkka.jpg',
      'images/image45.png'
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 40,
        backgroundColor: Colors.green[600],
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Text(" الرئيسية",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,fontFamily: 'Tajawal'),),
          ),
          SizedBox(width: 12,),
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                  onPressed: (){
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 30,
                  )
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.grey[300],
      endDrawer: Drawer(
        width: MediaQuery.of(context).size.width/1.3,
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  color: Colors.green[600],
                  height: 160,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 70,left: 100),
                    child: DefaultTextStyle(
                      style: TextStyle(fontFamily: 'Tajawal',fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 95.0),
                        child: AnimatedTextKit(
                          animatedTexts: [
                             RotateAnimatedText("القائمة",rotateOut: false,textAlign: TextAlign.center,alignment: AlignmentDirectional.topCenter),
                          ],
                        ),
                      ),
                    )
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      IconButton(icon: Icon(Icons.arrow_back_ios),
                        onPressed: (){
                            admobInterstitial?.show();
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Info()));
                        },
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Text("معلومات عن المركز",style: TextStyle(fontFamily: 'Tajawal',fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                      ),
                      SizedBox(width: 20,),
                      Icon(Icons.info,size: 30,),
                      SizedBox(width: 20,),
                    ],
                  ),
                ),
                SizedBox(height: 12,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("تواصل معنا",style: TextStyle(fontFamily: 'Tajawal',fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                      ),
                      SizedBox(width: 20,),
                      Icon(Icons.connect_without_contact,size: 30,),
                      SizedBox(width: 20,),
                    ],
                  ),
                ),
                SizedBox(height: 12,),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      IconButton(onPressed: (){facebook();}, icon: Icon(FontAwesomeIcons.facebook,color: Colors.blue,size: 30,)),
                      SizedBox(width: 8,),
                      IconButton(onPressed: (){instagram();}, icon: Icon(FontAwesomeIcons.instagram,color: Colors.pink,size: 30,)),
                      SizedBox(width: 8,),
                      IconButton(onPressed: (){messanger();}, icon: Icon(FontAwesomeIcons.facebookMessenger,color: Colors.purple,size: 30,)),
                      SizedBox(width: 8,),
                      IconButton(onPressed: (){whatsapp();}, icon: Icon(FontAwesomeIcons.whatsapp,color: Colors.green[800],size: 30,)),
                      SizedBox(width: 8,),
                      IconButton(onPressed: (){sms();}, icon: Icon(FontAwesomeIcons.sms,color: Colors.blueAccent,size: 30,)),
                      SizedBox(width: 8,),
                      IconButton(onPressed: (){calling();}, icon: Icon(FontAwesomeIcons.phone,color: Colors.green[500],size: 25,)),
                      SizedBox(width: 8,),
                      IconButton(onPressed: (){youtube();}, icon: Icon(FontAwesomeIcons.youtube,color: Colors.red,size: 30,)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      IconButton(
                          onPressed: (){
                             admobInterstitial?.show();
                             Navigator.push(context, MaterialPageRoute(builder: (context) => Courses()));
                          }, icon: Icon(Icons.arrow_back_ios)
                      ),
                      Spacer(),
                      Text("الدورات التدريبية",style: TextStyle(fontFamily: 'Tajawal',fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                      SizedBox(width: 20,),
                      Icon(Icons.book,size: 30,),
                      SizedBox(width: 20,),
                    ],
                  ),
                ),
                SizedBox(height: 12,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      IconButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Amalna()));
                            admobInterstitial?.show();
                          },
                          icon: Icon(Icons.arrow_back_ios)
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text("أعمالنا",style: TextStyle(fontFamily: 'Tajawal',fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                      ),
                      SizedBox(width: 20,),
                      Icon(Icons.business,size: 30,),
                      SizedBox(width: 20,),
                    ],
                  ),
                ),
                SizedBox(height: 12,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      IconButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => T6beeq()));
                           admobInterstitial?.show();
                          },
                          icon: Icon(Icons.arrow_back_ios)
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2.0),
                        child: Text("معلومات عن التطبيق",style: TextStyle(fontFamily: 'Tajawal',fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                      ),
                      SizedBox(width: 20,),
                      Icon(Icons.info_outline,size: 30,),
                      SizedBox(width: 20,),
                    ],
                  ),

                ),
                SizedBox(height: 10,),
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
              children: [
                SizedBox(height: 20,),
                SizedBox(
                  height: 50,
                  child: Marquee(
                    text: 'مرحباً بكم في مركز سما',
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25,fontFamily: 'Cairo'),
                    scrollAxis: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    blankSpace: 150,
                    velocity: 60.0,
                    pauseAfterRound: Duration(seconds: 0),
                    startPadding: 10.0,
                    accelerationDuration: Duration(seconds: 0),
                    accelerationCurve: Curves.linear,
                    decelerationDuration: Duration(milliseconds: 400),
                    decelerationCurve: Curves.easeOut,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                SizedBox(height: 20,),
                CarouselSlider(
                  items: images.map((e) => Card(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.green[600],
                      child: Image(
                        image: AssetImage(e),
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),).toList(),
                  options: CarouselOptions(

                    height: MediaQuery.of(context).size.height/2,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: true,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(seconds: 1),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 10,end:10,start:10,bottom:5),
                  child: Card(
                    child: Container(
                      padding: EdgeInsetsDirectional.all(8),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/2.8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.rotate(
                            angle: rotationAngle,
                            child: CircleAvatar(
                              backgroundColor: Colors.green[600],
                              radius: 50,
                              backgroundImage: AssetImage('images/samamedia.png'),
                            ),
                          ),
                          SizedBox(height: 12),
                          Text('سما ميديا',style: TextStyle(fontSize: 20,fontFamily: 'Tajawal',fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.7),),textAlign: TextAlign.right,),
                          SizedBox(height: 15,),
                          Text('قسم متخصص في جميع مجالات السوشيال ميديا والاعلام والتصوير والاعلانات والتسجيل والانتاج الفني',style: TextStyle(fontSize: 16,fontFamily: 'Harmattan',fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.7),),textAlign: TextAlign.right,),


                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 10,start: 10,end: 10,bottom: 5),
                  child: Card(
                    child: Container(
                      padding: EdgeInsetsDirectional.all(8),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/2.8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.rotate(
                            angle: rotationAngle,
                            child: CircleAvatar(
                              backgroundColor: Colors.green[600],
                              radius: 50,
                              backgroundImage: AssetImage('images/samaculture.png'),
                            ),
                          ),
                          SizedBox(height: 12),
                          Text('سما للثقافة والفنون',style: TextStyle(fontSize: 20,fontFamily: 'Tajawal',fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.7),),textAlign: TextAlign.right,),
                          SizedBox(height: 15,),
                          Text('قسم يضم فريق كلاسيكي وفريق مديح نبوي وفريق دبكة شعبية ومركز تعليمي مميز وفريق ترفيهي',style: TextStyle(fontSize: 16,fontFamily: 'Harmattan',fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.7),),textAlign: TextAlign.right,),


                        ],
                      ),
                    ),
                  ),
                ),
              ],
          ),
      ),
    );
  }

  calling() async {
    const url = 'tel:+972597484302';
    if(await canLaunch(url)) {
      await launch(url);
    }
  }

  whatsapp() async {
    const url = 'whatsapp://send?phone=+972597484302';
    if(await canLaunch(url)) {
      await launch(url);
    }
  }

  messanger() async {
    const url = 'http://m.me/samaelayuobi';
    if(await canLaunch(url)) {
      await launch(url);
    }
  }

  facebook() async {
    //https://m.facebook.com/story.php?story_fbid=pfbid031f7RUDCbapuUBxdKC7fAPBwsPL5hPRFEvfzQY1TUhZVDxRdDVyML34BDm1ody7w5l&id=100076183721107
    const url = 'https://m.facebook.com/samaelayuobi';
    if(await canLaunch(url)) {
      await launch(url);
    }
  }

  sms() async {
    const url = 'sms:+972597484302';
    if(await canLaunch(url)) {
      await launch(url);
    }
  }

  instagram() async {
    const url = 'https://www.instagram.com/sama_studio0/';
    if(await canLaunch(url)) {
      await launch(url);
    }
  }

  youtube() async {
    const url = 'https://www.youtube.com/channel/UCM0U2tIHXOfguoC8pyoibKA';
    if(await canLaunch(url)) {
      await launch(url);
    }
  }
  Widget buildHome(String image, String title, String text) {
    return Padding(
      padding: EdgeInsetsDirectional.all(10),
      child: Card(
        child: Container(
          padding: EdgeInsetsDirectional.all(8),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/3.2,
          child: Column(
            children: [
              Transform.rotate(
                angle: rotationAngle,
                child: CircleAvatar(
                  backgroundColor: Colors.green[600],
                  radius: 50,
                  backgroundImage: AssetImage(image),
                ),
              ),
              SizedBox(height: 12),
              Text(title,style: TextStyle(fontSize: 20,fontFamily: 'Tajawal',fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.7),),textAlign: TextAlign.right,),
              SizedBox(height: 15,),
              Text(text,style: TextStyle(fontSize: 16,fontFamily: 'Harmattan',fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.7),),textAlign: TextAlign.right,),


            ],
          ),
        ),
      ),
    );
  }
}
