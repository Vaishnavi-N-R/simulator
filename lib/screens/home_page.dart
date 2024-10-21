import 'package:flutter/material.dart';
import 'package:trade_simulator/utils/navigation_menu.dart';
import 'package:trade_simulator/widgets/appbar/appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TAppBar(leadingIcon: Icons.menu,actions: [Drawer()],)
          ],
        ),
      ),
    );
  }
}
