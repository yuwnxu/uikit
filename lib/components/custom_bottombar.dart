import 'package:flutter/material.dart';
import 'package:uikit/logg.dart';
import 'package:vize/vize.dart';
import 'package:uikit/color.dart';
import 'package:uikit/typography.dart';

// Универсальная нижняя панель с 2 кнопками
// Автор создания: #
// Дата создания: ##.##.####

class CustomBottombar extends StatelessWidget {
  final VoidCallback onTap1; // Действие при нажатии на кнопку слева
  final VoidCallback onTap2; // Действие при нажатии на кнопку справа

  const CustomBottombar({super.key, required this.onTap1, required this.onTap2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: po(b: 15.5, t: 15.5, l: 72.11, r: 43.89),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12, offset: Offset(0, -4))],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Logging().info('CustomBottombar', 'Нажатие', 'Произошло нажатие на кнопку');
              onTap1.call;
            },
            behavior: HitTestBehavior.opaque,
            child: Column(
              children: [
                Image.asset('assets/scan.png', width: 18.fw, height: 18.fh),
                Text('Сохранить', style: bodySmall.copyWith(color: secondary)),
              ],
            ),
          ),
          SizedBox(width: 32.fh),
          GestureDetector(
            onTap: () {
              Logging().info('CustomBottombar', 'Нажатие', 'Произошло нажатие на кнопку');
              onTap2.call;
            },
            child: Container(
              padding: ps(h: 40.fw, v: 8.fh),
              decoration: BoxDecoration(color: primary, borderRadius: BorderRadius.circular(12.r)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/bigRight.png', width: 16.fw, height: 16.fh, color: white),
                  Text('Продолжить', style: bodySmall.copyWith(color: white)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
