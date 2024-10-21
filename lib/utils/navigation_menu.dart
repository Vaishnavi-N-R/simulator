import 'package:flutter/material.dart';

class NavigationMenu extends StatelessWidget {
  final int selectedIndex; // Store the selected index
  final ValueChanged<int> onItemTapped; // Callback for item tap

  const NavigationMenu({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.auto_graph), label: 'Trade'),
        NavigationDestination(icon: Icon(Icons.person), label: 'Account'),
      ],
      selectedIndex: selectedIndex, // Highlight the selected index
      onDestinationSelected: onItemTapped, // Call the callback when tapped
    );
  }
}
