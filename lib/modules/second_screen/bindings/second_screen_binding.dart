import 'package:get/get.dart';
import 'package:suitmedia_msib_2024/controllers/global_controller.dart';
import 'package:suitmedia_msib_2024/modules/second_screen/controllers/second_screen_controller.dart';

class SecondScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SecondScreenController>(
      () => SecondScreenController(),
    );

    Get.lazyPut<GlobalController>(
      () => GlobalController(),
    );
  }
}
