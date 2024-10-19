import 'package:flutter/material.dart';

class RadioGenderItem extends StatelessWidget {
  final String radioValue;
  final String selectedValue;
  final void Function()? onTap;
  const RadioGenderItem({
    super.key,
    required this.radioValue,
    required this.selectedValue,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isItemSelected = radioValue == selectedValue;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border:
              Border.all(color: isItemSelected ? Colors.white : Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio(
                value: radioValue,
                groupValue: selectedValue,
                onChanged: null,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity,
                ),
                fillColor: MaterialStateProperty.all(Colors.white)),
            const SizedBox(
              width: 8,
            ),
            Text(
              radioValue,
              style:
                  TextStyle(color: isItemSelected ? Colors.white : Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
