import 'package:flutter/material.dart';
import 'package:uikit/colors.dart';
import 'package:vize/vize.dart';
import '../logg.dart';
import '../typography.dart';

// Универсальный прогресс-бар
// Автор создания: 1
// Дата создания: 15.10.2026

class CustomProgressBar extends StatefulWidget {
  final int currentStep; // Текущий шаг
  final String label; // Заголовок

  const CustomProgressBar({super.key, required this.currentStep, required this.label});

  @override
  State<CustomProgressBar> createState() => _CustomProgressBarState();
}

class _CustomProgressBarState extends State<CustomProgressBar> {
  @override
  void initState() {
    super.initState();
    Logging().info('CustomProgressBar', 'Создание', 'Прогресс-бар создан');
  }

  @override
  void dispose() {
    Logging().info('CustomProgressBar', 'Уничтожение', 'Прогресс-бар уничтожен');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: bodySmall),
        SizedBox(height: 8.fh),
        Row(
          children: [
            for (int i = 1; i <= 3; i++) ...[
              Expanded(
                child: Container(
                  width: 114.fw,
                  height: 8.fh,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9999.r),
                    color: i < widget.currentStep
                        ? primary
                        : i == widget.currentStep
                        ? secondary
                        : grey,
                  ),
                ),
              ),
              if (i != 3) SizedBox(width: 4.fw),
            ],
          ],
        ),
      ],
    );
  }
}
