import 'package:flutter/material.dart';
import 'package:vize/vize.dart';
import 'package:uikit/color.dart';
import 'package:uikit/typography.dart';

import 'custom_avatar.dart';

// Карточка соискателя
// Автор создания: #
// Дата создания: ##.##.####

class ApplicantCard extends StatelessWidget {
  final String title; // Название вакансии
  final String team; // Команда и тип занятости
  final String fulltime; // Тип занятости
  final String money; // Зарплата
  final String count; // Кол-во соискателей
  final String moneyIcon; // Путь к иконке зарплаты
  final String arrowIcon; // Путь к иконке стрелки
  final String teamIcon; // Путь к иконке здания
  final String timeIcon; // Путь к иконке часов

  const ApplicantCard({super.key, required this.title, required this.team, required this.money, required this.count, required this.moneyIcon, required this.arrowIcon, required this.fulltime, required this.teamIcon, required this.timeIcon});

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
            children: [
              CustomAvatar(initials: 'PD', size: 48, borderColor: grey, bgColor: grey, initialsStyle: TextStyle(fontSize: 16), initialsColor: primary),
              SizedBox(width: 16.fw),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: bodyMedium),
                  SizedBox(height: 4.fh),
                  Row(
                    children: [
                      Image.asset(teamIcon, width: 13.333333015441895.fw, height: 12.fh),
                      SizedBox(width: 4.fw),
                      Text(team, style: bodySmall.copyWith(color: secondary)),
                      SizedBox(width: 18.fw),
                      Image.asset(timeIcon, width: 13.333333015441895.fw, height: 13.333333015441895.fh),
                      SizedBox(width: 4.fw),
                      Text(fulltime, style: bodySmall.copyWith(color: secondary)),
                    ],
                  ),
                  SizedBox(height: 4.fh),
                  Row(
                    children: [
                      Image.asset(moneyIcon, width: 16.fw, height: 16.fh, color: black),
                      SizedBox(width: 4.fw),
                      Text(money, style: fieldLabel),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.fh),
          Divider(color: grey),
          SizedBox(height: 16.fh),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 62.69.fw),
                      Text(count, style: bodySmall.copyWith(color: primary, fontSize: 14)),
                    ],
                  ),
                  Text('APPLICANTS', style: bodySmall.copyWith(color: secondary)),
                ],
              ),
              Spacer(),
              Image.asset(arrowIcon, width: 7.4.fw, height: 12.fh),
            ],
          ),
        ],
      ),
    );
  }
}
