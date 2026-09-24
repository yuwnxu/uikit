import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:vize/vize.dart';
import 'package:uikit/color.dart';
import 'package:uikit/typography.dart';

// Селект с модальным окном
// Автор создания: #
// Дата создания: ##.##.####
class CustomSelect extends StatefulWidget {
  final String label;
  final String hint;
  final String suffixIcon;
  final List<String> items;
  final String selectedValue;
  final ValueChanged<String> onChanged;

  const CustomSelect({super.key, required this.label, required this.hint, required this.suffixIcon, required this.items, required this.selectedValue, required this.onChanged});

  @override
  State<CustomSelect> createState() => _CustomSelectState();
}

class _CustomSelectState extends State<CustomSelect> {
  void _openSheet() {
    showMaterialModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => _StatusSheet(
        items: widget.items,
        initialValue: widget.selectedValue,
        onApply: (value) {
          widget.onChanged(value);
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: fieldLabel.copyWith(color: secondary)),
        SizedBox(height: 4.5.fh),
        GestureDetector(
          onTap: _openSheet,
          child: Container(
            width: 350.fw,
            height: 48.fh,
            decoration: BoxDecoration(
              color: darkenWhite,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: grey, width: 1),
            ),
            child: Padding(
              padding: ps(h: 16.fw, v: 11.fh),
              child: Row(
                children: [
                  Text(widget.selectedValue, style: bodyMedium),
                  Spacer(),
                  Image.asset(widget.suffixIcon, width: 12.fw, height: 7.4.fh),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Модальное окно выбора
class _StatusSheet extends StatefulWidget {
  final List<String> items;
  final String initialValue;
  final ValueChanged<String> onApply;

  const _StatusSheet({required this.items, required this.initialValue, required this.onApply});

  @override
  State<_StatusSheet> createState() => _StatusSheetState();
}

class _StatusSheetState extends State<_StatusSheet> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  Widget _buildItem(String item) {
    final isSelected = item == _selectedValue;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedValue = item;
        });
      },
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          Expanded(
            child: Text(item, style: bodyMedium.copyWith(color: isSelected ? primary : secondary)),
          ),
          Container(
            width: 24.fw,
            height: 24.fh,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: isSelected ? primary : secondary, width: 2),
            ),
            child: Center(
              child: isSelected
                  ? Container(
                      width: 12.fw,
                      height: 12.fh,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: primary),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16.fh),
            Container(
              width: 32.fw,
              height: 4.fh,
              decoration: BoxDecoration(color: grey, borderRadius: BorderRadius.circular(9999.r)),
            ),
            SizedBox(height: 16.fh),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.fw),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Select Status', style: subHeader),
              ),
            ),
            SizedBox(height: 16.fh),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.fw),
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.items.length,
                separatorBuilder: (context, index) => SizedBox(height: 40.fh),
                itemBuilder: (context, index) => _buildItem(widget.items[index]),
              ),
            ),
            SizedBox(height: 32.fh),
            Divider(color: grey, thickness: 1, height: 1),
            SizedBox(height: 32.fh),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.fw),
              child: Row(
                children: [
                  SizedBox(
                    width: 155.fw,
                    height: 48.fh,
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: primary,
                        side: BorderSide(color: primary, width: 2),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                      ),
                      child: Text('Отменить', style: bodyMedium.copyWith(color: primary)),
                    ),
                  ),
                  SizedBox(width: 16.fw),
                  SizedBox(
                    width: 155.fw,
                    height: 48.fh,
                    child: ElevatedButton(
                      onPressed: () => widget.onApply(_selectedValue!),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                      ),
                      child: Text('Обновить', style: bodyMedium.copyWith(color: white)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.fh),
          ],
        ),
      ),
    );
  }
}
