import 'package:flutter/material.dart';
import 'package:vize/vize.dart';
import 'package:uikit/color.dart';
import 'package:uikit/typography.dart';
import 'custom_avatar.dart';

// Карточка интервью
// Автор создания: #
// Дата создания: ##.##.####

class HrBoardCard extends StatelessWidget {
  final String photo; // Путь к фото профиля
  final String name; // Имя
  final String identity; // Профессия
  final String city; // Город
  final String phone; // Телефон
  final String status; // Статус
  final String geoIcon; // Путь к иконке гео
  final String callIcon; // Путь к иконке звонка
  final String copyIcon; // Путь к иконке копирования

  const HrBoardCard({super.key, required this.photo, required this.name, required this.identity, required this.city, required this.phone, required this.status, required this.geoIcon, required this.callIcon, required this.copyIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.fw,
      padding: pa(16),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: grey, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAvatar(photo: photo, initials: '', size: 48, borderColor: grey, bgColor: white),
              SizedBox(width: 16.fw),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(name, style: fieldLabel),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.fw, vertical: 4.fh),
                          decoration: BoxDecoration(color: grey, borderRadius: BorderRadius.circular(4.r)),
                          child: Text(status, style: fieldLabel.copyWith(color: darkenWhite)),
                        ),
                      ],
                    ),
                    Text(identity, style: bodySmall.copyWith(color: secondary)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.fh),
          Row(
            children: [
              Image.asset(geoIcon, width: 12.fw, height: 15.fh),
              SizedBox(width: 2.5.fw),
              Text(city, style: bodySmall.copyWith(color: secondary)),
            ],
          ),
          SizedBox(height: 32.fh),
          Row(
            children: [
              Image.asset(callIcon, width: 13.5.fw, height: 13.5.fh),
              SizedBox(width: 3.25.fw),
              Text(phone, style: bodySmall.copyWith(color: secondary)),
              SizedBox(width: 4.fw),
              Image.asset(copyIcon, width: 11.333333015441895.fw, height: 13.333333015441895.fh, color: primary),
            ],
          ),
        ],
      ),
    );
  }
}
