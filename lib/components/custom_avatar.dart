import 'package:flutter/material.dart';
import 'package:vize/vize.dart';
import 'package:uikit/color.dart';
import 'package:uikit/typography.dart';

// Универсальная аватарка
// Автор создания: #
// Дата создания: ##.##.####

class CustomAvatar extends StatelessWidget {
  final String? photo; // Путь к фото
  final String initials; // Инициалы
  final double size; // Диаметр аватарки
  final Color borderColor; // Цвет обводки
  final Color bgColor; // Цвет фона
  final Color? initialsColor; // Цвет текста инициалов
  final String? label; // Подпись снизу аватарки

  const CustomAvatar({super.key, this.photo, required this.initials, this.size = 64,required this.borderColor,required this.bgColor, this.initialsColor, this.label});

  @override
  Widget build(BuildContext context) {
    final bool hasPhoto = photo != null;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: borderColor, width: 2),
          ),
          child: CircleAvatar(
            radius: size / 2,
            backgroundColor: bgColor,
            backgroundImage: hasPhoto ? AssetImage(photo!) : null,
            child: hasPhoto ? null : Text(initials, style: subHeader.copyWith(color: initialsColor, fontSize: 20)),
          ),
        ),
        SizedBox(height: 8.fh),
        if (label != null) Text(label!, style: bodyMedium),
      ],
    );
  }
}
