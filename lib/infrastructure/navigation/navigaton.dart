import 'package:get/get.dart';
import 'package:skininfectiondetector/infrastructure/navigation/routes.dart';
import 'package:skininfectiondetector/presenation/home/binding/home_binding.dart';
import 'package:skininfectiondetector/presenation/home/home_view.dart';
class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),

  ];
}