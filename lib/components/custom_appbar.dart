import 'package:flutter/material.dart';
import 'package:uikit/colors.dart';
import 'package:uikit/components/custom_avatar.dart';
import 'package:vize/vize.dart';
import '../logg.dart';
import '../typography.dart';

// Универсальнаый appbar
// Автор создания: 1
// Дата создания: 15.10.2026

class CustomAppBar extends StatefulWidget {
  final String label; // Заголовок
  final VoidCallback? onTap; // Нажатие на иконку

  const CustomAppBar({super.key, required this.label, this.onTap});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  void initState() {
    super.initState();
    Logging().info('CustomAppBar', 'Создание', 'AppBar создан');
  }

  @override
  void dispose() {
    Logging().info('CustomAppBar', 'Уничтожение', 'AppBar уничтожен');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 64.fh,
      decoration: BoxDecoration(
        color: white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12, spreadRadius: 0, offset: Offset(0, 4))],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 20.fw),
          GestureDetector(
            onTap: () {
              Logging().info('CustomAppBar', 'Нажатие', 'Произошло нажатие на иконку');
              widget.onTap?.call();
            },
            child: Image.asset('assets/bar.png', width: 18.fw, height: 12.fh),
          ),
          SizedBox(width: 12.fw),
          Text(
            widget.label,
            style: subheader.copyWith(fontWeight: .w700, letterSpacing: -0.45, height: 28 / 18),
          ),
          Spacer(),
          Column(
            children: [
              SizedBox(height: 12.fh),
              CustomAvatar(borderColor: primary, fillColor: grey, size: 40, photo: 'assets/HR Manager Profile.png'),
            ],
          ),
          SizedBox(width: 20.fw),
        ],
      ),
    );
  }
}
