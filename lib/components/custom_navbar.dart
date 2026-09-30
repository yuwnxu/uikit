import 'package:flutter/material.dart';
import 'package:vize/vize.dart';
import 'package:uikit/color.dart';
import 'package:uikit/typography.dart';

// Универсальное поле навигации 1
// Автор создания: #
// Дата создания: ##.##.####

class CustomNavbar extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final int currentPage; // Текущая страница
  final ValueChanged<int> onTap; // Действие при нажатии на кнопку

  const CustomNavbar({super.key, required this.text1, required this.text2, required this.text3, required this.currentPage, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: ps(v: 21.5, h: 48),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12, offset: Offset(0, -4))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildItem(icon: 'assets/bag.png', label: text1, isActive: currentPage == 0, onTap: () => onTap(0)),
          _buildItem(icon: 'assets/candidate.png', label: text2, isActive: currentPage == 1, onTap: () => onTap(1)),
          _buildItem(icon: 'assets/settings.png', label: text3, isActive: currentPage == 2, onTap: () => onTap(2)),
        ],
      ),
    );
  }

  Widget _buildItem({required String icon, required String label, required bool isActive, required VoidCallback onTap}) {
    final Color color = isActive ? primary : secondary;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          Image.asset(icon, width: 20.fw, height: 20.fh, color: color),
          Text(label, style: fieldLabel.copyWith(color: color)),
        ],
      ),
    );
  }
}
