import 'package:flutter/material.dart';
import 'package:uikit/colors.dart';
import 'package:vize/vize.dart';
import '../logg.dart';
import '../typography.dart';

// Универсальное длинное текстовое поле
// Автор создания: 1
// Дата создания: 15.10.2026

class CustomTextArea extends StatefulWidget {
  final String hint; // Текст-подсказка
  final TextEditingController? controller; // Контроллер
  final double height; // Высота поля
  final double width; // Ширина поля

  const CustomTextArea({super.key, required this.hint, this.controller, required this.height, required this.width});

  @override
  State<CustomTextArea> createState() => _CustomTextAreaState();
}

class _CustomTextAreaState extends State<CustomTextArea> {
  @override
  void initState() {
    super.initState();
    Logging().info('CustomTextArea', 'Создание', 'Поле создано');
  }

  @override
  void dispose() {
    Logging().info('CustomTextArea', 'Уничтожение', 'Поле уничтожено');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height.fh,
      width: widget.width.fw,
      padding: pa(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: grey, width: 1),
      ),
      child: TextField(
        controller: widget.controller,
        style: bodySmall,
        maxLines: null,
        onTap: () {
          Logging().info('CustomTextArea', 'Нажатие', 'Произошло нажатие на поле');
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          filled: true,
          fillColor: white,
          hintText: widget.hint,
          hintStyle: bodyMedium.copyWith(color: secondary),
          border: InputBorder.none,
          isDense: false,
        ),
      ),
    );
  }
}
