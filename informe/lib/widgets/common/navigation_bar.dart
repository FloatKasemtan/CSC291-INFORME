import 'package:flutter/material.dart';
import 'package:informe/widgets/common/gradient_icon.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar(
      {Key? key, required this.selectedIndex, required this.onItemTapped})
      : super(key: key);
  final int selectedIndex;
  final void Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      items: <BottomNavigationBarItem>[
        _buildCustomNavigationBarItem(
          0,
          Icons.home,
          const LinearGradient(
            colors: <Color>[Color(0xffFF3D67), Color(0xFF8409FF)],
            begin: Alignment.center,
            end: Alignment.bottomRight,
          ),
        ),
        _buildCustomNavigationBarItem(
          1,
          Icons.view_comfy,
          const LinearGradient(
            colors: <Color>[
              Color(0xFF61D1F4),
              Color(0xFF3D9FD6),
              Color(0xFF1C64CF),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        _buildCustomNavigationBarItem(
          2,
          Icons.calendar_month,
          const LinearGradient(
            colors: <Color>[
              Color(0xFFB3FF00),
              Color(0xFF00FF4B),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        _buildCustomNavigationBarItem(
          3,
          Icons.assistant_photo,
          const LinearGradient(
            colors: <Color>[
              Color(0xFFFF6900),
              Color(0xFFFF003B),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
      ],
      currentIndex: selectedIndex,
      onTap: onItemTapped,
    );
  }

  BottomNavigationBarItem _buildCustomNavigationBarItem(
      index, IconData icon, LinearGradient gradient) {
    return BottomNavigationBarItem(
      icon: selectedIndex == index
          ? GradientIcon(icon, 35, gradient)
          : Icon(
              icon,
              size: 25,
              color: const Color(0xFFA3A3B0),
            ),
      label: '',
      backgroundColor: const Color(0xFF373853),
    );
  }
}
