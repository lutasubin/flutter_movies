import 'package:flutter/material.dart';

class FullnameInput extends StatelessWidget {
  final TextEditingController fullnameController;

  const FullnameInput({
    super.key,
    required this.fullnameController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
        controller: fullnameController,
        style: const TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        cursorColor: Colors.white,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: const Color(0xff6D9EFF).withOpacity(.1),
                ),
                borderRadius: BorderRadius.circular(12)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xff6D9EFF),
                ),
                borderRadius: BorderRadius.circular(12)),
            hintText: "Nhập họ và tên",
            hintStyle: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
