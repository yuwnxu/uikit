import 'package:flutter/material.dart';
import 'package:uikit/colors.dart';
import 'package:vize/vize.dart';
import '../logg.dart';
import '../typography.dart';

// Универсальная нижняя панель
// Автор создания: 1
// Дата создания: 15.10.2026

class CustomNavbar extends StatefulWidget {
  final VoidCallback? onTap1; // Нажатие на кнопку 1
  final VoidCallback? onTap2; // Нажатие на кнопку 2

  const CustomNavbar({super.key, this.onTap1, this.onTap2});

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  @override
  void initState() {
    super.initState();
    Logging().info('CustomNavbar', 'Создание', 'Навбар создан');
  }

  @override
  void dispose() {
    Logging().info('CustomNavbar', 'Уничтожение', 'Навбар уничтожен');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.fw,
      padding: ps(v: 15, h: 45),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(12.r), topLeft: Radius.circular(12.r)),
        border: Border.all(color: darkenWhite, width: 1),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12, spreadRadius: 0, offset: Offset(0, -4))],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Logging().info('CustomNavbar', 'Нажатие', 'Произошло нажатие на кнопку');
              widget.onTap2?.call();
            },
            child: Container(
              width: 125.fw,
              padding: ps(v: 4, h: 24),
              decoration: BoxDecoration(color: white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/scan.png', width: 18.fw, height: 18.fh),
                  Text('Сохранить', style: bodySmall.copyWith(color: secondary)),
                ],
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Logging().info('CustomNavbar', 'Нажатие', 'Произошло нажатие на кнопку');
              widget.onTap1?.call();
            },
            child: Container(
              padding: ps(v: 8, h: 40),
              width: 165.fw,
              decoration: BoxDecoration(color: primary, borderRadius: BorderRadius.circular(12.r)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/bigRight.png', width: 16.fw, height: 16.fh),
                  Text('Продолжить', style: bodySmall.copyWith(color: white)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
