import 'package:flutter/material.dart';
import 'package:trade_simulator/device/device_utility.dart';
import 'package:trade_simulator/widgets/appbar/appbar.dart';
import 'package:trade_simulator/widgets/drawer/drawer.dart';

class Dummy1 extends StatefulWidget {
  const Dummy1({super.key});

  @override
  State<Dummy1> createState() => _Dummy1State();
}

class _Dummy1State extends State<Dummy1> {
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
      body: Center(
        child: Text("Homeeeeeeeee"),
      ),
    );
  }
}

class Dummy2 extends StatefulWidget {
  const Dummy2({super.key});

  @override
  State<Dummy2> createState() => _Dummy2State();
}

class _Dummy2State extends State<Dummy2> {
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
      body: Center(
        child: Text("Settingssssss"),
      ),
    );
  }
}
