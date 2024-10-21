import 'package:flutter/material.dart';
import 'package:trade_simulator/widgets/appbar/appbar.dart';
import 'package:trade_simulator/widgets/drawer/drawer.dart';// Import CustomDrawer

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use the CustomDrawer widget here
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Wrap TAppBar with Builder to provide the correct context
            Builder(
              builder: (BuildContext context) {
                return TAppBar(
                  leadingIcon: Icons.menu,
                  leadingOnPressed: () {
                    Scaffold.of(context).openDrawer(); // Now it will work
                  },
                  title: const Text('Home Page'),
                );
              },
            ),
            // Other content goes here
          ],
        ),
      ),
    );
  }
}
