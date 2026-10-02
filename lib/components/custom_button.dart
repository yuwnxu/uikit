import 'package:flutter/material.dart';
import 'package:uikit/typography.dart';
import 'package:vize/vize.dart';
import 'package:uikit/logg.dart';

// Основные кнопки
// Автор создания: #
// Дата создания: ##.##.####
class CustomButton extends StatefulWidget {
  final Color fillcolor; // Цвет фона
  final Color bordercolor; // Цвет границ
  final Color textcolor; // Цвет текста
  final String text; // Текст
  final double width; // Ширина
  final double height; // Высота
  final VoidCallback onTap; // Действие при нажатии на кнопку

  const CustomButton({super.key, required this.fillcolor, required this.bordercolor, required this.textcolor, required this.text, required this.width, required this.height, required this.onTap});

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
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
        onPressed: () {
          Logging().info('CustomButton', 'Нажатие', 'Произошло нажатие на кнопку');
          widget.onTap.call();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.fillcolor,
          elevation: 0,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
            side: BorderSide(color: widget.bordercolor, width: 2),
          ),
        ),
        child: Text(widget.text, style: bodyMedium.copyWith(color: widget.textcolor)),
      ),
    );
  }
}
