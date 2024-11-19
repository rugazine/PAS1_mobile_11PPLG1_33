import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:pas_ruga/controller/bottom_nav_controller.dart';
import 'package:pas_ruga/pages/favorite.dart';
import 'package:pas_ruga/pages/epl/home.dart';
import 'package:pas_ruga/pages/profile/profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController bottomNavController =
        Get.put(BottomNavController());

    final List<Widget> menus = [Home(), FavoritePage(), Profile()];

    return Obx(() {
      return Scaffold(
          backgroundColor: Colors.white,
          body: menus[bottomNavController.selectedIndex.value],
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.white,
            color: const Color.fromARGB(255, 0, 0, 0),
            animationDuration: Duration(milliseconds: 300),
            index: bottomNavController.selectedIndex.value,
            onTap: bottomNavController.changeIndexMenu,
            items: [
              Icon(Icons.home_outlined, color: Colors.white),
              Icon(Icons.star_outline, color: Colors.white),
              Icon(Icons.person_2_outlined, color: Colors.white),
            ],
          ));
    });
  }
}
