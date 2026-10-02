import 'package:flutter/material.dart';
import 'package:uikit/logg.dart';
import 'package:vize/vize.dart';
import 'package:uikit/color.dart';
import 'package:uikit/typography.dart';

// Главная верхняя панель
// Автор создания: #
// Дата создания: ##.##.####

class CustomHeader extends StatelessWidget {
  final String? icon; // Путь к иконке слева
  final String label; // Заголовок
  final Widget? avatar; // Аватарка справа
  final VoidCallback? onIconTap; // Нажатие на иконку
  final double width; // Ширина иконки
  final double height; // Длина иконки

  const CustomHeader({super.key, this.icon, required this.label, this.avatar, this.onIconTap, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: ps(h: 20.fw, v: 12.fh),
      decoration: BoxDecoration(
        color: white,
        border: Border(bottom: BorderSide(color: darkenWhite, width: 1)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12, offset: Offset(0, 4), spreadRadius: 0)],
      ),
      child: Row(
        children: [
          if (icon != null)
            GestureDetector(
              onTap: () {
                Logging().info('CustomHeader', 'Нажатие', 'Произошло нажатие на иконку');
                onIconTap?.call();
              },
              child: Image.asset(icon!, width: width.fw, height: height.fh),
            ),
          SizedBox(width: 12.fw),
          Expanded(
            child: Text(label, style: subHeader.copyWith(fontSize: 18, fontWeight: .w700)),
          ),
          if (avatar != null) ...[SizedBox(width: 12.fw), avatar!],
        ],
      ),
    );
  }
}
