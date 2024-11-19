import 'package:get/get.dart';
import 'RegisterModel.dart';
import 'ApiService.dart';
import 'package:flutter/material.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;
  var registerList = <RegisterModel>[].obs;

  TextEditingController usernameController = TextEditingController(); // ini fungsinya untuk menangani inputan dari user?
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future<void> registerUser(String username, String password, String fullName, String email) async {
    isLoading.value = true;

    registerList.clear();

    try {
      final response = await ApiService().registerUser(username, password, fullName, email);
      registerList.add(response); 
    } catch (e) { 
      print(e);
    } finally {
      isLoading.value = false; 
    }
  }
}
