import 'package:flutter/material.dart';
import 'package:vize/vize.dart';
import 'package:uikit/color.dart';
import 'package:uikit/typography.dart';

// Универсальный чекбокс
// Автор создания: #
// Дата создания: ##.##.####

// Состояние чекбокса
enum CheckboxState { checked, unchecked, disabled }

class CustomCheckbox extends StatefulWidget {
  final String label; // заголовок
  final bool value; // текущее состояние
  final String icon; // путь к иконке
  final ValueChanged<bool>? onChanged; // колбэк при изменении
  final bool isDisabled;

  const CustomCheckbox({super.key, required this.label, required this.value, this.onChanged, this.isDisabled = false, required this.icon});

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _isTap = false;

  @override
  void initState() {
    super.initState();
    if (widget.value == true) {
      _isTap = true;
    } else {
      _isTap = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color fillcolor;
    final Color bordercolor;
    final Color labelcolor;
    final bool showicon;

    if (widget.isDisabled) {
      fillcolor = darkenWhite;
      bordercolor = grey;
      labelcolor = Color(0xff8C8D91);
      showicon = false;
    } else if (_isTap) {
      fillcolor = primary;
      bordercolor = primary;
      labelcolor = black;
      showicon = true;
    } else {
      fillcolor = white;
      bordercolor = secondary;
      labelcolor = black;
      showicon = false;
    }
    return GestureDetector(
      onTap: () {
        if (widget.isDisabled == false) {
          setState(() {
            _isTap = !_isTap;
          });
          widget.onChanged?.call(_isTap);
        }
      },
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          Container(
            width: 24.fw,
            height: 24.fh,
            decoration: BoxDecoration(
              color: fillcolor,
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(color: bordercolor, width: 2),
            ),
            child: showicon
                ? Center(
              child: Image.asset(widget.icon, width: 9.51.fw, height: 7.01.fh),
            )
                : null,
          ),
          SizedBox(width: 16.fw),
          Text(widget.label, style: bodyMedium.copyWith(color: labelcolor)),
        ],
      ),
    );
  }
}
