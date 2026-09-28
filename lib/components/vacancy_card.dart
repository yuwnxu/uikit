import 'package:flutter/material.dart';
import 'package:vize/vize.dart';
import 'package:uikit/color.dart';
import 'package:uikit/typography.dart';

// Карточка вакансии
// Автор создания: #
// Дата создания: ##.##.####

class VacancyCard extends StatelessWidget {
  final String title; // Название вакансии
  final String team; // Команда
  final String status; // Статус
  final String money; // ЗП
  final String people; // Кол-во соискателей.
  final String moneyIcon; // Путь к иконке ЗП
  final String peopleIcon; // Путь к иконке людей

  const VacancyCard({super.key, required this.title, required this.team, required this.status, required this.money, required this.people, required this.moneyIcon, required this.peopleIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.fw,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12, offset: Offset(0, 4))],
      ),
      child: Padding(
        padding: pa(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: subHeader),
                      SizedBox(height: 4.fh),
                      Text(team, style: bodySmall.copyWith(color: secondary)),
                    ],
                  ),
                ),
                Container(
                  width: 72.fw,
                  height: 24.fh,
                  decoration: BoxDecoration(color: grey, borderRadius: BorderRadius.circular(9999.r)),
                  child: Center(
                    child: Text(status, style: fieldLabel.copyWith(color: secondary)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.fh),
            Divider(color: darkenWhite),
            SizedBox(height: 16.fh),
            Row(
              children: [
                Image.asset(moneyIcon, width: 16.5.fw, height: 12.fh),
                SizedBox(width: 4.fw),
                Text(money, style: bodySmall),
                SizedBox(width: 24.fw),
                Image.asset(peopleIcon, width: 18.fw, height: 9.fh),
                SizedBox(width: 4.fw),
                Text(people, style: bodySmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
