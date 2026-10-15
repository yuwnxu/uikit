import 'package:flutter/material.dart';
import 'package:uikit/colors.dart';
import 'package:uikit/typography.dart';
import 'package:vize/vize.dart';
import '../logg.dart';

// Универсальный чекбокс
// Автор создания: 1
// Дата создания: 15.10.2026

class CustomCheckbox extends StatefulWidget {
  final String label; // Текст чекбокса
  final bool isTap; // Текущее состояние кнопки
  final ValueChanged<bool> onTap; // Нажатие на чекбокс
  final bool isDisabled; // Проверка на отключение

  const CustomCheckbox({super.key, required this.label, required this.onTap, required this.isTap, required this.isDisabled});

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _isTap = false;

  @override
  void initState() {
    _isTap = widget.isTap;
    super.initState();
    Logging().info('CustomCheckbox', 'Создание', 'Чекбокс создан');
  }

  @override
  void dispose() {
    Logging().info('CustomCheckbox', 'Уничтожение', 'Чекбокс уничтожен');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color fillColor;
    Color borderColor;
    Color labelColor;
    bool showIcon = true;

    if (_isTap == true) {
      fillColor = primary;
      borderColor = primary;
      showIcon = true;
      labelColor = black;
    } else if (widget.isDisabled == true) {
      fillColor = darkenWhite;
      borderColor = grey;
      showIcon = false;
      labelColor = text;
    } else {
      fillColor = darkenWhite;
      borderColor = secondary;
      showIcon = false;
      labelColor = black;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: widget.isDisabled == true
              ? null
              : () {
                  Logging().info('CustomCheckbox', 'Нажатие', 'Произошло нажатие на чекбокс');
                  setState(() {
                    _isTap = !_isTap;
                  });
                  widget.onTap.call(_isTap);
                },
          child: Container(
            width: 24.fw,
            height: 24.fh,
            decoration: BoxDecoration(
              color: fillColor,
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(color: borderColor, width: 2),
            ),
            child: showIcon
                ? Center(
                    child: Image.asset('assets/check.png', width: 9.51.fw, height: 7.fh),
                  )
                : null,
          ),
        ),
        SizedBox(width: 16.fw),
        Text(widget.label, style: bodyMedium.copyWith(color: labelColor)),
      ],
    );
  }
}
