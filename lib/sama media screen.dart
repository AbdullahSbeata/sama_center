import 'package:flutter/material.dart';

class SamaMedia extends StatelessWidget {


  List<String> images = [
    'images/momawall.jpg',
    'images/e3lan.png',
    'images/ktaba.png',
    'images/tsmeem.png',
    'images/d3aya.png',
    'images/entaj.png',
    'images/camera.png',
    'images/tsgeel.png',
    'images/edara.png',
    'images/dwra.png'
  ];
  
  List<String> texts = [
    'اعلانات ممولة',
    'فيديوهات اعلانية',
    "كتابة محتوى جذاب",
    "تصميمات احترافية",
    'دعاية واعلان',
    'انتاج فني',
    'التصوير',
    'تسجيل كافة الأعمال الفنية',
    'ادارة صفحات السوشيال ميديا',
    'دورات تدريبية'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        leading: Icon(Icons.add,color: Colors.green[600],),
        elevation: 40,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Text("ماذا نقدم؟",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,fontFamily: 'Tajawal'),),
          ),
          SizedBox(width: 8,),
        ],
      ),
      body: GridView.count(
        physics: BouncingScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        childAspectRatio: 1 / 1.58,
        children: List.generate(
            images.length,
            (index) => buildItems(context, images[index], texts[index]),
        )
      ),
    );
  }

  Widget buildItems(context, String image, String text) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width/4,
        height: MediaQuery.of(context).size.height/4.1,
        color: Colors.green[600],
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(image),
                  backgroundColor: Colors.green[600],
                ),
                SizedBox(height: 20,),
                Text(text,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,fontFamily: 'Tajawal'),textDirection: TextDirection.rtl,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
