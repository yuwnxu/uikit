import 'package:flutter/material.dart';
import 'package:uikit/colors.dart';
import 'package:vize/vize.dart';
import '../logg.dart';
import '../typography.dart';

// Универсальная панель навигации
// Автор создания: 1
// Дата создания: 15.10.2026

class CustomBottomBar extends StatefulWidget {
  final String text1; // Текст экрана 1
  final String text2; // Текст экрана 2
  final String text3; // Текст экрана 3
  final int currentPage; // Текущая страница
  final ValueChanged<int> onTap; // Изменение при нажатии

  const CustomBottomBar({super.key, required this.text1, required this.text2, required this.text3, required this.currentPage, required this.onTap});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  void initState() {
    super.initState();
    Logging().info('CustomBottomBar', 'Создание', 'Панель навигации создана');
  }

  @override
  void dispose() {
    Logging().info('CustomBottomBar', 'Уничтожение', 'Панель навигации уничтожена');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ps(h: 48, v: 21.5),
      decoration: BoxDecoration(
        color: white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), spreadRadius: 0, blurRadius: 12, offset: Offset(0, -4))],
        borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
        border: Border.all(color: darkenWhite, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _item(
            icon: 'assets/bag.png',
            label: widget.text1,
            isActive: widget.currentPage == 0,
            onTap: () {
              Logging().info('CustomBottomBar', 'Нажатие', 'Нажатие на иконку навигации');
              widget.onTap(0);
            },
          ),
          _item(
            icon: 'assets/candidate.png',
            label: widget.text2,
            isActive: widget.currentPage == 1,
            onTap: () {
              Logging().info('CustomBottomBar', 'Нажатие', 'Нажатие на иконку навигации');
              widget.onTap(1);
            },
          ),
          _item(
            icon: 'assets/settings.png',
            label: widget.text3,
            isActive: widget.currentPage == 2,
            onTap: () {
              Logging().info('CustomBottomBar', 'Нажатие', 'Нажатие на иконку навигации');
              widget.onTap(2);
            },
          ),
        ],
      ),
    );
  }
}

Widget _item({required String icon, required String label, required VoidCallback onTap, required bool isActive}) {
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
