import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_msib_2024/data/models/user.dart';
import 'package:http/http.dart' as http;

class ThirdScreenController extends GetxController {
  var userData = <User>[].obs;
  var currPage = 1.obs;
  var isLoading = true.obs;
  var hasData = true.obs;
  var isFailedFetch = false.obs;
  final ScrollController controller = ScrollController();

  @override
  void onInit() {
    super.onInit();
    _loadData();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        _loadData();
      }
    });
  }

  Future<void> _loadData() async {
    final headers = {"User-Agent": "PostmanRuntime/7.36.0"};
    final uri = Uri.https(
      'reqres.in',
      '/api/users',
      {"page": "${currPage.value}", "per_page": "10"},
    );

    try {
      final r = await http.get(uri, headers: headers);
      final Map<String, dynamic> rBody = json.decode(r.body);
      final List<dynamic> users = rBody["data"];

      print("-----$users -----");

      if (users.isEmpty) {
        print("----- Empty -----");
        hasData.value = false;

        print("----- hasData? ${hasData.value} -----");
        return;
      }

      List<User> userList = users
          .map((user) => User(
              id: user["id"],
              email: user["email"],
              firstName: user["first_name"],
              lastName: user["last_name"],
              avatarURL: user["avatar"]))
          .toList();

      isLoading.value = false;
      currPage.value++;
      userData.addAll(userList);
    } catch (e) {
      Future.delayed(
        const Duration(seconds: 5),
      );
      isFailedFetch.value = true;
    }
  }

  Future<void> onRefresh() async {
    currPage.value = 1;
    isLoading.value = true;
    hasData.value = true;
    userData.clear();

    _loadData();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
