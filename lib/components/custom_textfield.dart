import 'package:flutter/material.dart';
import 'package:vize/vize.dart';
import 'package:uikit/color.dart';
import 'package:uikit/typography.dart';

// Основные текстовые поля
// Автор создания: #
// Дата создания: ##.##.####

enum TextFieldState { normal, focused, error, disabled }

class CustomTextField extends StatefulWidget {
  final String label;
  final String hint;
  final TextFieldState state;
  final String? errortext;
  final TextEditingController? controller;
  final String? prefixIcon;
  final String? suffixIcon;
  final bool isPassword;

  const CustomTextField({super.key, required this.label, required this.hint, this.state = TextFieldState.normal, this.errortext, this.controller, this.prefixIcon, this.suffixIcon, this.isPassword = false});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

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
        Text(widget.label, style: fieldLabel.copyWith(color: labelColor)),
        SizedBox(height: 4.5.fh),
        SizedBox(
          width: 350.fw,
          child: TextField(
            controller: widget.controller,
            enabled: widget.state != TextFieldState.disabled,
            obscureText: widget.isPassword ? _obscureText : false,
            style: TextStyle(color: black),
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: bodyMedium.copyWith(color: secondary),
              prefixIcon: widget.prefixIcon != null
                  ? Padding(
                      padding: po(l: 17.fw),
                      child: Image.asset(widget.prefixIcon!, width: 18, height: 18),
                    )
                  : null,
              prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
              suffixIcon: widget.suffixIcon != null
                  ? GestureDetector(
                      onTap: widget.isPassword
                          ? () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            }
                          : null,
                      child: Padding(
                        padding: EdgeInsets.only(right: 18.fw),
                        child: Image.asset(widget.suffixIcon!, width: 22, height: 15),
                      ),
                    )
                  : null,
              suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),

              filled: true,
              fillColor: darkenWhite,
              contentPadding: ps(h: 16.fw, v: 12.fh),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: borderColor, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: borderColor, width: 1),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: borderColor, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: borderColor, width: 1),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: borderColor, width: 1),
              ),

              errorText: widget.state == TextFieldState.error ? widget.errortext : null,
              errorStyle: fieldLabel.copyWith(color: error),
            ),
          ),
        ),
      ],
    );
  }
}
