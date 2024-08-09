import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:suitmedia_msib_2024/configs/routes/app_routes.dart';
import 'package:suitmedia_msib_2024/controllers/global_controller.dart';
import 'package:suitmedia_msib_2024/modules/second_screen/controllers/second_screen_controller.dart';
import 'package:suitmedia_msib_2024/configs/styles/text_styles.dart';
import 'package:suitmedia_msib_2024/widgets/custom_button.dart';

class SecondScreenView extends StatelessWidget {
  SecondScreenView({
    super.key,
  });

  final String userName = Get.arguments as String;

  AppBar _appBar(GlobalController globalController) {
    return AppBar(
      toolbarHeight: 60,
      elevation: 0.5,
      shadowColor: const Color.fromRGBO(226, 227, 228, 1),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          globalController.selectedUser.value = null;
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Color.fromRGBO(85, 74, 240, 1),
        ),
      ),
      title: Text(
        "Second Screen",
        style: semiBold.copyWith(fontSize: 18, color: Colors.black),
      ),
      centerTitle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final SecondScreenController secondScreenController =
        Get.find<SecondScreenController>();
    final GlobalController globalController = Get.find<GlobalController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(globalController),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 13,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Welcome",
                    style: regular.copyWith(fontSize: 12),
                  ),
                  Text(
                    userName,
                    style: semiBold.copyWith(fontSize: 18),
                  )
                ],
              ),
            ),
            const Spacer(),
            Obx(() {
              return Text(
                globalController.selectedUser.value == null
                    ? "Selected User Name"
                    : '${globalController.selectedUser.value!.firstName} ${globalController.selectedUser.value!.lastName}',
                style: semiBold.copyWith(fontSize: 24, color: Colors.black),
              );
            }),
            const Spacer(),
            CustomButton(
              text: "Choose a User",
              onTap: () {
                Get.toNamed(Routes.THIRD_SCREEN);
              },
              margin: const EdgeInsets.symmetric(horizontal: 33),
            ),
            const SizedBox(
              height: 32,
            )
          ],
        ),
      ),
    );
  }
}
