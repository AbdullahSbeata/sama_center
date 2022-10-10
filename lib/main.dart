import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sama/splash_screen.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       builder: DevicePreview.appBuilder,
       theme: ThemeData(
         appBarTheme: AppBarTheme(
           systemOverlayStyle: SystemUiOverlayStyle(
             statusBarColor: Colors.green[600],
           ),
         ),
       ),
       debugShowCheckedModeBanner: false,
       home: LayoutBuilder(
           builder: (context, constraints) {
             var deviceType = getDeviceType(MediaQuery.of(context));
             print(deviceType);
             return SplashScreen();
           },
       ),
     );
  }
}
enum DeviceType {
  Mobile, Tablet, Desktop
}
DeviceType getDeviceType(MediaQueryData mediaQueryData) {
  Orientation orientation = mediaQueryData.orientation;
  double width = 0;
  if (orientation == Orientation.landscape) {
    width = mediaQueryData.size.height;
  } else {
    width = mediaQueryData.size.width;
  }
  if (width >= 950) {
    return DeviceType.Desktop;
  }
  if (width >= 600) {
    return DeviceType.Tablet;
  }
  return DeviceType.Mobile;
}
