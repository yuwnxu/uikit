import 'package:flutter/material.dart';
import 'package:vize/vize.dart';
import '../logg.dart';
import '../typography.dart';

// Универсальная аватарка проекта
// Автор создания: 1
// Дата создания: 15.10.2026

class CustomAvatar extends StatefulWidget {
  final String? photo; // Путь к фото
  final String? label; // Текст под фото
  final String? initials; // Инициалы
  final TextStyle? initialsStyle; // Стиль инициалов
  final Color borderColor; // Цвет бордера
  final Color fillColor; // Цвет заливки
  final double size; // Размер аватарки

  const CustomAvatar({super.key, this.photo, this.label, this.initials, this.initialsStyle, required this.borderColor, required this.fillColor, required this.size});

  @override
  State<CustomAvatar> createState() => _CustomAvatarState();
}

class _CustomAvatarState extends State<CustomAvatar> {
  @override
  void initState() {
    super.initState();
    Logging().info('CustomAvatar', 'Создание', 'Аватарка создана');
  }

  @override
  void dispose() {
    Logging().info('CustomAvatar', 'Уничтожение', 'Аватарка уничтожена');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: widget.size.fw,
          height: widget.size.fh,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: widget.borderColor, width: 2),
          ),
          child: CircleAvatar(
            backgroundColor: widget.fillColor,
            radius: widget.size / 2,
            backgroundImage: widget.photo != null ? AssetImage(widget.photo!) : null,
            child: widget.initials != null ? Text(widget.initials!, style: widget.initialsStyle) : null,
          ),
        ),
        SizedBox(height: 8.fh),
        ?widget.label != null ? Text(widget.label!, style: secondLabel) : null,
      ],
    );
  }
}
