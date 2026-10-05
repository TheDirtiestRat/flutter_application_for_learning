// custom_bottom_nav.dart
import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int)
  onTap; // Callback to send the tapped index back to the parent

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Padding makes it float above the bottom of the screen
      padding: const EdgeInsets.all(12),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.blueGrey, // Dark background for the pill
          borderRadius: BorderRadius.circular(16), // Pill shape
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(icon: Icons.home, label: "Home", index: 0),
            _buildNavItem(icon: Icons.list, label: "CRUD", index: 1),
            _buildNavItem(icon: Icons.person, label: "Profile", index: 2),
          ],
        ),
      ),
    );
  }

  // Internal helper to build each clickable icon
  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index), // Triggers the function passed from HomeScreen
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          // Highlight background if selected
          color: isSelected
              ? Colors.black38
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(
          icon,
          semanticLabel: label,
          // White if selected, grey if not
          color: isSelected ? Colors.white : Colors.grey,
          size: 28,
        ),
      ),
    );
  }
}
