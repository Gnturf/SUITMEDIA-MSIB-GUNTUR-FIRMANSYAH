import 'package:get/get.dart';
import 'package:suitmedia_msib_2024/controllers/global_controller.dart';
import 'package:suitmedia_msib_2024/modules/third_screen/controllers/third_screen_controller.dart';

class ThirdScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThirdScreenController>(
      () => ThirdScreenController(),
    );

    Get.lazyPut<GlobalController>(
      () => GlobalController(),
    );
  }
}
