import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_msib_2024/configs/styles/text_styles.dart';
import 'package:suitmedia_msib_2024/controllers/global_controller.dart';
import 'package:suitmedia_msib_2024/modules/third_screen/controllers/third_screen_controller.dart';
import 'package:suitmedia_msib_2024/modules/third_screen/views/widgets/user_item.dart';

class ThirdScreenView extends StatelessWidget {
  const ThirdScreenView({super.key});

  AppBar _appBar() {
    return AppBar(
      toolbarHeight: 60,
      elevation: 0.5,
      shadowColor: const Color.fromRGBO(226, 227, 228, 1),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Color.fromRGBO(85, 74, 240, 1),
        ),
      ),
      title: Text(
        "Third Screen",
        style: semiBold.copyWith(fontSize: 18, color: Colors.black),
      ),
      centerTitle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThirdScreenController thirdScreenController =
        Get.find<ThirdScreenController>();
    final GlobalController globalController = Get.find<GlobalController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: Obx(() {
        if (thirdScreenController.isFailedFetch.value) {
          return Center(
            child: Text(
              "Failed To Fetch To The Server :(",
              style: semiBold.copyWith(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          );
        }

        if (thirdScreenController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            await thirdScreenController.onRefresh();
          },
          child: ListView.builder(
            controller: thirdScreenController.controller,
            itemCount: thirdScreenController.userData.length + 1,
            itemBuilder: (ctx, index) {
              if (thirdScreenController.userData.isEmpty) {
                return Center(
                  child: Text(
                    "There is no data",
                    style: semiBold.copyWith(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                );
              }

              if (index < thirdScreenController.userData.length) {
                return UserItem(
                  user: thirdScreenController.userData[index],
                  onSelect: (user) {
                    globalController.setSelectedUser(user);
                    Get.back();
                  },
                );
              } else {
                return Obx(() => thirdScreenController.hasData.value
                    ? const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Container());
              }
            },
          ),
        );
      }),
    );
  }
}
