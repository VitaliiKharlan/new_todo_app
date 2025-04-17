import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BottomAppBar(
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildNavItem(Icons.home, "Index", theme, 0),
          _buildNavItem(Icons.calendar_today, "Calendar", theme, 1),
          const SizedBox(width: 48),
          _buildNavItem(Icons.access_time, "Focus", theme, 3),
          _buildNavItem(Icons.person, "Profile", theme, 4),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    ThemeData theme,
    int index,
  ) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, top: 4, right: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color:
                  currentIndex == index ? theme.primaryColor : theme.hintColor,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontFamily: GoogleFonts.roboto().fontFamily,
                color:
                    currentIndex == index
                        ? theme.primaryColor
                        : theme.hintColor,
                fontSize: currentIndex == index ? 15 : 14,
                fontWeight:
                    currentIndex == index ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
