import 'package:flutter/material.dart';
import 'package:uikit/colors.dart';
import 'package:vize/vize.dart';
import '../logg.dart';
import '../typography.dart';

// Универсальное выпадающее окно
// Автор создания: 1
// Дата создания: 15.10.2026

SnackBar customSnackbar() {
  Logging().info('customSnackbar', 'Создание', 'Снэкбар создан');

  return SnackBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    margin: EdgeInsets.zero,
    duration: Duration(seconds: 3),
    padding: EdgeInsets.zero,
    behavior: SnackBarBehavior.floating,
    content: Container(
      width: 350.fw,
      height: 72.fh,
      padding: po(l: 16, t: 16, b: 16, r: 24),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), color: black),
      child: Row(
        children: [
          Image.asset('assets/checkCircle.png', width: 20.fw, height: 20.fh),
          SizedBox(width: 8.fw),
          Expanded(
            child: Text('Candidate card successfully\nremoved from the board', style: bodySmall.copyWith(color: white)),
          ),
          SizedBox(width: 40.fw),
          Text('UNDO', style: fieldLabel.copyWith(color: grey)),
        ],
      ),
    ),
  );
}
