import 'package:flutter/material.dart';
import 'package:vize/vize.dart';
import 'package:uikit/color.dart';
import 'package:uikit/typography.dart';

// Универсально поле ввода текста
// Автор создания: #
// Дата создания: ##.##.####

class CustomTextarea extends StatelessWidget {
  final String hint; // Текст подсказка
  final double? height; // Высота
  final TextEditingController? controller; // Контроллер

  const CustomTextarea({super.key, required this.hint, this.height, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.fw,
      height: height?.fh,
      padding: pa(16),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: grey, width: 1),
      ),
      child: TextField(
        controller: controller,
        maxLines: null,
        style: bodyMedium.copyWith(color: black),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: bodyMedium.copyWith(color: secondary),
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          isDense: true,
        ),
      ),
    );
  }
}
