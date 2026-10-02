import 'package:flutter/material.dart';
import 'package:vize/vize.dart';
import 'package:uikit/color.dart';
import 'package:uikit/typography.dart';

// Прогресс-бар с шагами
// Автор создания: #
// Дата создания: ##.##.####

class CustomProgressBar extends StatelessWidget {
  final String text; // Текст над полосками
  final int currentStep; // Текущий шаг

  const CustomProgressBar({super.key, required this.currentStep, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$text (Шаг $currentStep из 3)', style: bodySmall.copyWith(color: black)),
        SizedBox(height: 8.fh),
        Row(
          children: [
            for (int i = 1; i <= 3; i++) ...[
              Expanded(
                child: Container(
                  height: 8.fh,
                  decoration: BoxDecoration(
                    color: i < currentStep
                        ? primary
                        : i == currentStep
                        ? secondary
                        : grey,
                    borderRadius: BorderRadius.circular(9999.r),
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
