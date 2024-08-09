import 'package:get/get.dart';
import 'package:suitmedia_msib_2024/modules/first_screen/controllers/first_screen_controller.dart';

class FirstScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirstScreenController>(
      () => FirstScreenController(),
    );
  }
}
