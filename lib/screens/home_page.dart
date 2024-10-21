// import 'package:flutter/material.dart';
// import 'package:trade_simulator/utils/navigation_menu.dart';
// import 'package:trade_simulator/widgets/appbar/appbar.dart';
// import 'package:trade_simulator/widgets/drawer/drawer.dart'; // Import CustomDrawer

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: TAppBar(
//         leadingIcon: Icons.menu,
//         leadingOnPressed: () {
//           Scaffold.of(context).openDrawer();
//         },
//         title: const Text('Home Page'), // Set the title of the AppBar
//       ),
//             drawer: const CustomDrawer(), // Use your custom drawer

//       body: SingleChildScrollView(
//         // Use SingleChildScrollView for scrollable content
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 'Welcome to the Home Page!',
//                 style: TextStyle(fontSize: 24),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // Add navigation or action here
//                 },
//                 child: const Text('Go to Another Page'),
//               ),
//               // Additional widgets can go here
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: const NavigationMenu(), // Your bottom navigation
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:trade_simulator/device/device_utility.dart';
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
    Center(child: Text('Home Page')),
    Center(child: Text('Search Page')),
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
