import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Amalna extends StatefulWidget {

  @override
  State<Amalna> createState() => _AmalnaState();
}

class _AmalnaState extends State<Amalna> {
   late YoutubePlayerController controller;
   late YoutubePlayerController controller1;
   late YoutubePlayerController controller7;
   late YoutubePlayerController controller8;


  @override
  void initState() {
    super.initState();
     const url = 'https://www.youtube.com/watch?v=uDSu8d_JLq4';
     const url1 = 'https://www.youtube.com/watch?v=-6yFH7jocmU';
    const url7 = 'https://www.youtube.com/watch?v=onNx-F6iZJI';
    const url8 = 'https://www.youtube.com/watch?v=8lexYG8CAzs';
    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url)!,
        flags: YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
          loop: false,
        ),

    );
    controller1 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url1)!,
        flags: YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
          loop: false,
        )
    );
    controller7 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url7)!,
        flags: YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
          loop: false,
        )
    );
    controller8 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url8)!,
        flags: YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
          loop: false,
        )
    );
  }
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    controller.pause();
  }
  @override
  Widget build(BuildContext context) {
    var pageController = PageController();
    List<String> images = [
      'images/3ml1.png',
      'images/3ml3.png',
      'images/3ml4.png',
      'images/3ml5.png',
      'images/3ml6.png',
      'images/3ml7.png',
      'images/3ml8.png',
      'images/3ml10.png',
      'images/3ml11.png',
      'images/3ml12.png',
      'images/3ml14.png',
      'images/3ml15.png',
      'images/3ml16.png',
      'images/3ml17.png',
      'images/3ml18.png',
      'images/3ml19.png',
      'images/3ml21.png',
      'images/3ml24.png',
      'images/3ml25.png',
      'images/3ml26.png',
      'images/3ml28.png',
      'images/3ml29.png',
      'images/3ml30.png',
      'images/3ml31.png',
      'images/3ml32.png',
      'images/3ml33.png',
      'images/3ml34.png',

    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        actions: [
          Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Text("أعمالنا",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,fontFamily: 'Tajawal'),),
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Text("تصميمات احترافية",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Elmessiri'),),
            SizedBox(height: 15,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2,
              child:   PageView.builder(
                reverse: true,
                physics:BouncingScrollPhysics(),
                controller: pageController,
                itemBuilder: (BuildContext context, int index) =>
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.all(Radius.circular(15)),
                          color: Colors.green[600],
                        ),
                        child: Image(image: AssetImage(images[index]),fit: BoxFit.fill,)
                    ),
                itemCount: images.length,
              ),
            ),
            SizedBox(height: 15,),
            SmoothPageIndicator(
              textDirection: TextDirection.rtl,
              controller: pageController,
              count: images.length,
              effect: ScrollingDotsEffect(
                spacing: 5.0,
                dotColor: Colors.grey,
                activeDotColor: Colors.green,
                dotHeight: 12,
                dotWidth: 12,
              ),
            ),
            SizedBox(height: 20,),
            Text("فيديوهات اعلانية",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Elmessiri'),),
            SizedBox(height: 20,),
            YoutubePlayer(
              bottomActions: [
                CurrentPosition(),
                ProgressBar(isExpanded: true),
                const PlaybackSpeedButton(),
              ],
              width: MediaQuery.of(context).size.width,
              controller: controller,
              showVideoProgressIndicator: true,
            ),
            SizedBox(height: 20,),
            Text("اغاني خاصة لأعياد الميلاد",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Elmessiri'),),
            SizedBox(height: 20,),
            YoutubePlayer(
              bottomActions: [
                CurrentPosition(),
                ProgressBar(isExpanded: true),
                const PlaybackSpeedButton(),
              ],
              width: MediaQuery.of(context).size.width,
              controller: controller7,
              showVideoProgressIndicator: true,
            ),
            SizedBox(height: 20,),
            Text("اغاني خاصة بأسماء العروسين",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Elmessiri'),),
            SizedBox(height: 20,),
            YoutubePlayer(
              bottomActions: [
                CurrentPosition(),
                ProgressBar(isExpanded: true),
                const PlaybackSpeedButton(),
              ],
              width: MediaQuery.of(context).size.width,
              controller: controller8,
              showVideoProgressIndicator: true,
            ),
            SizedBox(height: 20,),
            Text("تسجيل وتصوير واخراج الأعمال الفنية",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Elmessiri'),),
            SizedBox(height: 20,),
            YoutubePlayer(
                bottomActions: [
                  CurrentPosition(),
                  ProgressBar(isExpanded: true),
                   const PlaybackSpeedButton(),
                ],
              width: MediaQuery.of(context).size.width,
              controller: controller1,
              showVideoProgressIndicator: true,
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
