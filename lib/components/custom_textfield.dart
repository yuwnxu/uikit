import 'package:flutter/material.dart';
import 'package:uikit/colors.dart';
import 'package:uikit/typography.dart';
import 'package:vize/vize.dart';
import '../logg.dart';

// Основные текстовые поля проекта
// Автор создания: 1
// Дата создания: 15.10.2026

// Состояния поля
enum TextFieldState { disabled, error, focused, normal }

// Тип поля
enum TextFieldType { password, search, normal }

class CustomTextField extends StatefulWidget {
  final String label; // Заголовок поля
  final String hint; // Текст-подсказка
  final TextFieldState state; // Состояние поля
  final TextFieldType type; // Типо поля
  final String? errorText; // Текст ошибки
  final TextEditingController? controller; // Контролер

  const CustomTextField({super.key, required this.label, required this.hint, required this.state, required this.type, this.errorText, required this.controller});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obsecureText = true;

  @override
  void initState() {
    super.initState();
    Logging().info('CustomTextField', 'Создание', 'Поле создано');
  }

  @override
  void dispose() {
    Logging().info('CustomTextField', 'Уничтожение', 'Поле уничтожено');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor = grey;
    Color labelColor = secondary;

    if (widget.state == TextFieldState.focused) {
      borderColor = primary;
      labelColor = primary;
    } else if (widget.state == TextFieldState.error) {
      borderColor = error;
      labelColor = error;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: subheader.copyWith(color: labelColor, fontSize: 14, letterSpacing: 0, height: 20 / 14),
        ),
        SizedBox(height: 4.5.fh),
        SizedBox(
          width: 350.fw,
          child: TextField(
            obscureText: widget.type == TextFieldType.password ? obsecureText : false,
            controller: widget.controller,
            onTap: () {
              widget.state == TextFieldState.disabled ? null : Logging().info('CustomTextField', 'Нажатие', 'Произошло нажатие на поле');
            },
            style: bodySmall.copyWith(fontSize: 16),
            decoration: InputDecoration(
              filled: true,
              fillColor: darkenWhite,
              contentPadding: ps(v: 12, h: 16),
              hintText: widget.hint,
              hintStyle: bodySmall.copyWith(fontSize: 16, color: secondary),
              suffixIcon: widget.type == TextFieldType.password
                  ? Padding(
                      padding: po(r: 18),
                      child: GestureDetector(
                        onTap: () {
                          Logging().info('CustomTextField', 'Нажатие', 'Произошло нажатие на иконку');
                          setState(() {
                            obsecureText = !obsecureText;
                          });
                        },
                        child: Image.asset('assets/eye.png', width: 24.fw, height: 15.fh),
                      ),
                    )
                  : null,
              suffixIconConstraints: BoxConstraints(minHeight: 0, minWidth: 0),
              prefixIcon: widget.type == TextFieldType.search
                  ? Padding(
                      padding: po(l: 17, r: 2),
                      child: Image.asset('assets/search.png', width: 18.fw, height: 18.fh),
                    )
                  : null,
              prefixIconConstraints: BoxConstraints(minHeight: 0, minWidth: 0),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: 1),
                borderRadius: BorderRadius.circular(8.r),
              ),

              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: 1),
                borderRadius: BorderRadius.circular(8.r),
              ),

              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: 1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: 1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: 1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              errorText: widget.errorText,
              errorStyle: fieldLabel.copyWith(color: error),
            ),
            enabled: widget.state == TextFieldState.disabled ? false : true,
          ),
        ),
      ],
    );
  }
}
