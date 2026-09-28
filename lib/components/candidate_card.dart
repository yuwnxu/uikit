import 'package:flutter/material.dart';
import 'package:vize/vize.dart';
import 'package:uikit/color.dart';
import 'package:uikit/typography.dart';

// Карточка кандидата
// Автор создания: #
// Дата создания: ##.##.####

class CandidateCard extends StatelessWidget {
  final String name; // Имя
  final String identity; // Профессия
  final String status; // Статус
  final String city; // Город
  final String experience; // Опыт
  final String period; // Период

  const CandidateCard({super.key, required this.name, required this.identity, required this.status, required this.city, required this.experience, required this.period});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.fw,
      padding: pa(24),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12, offset: Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: screenHeader),
          SizedBox(height: 4.fh),
          Text(identity, style: bodyMedium.copyWith(color: secondary)),
          SizedBox(height: 16.fh),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.fw, vertical: 6.fh),
                decoration: BoxDecoration(color: darkenWhite, borderRadius: BorderRadius.circular(9999.r)),
                child: Text(status, style: bodySmall.copyWith(color: secondary)),
              ),
              SizedBox(width: 4.fw),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.fw, vertical: 6.fh),
                decoration: BoxDecoration(color: darkenWhite, borderRadius: BorderRadius.circular(9999.r)),
                child: Text(city, style: bodySmall.copyWith(color: secondary)),
              ),
            ],
          ),
          SizedBox(height: 24.fh),
          Divider(color: darkenWhite),
          SizedBox(height: 16.fh),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Experience', style: fieldLabel.copyWith(color: secondary)),
                    Text(experience, style: fieldLabel.copyWith(fontSize: 16)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Notice Period', style: fieldLabel.copyWith(color: secondary)),
                    Text(period, style: fieldLabel.copyWith(fontSize: 16)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
