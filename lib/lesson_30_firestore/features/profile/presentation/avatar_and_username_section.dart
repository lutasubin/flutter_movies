import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/lesson_30_firestore/features/profile/presentation/logic_hoders/bloc/account_info_bloc.dart';

class AvatarAndUsernameSection extends StatelessWidget {
  const AvatarAndUsernameSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.person,
          size: 100,
          color: Colors.white,
        ),
        const SizedBox(
          height: 8,
        ),
        BlocSelector<AccountInfoBloc, AccountInfoState, String?>(
          selector: (state) {
            final fullnameFromFirestore =
                state.accountDataFromFirestore?.fullName;
            return fullnameFromFirestore;
          },
          builder: (context, value) {
            return Text(
              value ?? "Người dùng mới",
              style: const TextStyle(color: Colors.white, fontSize: 26),
            );
          },
        )
      ],
    );
  }
}