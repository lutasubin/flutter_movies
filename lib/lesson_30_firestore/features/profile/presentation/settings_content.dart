// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_firebase/lesson_30_firestore/features/profile/presentation/custom_title_and_content_in_item.dart';
import 'package:flutter_svg/svg.dart';

class FlagOption extends StatelessWidget {
  final String flagValue;
  final String selectedFlag;
  final String svgPicturePath;
  final void Function()? onTap;
  const FlagOption({
    Key? key,
    required this.flagValue,
    required this.selectedFlag,
    required this.svgPicturePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSelected = flagValue == selectedFlag;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? Colors.white : Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        child: SvgPicture.asset(
          svgPicturePath,
          width: 32,
          height: 32,
        ),
      ),
    );
  }
}

class SettingsContent extends StatefulWidget {
  const SettingsContent({
    super.key,
  });

  @override
  State<SettingsContent> createState() => _SettingsContentState();
}

class _SettingsContentState extends State<SettingsContent> {
  String selectedLanguage = "Vietnamese";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTitleAndContentInItem(
            title: "Language",
            content: Row(
              children: [
                FlagOption(
                  flagValue: "Vietnamese",
                  selectedFlag: selectedLanguage,
                  svgPicturePath: "assets/svg/vietnam-flag.svg",
                  onTap: () {
                    setState(() {
                      selectedLanguage = "Vietnamese";
                    });
                  },
                ),
                const SizedBox(
                  width: 8,
                ),
                FlagOption(
                  flagValue: "English",
                  selectedFlag: selectedLanguage,
                  svgPicturePath: "assets/svg/us-flag.svg",
                  onTap: () {
                    setState(() {
                      selectedLanguage = "English";
                    });
                  },
                ),
              ],
            ))
      ],
    );
  }
}
