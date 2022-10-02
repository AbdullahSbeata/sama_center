import 'package:flutter/material.dart';

class SamaCulture extends StatelessWidget {

  List<String> images = [
    'images/s2.png',
    'images/s3.png',
    'images/s4.png',
    'images/s1.png',
    'images/s5.png',
  ];

  List<String> titles = [
    'سما المدينة للمدائح النبوية',
    'سما للفنون الشعبية',
    'فريق سما الترفيهي',
    'فريق سما الكلاسيكي',
    'مركز سما التعليمي',
  ];

  List<String> texts = [
    'نقدم لكم بكل حب باقة من الأناشيد والمدائح النبوية ممزوجة بعبق من الأجواء الروحانية الحماسية الهادفة وفرقتنا العظيمة جاهزة لتحيي لكم جميع مناسباتكم وجلساتكم السعيدة',
    'نحيي تراثنا الفلسطيني والأجواء الفلسطينية  ونعزز حب الوطن بالدبكة الفلسطينية وبوصلة مميزة من الأغاني الوطنية ونحكي للعالم بدبكتنا وفرقتنا أننا ما زلنا هنا وأننا بتراثنا سنحيى ونكون ونحن على أتم الاستعداد لنحيي لكم مناسباتكم وحفلاتكم واحتفاءاتكم الوطنية وأفراحكم السعيدة',
    'نصنع لكم البسمة ولأطفالكم ممزوجة باللعب والمرح ونمحي كل أسى بات في أعينكم ونستبدله بالفرحة والضحك وفرقتنا على استعداد تام لتكون معكم في مناسباتكم وحفلاتكم وفي كل مرة كنتم بحاجة للضحك والمرح',
    'نقدم لكم أنغاما ووصلات غنائية كلاسيكية واجتماعية مميزة من فريقنا العظيم لتكونو على موعد مع وصلات من الجمال والابداع وفرقتنا على أتم الاستعداد لتحيي لكم مناسباتكم وتكون معكم في اوقاتكم السعيدة',
    'نقدم لكم الدورس التعليمية القوية ( اللغة العربية - الرياضيات - العلوم الاجتماعية - العلوم - اللغة الانجليزية ) لطلاب وطالبات المرحلة الابتدائية مع أفضل المدربين'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        leading: Icon(Icons.add,color: Colors.green[600],),
        elevation: 40,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Text("ماذا نضم؟",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,fontFamily: 'Tajawal'),),
          ),
          SizedBox(width: 8,),
        ],
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
          itemBuilder: (context,index) => buildItems(images[index], titles[index], texts[index], context),
          itemCount: images.length,
      ),
    );
  }

  Widget buildItems(String image, String title, String text,context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        color: Colors.green[600],
        width: MediaQuery.of(context).size.width/1.10,
        height: MediaQuery.of(context).size.height/2.5,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/9,
                    child: Image(image: AssetImage(image)),
                  ),
                  SizedBox(height: 20,),
                  Text(title,style: TextStyle(fontSize: 15,fontFamily: 'Tajawal',fontWeight: FontWeight.bold,color: Colors.black),),
                  SizedBox(height: 5,),
                  Text(text,style: TextStyle(fontSize: 14,fontFamily: 'Harmattan',fontWeight: FontWeight.bold,color: Colors.black,),textAlign: TextAlign.right,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
