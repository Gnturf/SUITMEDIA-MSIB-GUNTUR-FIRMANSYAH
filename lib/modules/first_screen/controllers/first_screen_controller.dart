import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstScreenController extends GetxController {
  TextEditingController nameController = TextEditingController();
  FocusNode nameFocusNode = FocusNode();
  Rx<String?> nameErrorText = Rx<String?>(null);

  TextEditingController palindromeController = TextEditingController();
  FocusNode palindromeFocusNode = FocusNode();
  Rx<String?> palindromeErrorText = Rx<String?>(null);

  bool isPalindrome(String text) {
    // Normalize the text: Remove spaces and convert to lowercase
    String normalizedText = text
        .replaceAll(RegExp(r'\s+'), '') // Remove all whitespace
        .toLowerCase(); // Convert to lowercase

    // Check if the normalized text reads the same backwards
    String reversedText = normalizedText.split('').reversed.join('');

    return normalizedText == reversedText;
  }
}
