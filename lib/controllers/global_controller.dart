import 'package:get/get.dart';
import 'package:suitmedia_msib_2024/data/models/user.dart';

class GlobalController extends GetxController {
  Rx<User?> selectedUser = Rx<User?>(null);

  void setSelectedUser(User user) {
    selectedUser.value = user;
  }
}
