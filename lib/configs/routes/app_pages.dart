import 'package:get/get.dart';
import 'package:suitmedia_msib_2024/modules/first_screen/bindings/first_screen_binding.dart';
import 'package:suitmedia_msib_2024/modules/first_screen/views/first_screen_view.dart';
import 'package:suitmedia_msib_2024/modules/second_screen/bindings/second_screen_binding.dart';
import 'package:suitmedia_msib_2024/modules/second_screen/views/second_screen_view.dart';
import 'package:suitmedia_msib_2024/configs/routes/app_routes.dart';
import 'package:suitmedia_msib_2024/modules/third_screen/bindings/third_screen_binding.dart';
import 'package:suitmedia_msib_2024/modules/third_screen/views/third_screen_view.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = <GetPage<dynamic>>[
    GetPage(
      name: Routes.HOME,
      page: () => const FirstScreenView(),
      binding: FirstScreenBinding(),
    ),
    GetPage(
      name: Routes.SECOND_SCREEN,
      page: () => SecondScreenView(),
      binding: SecondScreenBinding(),
    ),
    GetPage(
      name: Routes.THIRD_SCREEN,
      page: () => const ThirdScreenView(),
      binding: ThirdScreenBinding(),
    ),
  ];
}
