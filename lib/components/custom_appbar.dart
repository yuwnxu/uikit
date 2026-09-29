import 'package:flutter/material.dart';
import 'package:vize/vize.dart';
import 'package:uikit/color.dart';
import 'package:uikit/typography.dart';

// Универсальная верхняя панель
// Автор создания: #
// Дата создания: ##.##.####

class CustomAppbar extends StatelessWidget {
  final String? iconleft; // Путь к иконке слева
  final String? iconright; // Путь к иконке справа
  final String label; // Заголовок
  final VoidCallback? tapLeft; // Нажатие на иконку слева
  final VoidCallback? tapRight; // Нажатие на иконку справа
  final BorderRadius? borderRadius; // Радиус скругления

  const CustomAppbar({super.key, this.iconleft, this.iconright, required this.label, this.tapLeft, this.tapRight, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: pa(16),
      decoration: BoxDecoration(
        color: white,
        borderRadius: borderRadius,
        border: Border(bottom: BorderSide(color: darkenWhite, width: 1)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 2, offset: Offset(0, 1), spreadRadius: 0)],
      ),
      child: Row(
        children: [
          if (iconleft != null)
            GestureDetector(
              onTap: tapLeft,
              child: Image.asset(iconleft!, width: 16.fw, height: 16.fh),
            ),
          SizedBox(width: 16.fw),
          Expanded(
            child: Text(label, style: subHeader.copyWith(fontSize: 18, fontWeight: .w600)),
          ),
          if (iconright != null)
            GestureDetector(
              onTap: tapRight,
              child: Image.asset(iconright!, width: 4.fw, height: 16.fh),
            ),
        ],
      ),
    );
  }
}
