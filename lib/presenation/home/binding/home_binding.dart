
import 'package:get/get.dart';
import 'package:skininfectiondetector/presenation/home/controller/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
 Get.lazyPut<HomeController>(() => HomeController());
   }

}