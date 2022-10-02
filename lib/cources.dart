import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Courses extends StatelessWidget {

   List<String> titles = [
     'تعلم الجيتار',
     'تعلم البيانو',
     'تعلم الناي',
     'تعلم القاعدة النورانية',
     'تعلم العود',
     'تعلم الكمان',
     'تعلم القانون',
     'تعلم البركشن',
     'تعلم الدرامز',
     'تعلم الطبلة وجميع الايقاعات',
     'تعلم الخط العربي',
     'تعلم الغناء والمقامات الصوتية',
     'تعلم الرسم بالفحم',
     'تعلم الدبكة الشعبية',
   ];

   List<String> durations = [
     'مدة الدورة: 3 شهور',
     'مدة الدورة: 3 شهور',
     'مدة الدورة: 3 شهور',
     'مدة الدورة: شهر',
     'مدة الدورة: 3 شهور',
     'مدة الدورة: 3 شهور',
     'مدة الدورة: 3 شهور',
     'مدة الدورة: 3 شهور',
     'مدة الدورة: 3 شهور',
     'مدة الدورة: 3 شهور',
     'مدة الدورة: شهر',
     'مدة الدورة: 3 شهور',
     'مدة الدورة: 24 ساعة',
     'مدة الدورة: 24 ساعة',
   ];

   List<String> prices = [
     '200',
     '200',
     '200',
     '80',
     '250',
     '300',
     '200',
     '200',
     '200',
     '200',
     '50',
     '150',
     '75',
     '50',
   ];

   List<String> images = [
     'images/qetar.png',
     'images/biano.png',
     'images/nai.png',
     'images/nawrani.png',
     'images/3od.png',
     'images/kman.png',
     'images/qanoon.png',
     'images/baraction.png',
     'images/drams.png',
     'images/tabla.png',
     'images/5t.png',
     'images/mqamat.png',
     'images/f7m.png',
     'images/dbka.png',
   ];

   List<double> sizes = [
     25,25,25,20,25,22,22,19,23,17,20,17,20,20
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Text("الدورات التدريبية",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,fontFamily: 'Tajawal'),),
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
      body:Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: GridView.count(
            physics: BouncingScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 1,
            childAspectRatio: 1 / 1.58,
            children: List.generate(
              images.length,
                  (index) => buildItems(context, titles[index], durations[index], prices[index], images[index], sizes[index])
            )
        ),
      ),
    );
  }

  Widget buildItems(context, String title, String duration, String price,String image, double size) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40.0,left: 5,right: 5),
          child: Container(
            color: Colors.green[600],
            width: MediaQuery.of(context).size.width/1.8,
            height: MediaQuery.of(context).size.height/3.2,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children:[
                      SizedBox(height: 40,),
                      Text(title,style: TextStyle(fontSize: size,fontFamily: 'Tajawal',fontWeight: FontWeight.bold),textAlign: TextAlign.end,),
                      SizedBox(height: 20,),
                      Text(duration,style: TextStyle(fontSize: 20,fontFamily: 'Harmattan',fontWeight: FontWeight.bold),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Text('شيكل شهريا',style: TextStyle(fontSize: 15,fontFamily: 'Tajawal',fontWeight: FontWeight.bold,color: Colors.grey[800]),),
                          ),
                          SizedBox(width: 3,),
                          Text(price,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey[800])),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(onPressed: (){azfFacebook();}, child: Text("انقر هنا",style: TextStyle(fontSize: 11,fontFamily: 'Tajawal',fontWeight: FontWeight.bold),),),
                          Text("لمعرفة المزيد",style: TextStyle(fontSize: 11,fontFamily: 'Tajawal',fontWeight: FontWeight.bold),),
                        ],
                      )

                    ]
                ),
              ),
            ),
          ),
        ),
        CircleAvatar(
          radius: 40,
          backgroundImage:  AssetImage(image),
          backgroundColor: Colors.green[600],
        )
      ],
    );
  }
  rsmFacebook() async {
    const url = 'https://m.facebook.com/story.php?story_fbid=pfbid031f7RUDCbapuUBxdKC7fAPBwsPL5hPRFEvfzQY1TUhZVDxRdDVyML34BDm1ody7w5l&id=100076183721107';
    if(await canLaunch(url)) {
      await launch(url);
    }
  }

  azfFacebook() async {
    const url = 'https://www.facebook.com/samaelayuobi/posts/pfbid02X9zpXC8y1u5eBCrPNGjZyjUWW6rhSoqeJmhk1xFv56bSbQMgrxGC47cHCDMd1kNXl';
    if(await canLaunch(url)) {
      await launch(url);
    }
  }

  dbkaFacebook() async {
    const url = 'https://www.facebook.com/samaelayuobi/posts/pfbid0W413femCRRsTQyaDsunBZffXTvLxFypY1wXbUVyFjvG9stzbQ2thPuZf7LN82bS3l';
    if(await canLaunch(url)) {
      await launch(url);
    }
  }

  nawraniFacebook() async {
    const url = 'https://www.facebook.com/samaelayuobi/posts/pfbid03593Jqi4nJVhebvRRTdnxouneUj3njkMCBF341pnMCBr3Qu81MNR9k2UyQQrTtXM2l';
    if(await canLaunch(url)) {
      await launch(url);
    }
  }

  ktFacebook() async {
    const url = 'https://www.facebook.com/samaelayuobi/posts/pfbid02ooJh8aEtsae5fMorQLBc3S7k9Spm5r99wcppa83TtRPY45e5sUspNJoihJJUKjZJl';
    if(await canLaunch(url)) {
      await launch(url);
    }
  }
}
