import 'package:get/get.dart';
import 'logModel.dart';
import 'logService.dart';
import 'package:flutter/material.dart';

class LogController extends GetxController {
  var isLoading = false.obs;
  var postList = <LogModel>[].obs;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final RxString username = ''.obs;

  Future<void> loginUser(String username, String password) async {
    isLoading.value = true;
    postList.clear();

    try {
      final response = await LogService().loginUser(username, password);
      postList.add(response);
      
      if (response.status) {
        Get.snackbar(
          'Success',
          'Login berhasil',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        
        Get.offAllNamed('/anime');
      }
    } catch (e) {
      print(e);
      Get.snackbar(
        'Error',
        'Login gagal',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void logout() {
    username.value = '';
  }

  void login(String user) {
    username.value = user;
  }
}
