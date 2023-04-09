import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'infrastructure/navigation/navigaton.dart';
import 'infrastructure/navigation/routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final cameras =await availableCameras();
  runApp( MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.cameras, Key? key}) : super(key: key);
  final List<CameraDescription> cameras;


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.home, //edit
      getPages: Nav.routes,
      builder: (context, Widget? child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(textScaleFactor: 1.1),
          child: child!,
        );
      },
    );
  }
}
