import 'package:flutter/material.dart';
import 'package:uikit/colors.dart';
import 'package:vize/vize.dart';
import '../logg.dart';
import '../typography.dart';

// Универсальная верхняя панель
// Автор создания: 1
// Дата создания: 15.10.2026

class CustomHeader extends StatefulWidget {
  final String label; // Заголовок
  final VoidCallback? onTap1; // Нажатие на иконку 1
  final VoidCallback? onTap2; // Нажатие на иконку 2

  const CustomHeader({super.key, required this.label, this.onTap1, this.onTap2});

  @override
  State<CustomHeader> createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  @override
  void initState() {
    super.initState();
    Logging().info('CustomHeader', 'Создание', 'Верхняя панель создана');
  }

  @override
  void dispose() {
    Logging().info('CustomHeader', 'Уничтожение', 'Верхняя панель уничтожена');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.fw,
      padding: ps(h: 16, v: 20),
      decoration: BoxDecoration(
        color: white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 2, spreadRadius: 0, offset: Offset(0, 1))],
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: darkenWhite, width: 1),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Logging().info('CustomAppBar', 'Нажатие', 'Произошло нажатие на иконку');
              widget.onTap1?.call();
            },
            child: Image.asset('assets/left.png', width: 16.fw, height: 16.fh),
          ),
          SizedBox(width: 16.fw),
          Text(widget.label, style: subheader),
          Spacer(),
          GestureDetector(
            onTap: () {
              Logging().info('CustomAppBar', 'Нажатие', 'Произошло нажатие на иконку');
              widget.onTap2?.call();
            },
            child: Image.asset('assets/sideIcon.png', width: 4.fw, height: 16.fh),
          ),
        ],
      ),
    );
  }
}
