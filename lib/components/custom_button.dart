import 'package:flutter/material.dart';
import 'package:uikit/typography.dart';
import 'package:vize/vize.dart';

// Основные кнопки
// Автор создания: #
// Дата создания: ##.##.####
class CustomButton extends StatefulWidget {
  final Color fillcolor;
  final Color bordercolor;
  final Color textcolor;
  final String text;
  final double width;
  final double height;

  const CustomButton({super.key, required this.fillcolor, required this.bordercolor, required this.textcolor, required this.text, required this.width, required this.height});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.fillcolor,
          elevation: 0,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
            side: BorderSide(color: widget.bordercolor, width: 2),
          ),
        ),
        child: Text(widget.text, style: bodyMedium.copyWith(color: widget.textcolor)),
      ),
    );
  }
}
