import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_msib_2024/modules/first_screen/controllers/first_screen_controller.dart';
import 'package:suitmedia_msib_2024/configs/routes/app_routes.dart';
import 'package:suitmedia_msib_2024/configs/styles/text_styles.dart';
import 'package:suitmedia_msib_2024/widgets/custom_button.dart';

class FirstScreenView extends GetView<FirstScreenController> {
  const FirstScreenView({super.key});

  // Widget _inputField(
  //     String hintText, TextEditingController? controller, String? errorText) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(12),
  //       color: Colors.white,
  //     ),
  //     padding: const EdgeInsets.symmetric(
  //       vertical: 8,
  //       horizontal: 20,
  //     ),
  //     child: TextField(
  //       controller: controller,
  //       style: medium.copyWith(
  //         fontSize: 16,
  //       ),
  //       decoration: InputDecoration(
  //         isDense: true,
  //         errorText: errorText,
  //         border: InputBorder.none,
  //         hintText: hintText,
  //         hintStyle: const TextStyle(
  //           fontSize: 16,
  //           color: Color.fromRGBO(104, 103, 119, 0.36),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _inputField(
    String hintText,
    TextEditingController controller,
    FocusNode focusNode,
    String? errorText,
    Function(String value) onChanged,
  ) {
    return AnimatedContainer(
      padding: EdgeInsets.only(
        top: controller.text.isNotEmpty || focusNode.hasFocus ? 12 : 0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      duration: const Duration(milliseconds: 100),
      child: TextField(
        onChanged: onChanged,
        focusNode: focusNode,
        controller: controller,
        style: const TextStyle(
          fontSize: 16,
        ), // Replace with 'medium' if defined elsewhere
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 20,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          errorText: errorText,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          label: Text(
            hintText,
          ),
          labelStyle: const TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(104, 103, 119, 1),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
      ),
    );
  }

  void _palindromeDialog(bool isPalindrome) {
    Get.dialog(
      AlertDialog(
        title: Center(
          child: Text(
            isPalindrome ? "isPalindrome" : "not palindrome",
            style: semiBold.copyWith(fontSize: 20, color: Colors.black),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 116,
                  width: 116,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/ic_photo.png'),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                _inputField(
                  "Name",
                  controller.nameController,
                  controller.nameFocusNode,
                  controller.nameErrorText.value,
                  (value) {
                    if (value.isNotEmpty) {
                      controller.nameErrorText.value = null;
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                _inputField(
                  "Palindrome",
                  controller.palindromeController,
                  controller.palindromeFocusNode,
                  controller.palindromeErrorText.value,
                  (value) {
                    if (value.isNotEmpty) {
                      controller.palindromeErrorText.value = null;
                    }
                  },
                ),
                const SizedBox(
                  height: 45,
                ),
                CustomButton(
                  text: "CHECK",
                  onTap: () {
                    String controllerText =
                        controller.palindromeController.text;

                    if (controllerText.isEmpty) {
                      controller.palindromeErrorText.value =
                          "Please fill the field";
                      return;
                    }

                    controller.palindromeErrorText.value = null;

                    _palindromeDialog(controller.isPalindrome(controllerText));
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  text: "NEXT",
                  onTap: () {
                    String controllerText = controller.nameController.text;

                    if (controllerText.isEmpty) {
                      controller.nameErrorText.value = "Please Fill The Field";
                      return;
                    }

                    Get.toNamed(
                      Routes.SECOND_SCREEN,
                      arguments: controller.nameController.text,
                    );
                  },
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
