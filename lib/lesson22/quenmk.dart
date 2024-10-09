import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/forgot_password_bloc.dart';
import 'bloc/forgot_password_event.dart';
import 'bloc/forgot_password_state.dart';

class ForgotPasswordDialog extends StatefulWidget {
  const ForgotPasswordDialog({super.key});

  @override
  State<ForgotPasswordDialog> createState() => _ForgotPasswordDialogState();
}

class _ForgotPasswordDialogState extends State<ForgotPasswordDialog> {
  final TextEditingController emailTextController = TextEditingController();

  @override
  void dispose() {
    emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Quên mật khẩu'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: emailTextController,
            decoration: const InputDecoration(
              labelText: 'Nhập email của bạn',
            ),
          ),
          const SizedBox(height: 20),
          BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
            listener: (context, state) {
              if (state is ForgotPasswordSuccess) {
                Navigator.of(context).pop();
                // Đóng dialog khi thành công

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.green,
                  ),
                );
                // Điều hướng sang màn hình đặt lại mật khẩu
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ResetPasswordScreen(),
                  ),
                );
              } else if (state is ForgotPasswordFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is ForgotPasswordLoading) {
                return const CircularProgressIndicator(
                  color: Colors.amber,
                );
              }

              return ElevatedButton(
                onPressed: () {
                  BlocProvider.of<ForgotPasswordBloc>(context).add(
                    ForgotPasswordButtonPressed(emailTextController.text),
                  );
                },
                child: const Text('Đặt lại mật khẩu'),
              );
            },
          ),
        ],
      ),
    );
  }
}

// mk moi
class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController userNameTextController =
        TextEditingController();
    final TextEditingController newPasswordTextController =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Đặt lại mật khẩu')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: userNameTextController,
              decoration: const InputDecoration(
                labelText: 'Nhập tên đăng nhập mới',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: newPasswordTextController,
              decoration: const InputDecoration(
                labelText: 'Nhập mật khẩu mới',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Thực hiện logic đặt lại tên đăng nhập và mật khẩu ở đây
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Đã đặt lại mật khẩu thành công'),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.of(context).pop(); // Quay lại sau khi hoàn tất
              },
              child: const Text('Xác nhận'),
            ),
          ],
        ),
      ),
    );
  }
}
