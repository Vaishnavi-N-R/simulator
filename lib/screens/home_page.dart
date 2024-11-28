import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:trade_simulator/controllers/user_controller.dart';
import 'package:trade_simulator/device/device_utility.dart';
import 'package:trade_simulator/screens/learn.dart';
import 'package:trade_simulator/utils/navigation_menu.dart';
import 'package:trade_simulator/widgets/appbar/appbar.dart';
import 'package:trade_simulator/widgets/drawer/drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // List of widgets for each page
  final List<Widget> _pages = [
    Center(
      child: Obx(() {
        // Get instance of UserController
        final UserController userController = Get.find<UserController>();

        // Check if user data is available
        if (userController.user.value == null) {
          return Text(
              'Loading...'); // Placeholder if user data isn't loaded yet
        }

        // Display user's role
        return Text('Role: ${userController.user.value!.role}');
      }),
    ),
    LearnView(),
    Center(child: Text('Profile Page')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(TDeviceUtils.getAppBarHeight()),
        child: Builder(
          builder: (context) => TAppBar(
            leadingIcon: Icons.menu, // Pass the leading icon
            leadingOnPressed: () {
              // Open the drawer when the leading icon is pressed
              Scaffold.of(context).openDrawer();
            },
            title: const Text('Home Page'), // Set the title of the AppBar
          ),
        ),
      ),
      drawer: const CustomDrawer(), // Use your custom drawer
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationMenu(
        // Pass the selected index and onTap callback to the NavigationMenu
        onItemTapped: _onItemTapped, selectedIndex: _selectedIndex,
      ),
    ); // Your bottom navigation    );
  }
}
