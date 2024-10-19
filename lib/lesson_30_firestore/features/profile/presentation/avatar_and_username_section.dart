import 'package:flutter/material.dart';

class AvatarAndUsernameSection extends StatelessWidget {
  const AvatarAndUsernameSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Icon(
          Icons.person,
          size: 100,
          color: Colors.white,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "Người dùng mới",
          style: TextStyle(color: Colors.white, fontSize: 26),
        )
      ],
    );
  }
}
