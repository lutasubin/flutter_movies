import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'forgot_password_event.dart';
import 'forgot_password_state.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitial()) {
    on<ForgotPasswordButtonPressed>(_onForgotPasswordButtonPressed);
  }

  Future<void> _onForgotPasswordButtonPressed(
      ForgotPasswordButtonPressed event, Emitter<ForgotPasswordState> emit) async {
    emit(ForgotPasswordLoading());

    try {
      // Giả lập độ trễ 2 giây trước khi gửi yêu cầu
      await Future.delayed(const Duration(seconds: 2));

      // Sử dụng Random để giả lập thành công hoặc thất bại ngẫu nhiên
      final random = Random();
      bool isSuccess = random.nextBool(); // Trả về true hoặc false ngẫu nhiên

      if (isSuccess) {
        emit(ForgotPasswordSuccess('Đã gửi yêu cầu đặt lại mật khẩu thành công'));
      } else {
        emit(ForgotPasswordFailure('Gửi yêu cầu thất bại, vui lòng thử lại'));
      }
    } catch (e) {
      emit(ForgotPasswordFailure('Có lỗi xảy ra, vui lòng thử lại sau.'));
    }
  }
}
