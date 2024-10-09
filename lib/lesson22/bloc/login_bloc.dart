// blocs/login_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    // Xử lý sự kiện khi nút đăng nhập được nhấn
    on<LoginButtonPressed>((event, emit) async {
      emit(LoadingState());

      // Thực hiện đăng nhập với email và password
      final isSuccess =
          await signInWithEmailAndPassword(event.email, event.password);
      if (isSuccess) {
        emit(SuccessfullyLoginState(
          successfulMsg: "Chúc mừng email: ${event.email} đã login thành công",
        ));
      } else {
        emit(const FailedLoginState(
          errorMessage: "Đăng nhập thất bại. Hãy thử lại sau!!!",
        ));
      }
    });
  }

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('User signed in: ${credential.user}');
      return true;
    } on FirebaseAuthException catch (e) {
      print('Error: ${e.code}');
      return false;
    }
  }
}


