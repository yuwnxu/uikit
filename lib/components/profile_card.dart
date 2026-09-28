import 'package:flutter/material.dart';
import 'package:vize/vize.dart';
import 'package:uikit/color.dart';
import 'package:uikit/typography.dart';
import 'custom_avatar.dart';

// Карточка профиля
// Автор создания: #
// Дата создания: ##.##.####

class ProfileCard extends StatelessWidget {
  final String photo; // Путь к фото
  final String name; // Имя
  final String identity; // Профессия

  const ProfileCard({super.key, required this.photo, required this.name, required this.identity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.fw,
      height: 206.fh,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: grey, width: 1),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12, offset: Offset(0, 4))],
      ),
      child: Padding(
        padding: pa(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomAvatar(photo: photo, initials: '', size: 96, borderColor: white, bgColor: white),
            SizedBox(height: 16.fh),
            Text(name, style: subHeader),
            SizedBox(height: 4.fh),
            Text(identity, style: bodyMedium.copyWith(color: secondary)),
          ],
        ),
      ),
    );
  }
}
