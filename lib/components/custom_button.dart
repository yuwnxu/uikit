import 'package:uikit/logg.dart';
import 'package:vize/vize.dart';
import 'package:flutter/material.dart';
import 'package:uikit/typography.dart';

// Основные кнопки проекта
// Автор создания: 1
// Дата создания: 15.10.2026

class CustomButton extends StatefulWidget {
  final String text; // Текст кнопки
  final Color fillColor; // Цвет кнопки
  final Color borderColor; // Цвет бордеров кнопки
  final Color textColor; // Цвет текса
  final double width; // Ширина кнопки
  final bool isDisabled; // Флаг для проверки отключения кнопки
  final VoidCallback? onTap; // Действие при нажатии

  const CustomButton({super.key, required this.text, required this.fillColor, required this.borderColor, required this.width, this.isDisabled = false, this.onTap, required this.textColor});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  void initState() {
    super.initState();
    Logging().info('CustomButton', 'Создание', 'Кнопка создана');
  }

  @override
  void dispose() {
    Logging().info('CustomButton', 'Уничтожение', 'Кнопка уничтожена');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isDisabled == true
          ? null
          : () {
              Logging().info('CustomButton', 'Нажатие', 'Произошло нажатие на кнопку');
              widget.onTap?.call();
            },
      child: Container(
        width: widget.width,
        height: 48.fh,
        decoration: BoxDecoration(
          color: widget.fillColor,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: widget.borderColor, width: 2),
        ),
        child: Center(
          child: Text(widget.text, style: bodyMedium.copyWith(color: widget.textColor, fontSize: 16)),
        ),
      ),
    );
  }
}
