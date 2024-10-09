import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_firebase/lesson22/bloc/google_event.dart';
import 'package:flutter_firebase/lesson22/bloc/google_state.dart';

class GoogleBloc extends Bloc<GoogleEvent, GoogleState> {
  GoogleBloc() : super(GoogleInitial()) {
    on<GoogleLoginPressed>((event, emit) async {
      emit(GoogleLoading());

      try {
        // Đăng nhập với Google
        final isSuccess = await signInWithGoogle();
        if (isSuccess) {
          emit(GoogleLoginSuccess("Bạn đã đăng nhập bằng Google thành công!"));
        } else {
          emit(GoogleLoginFailure("Đăng nhập bằng Google thất bại. Hãy thử lại sau!"));
        }
      } catch (e) {
        emit(GoogleLoginFailure('Lỗi đăng nhập Google: $e'));
      } finally {
        emit(GoogleInitial()); // Trở về trạng thái ban đầu
      }
    });
  }

  Future<bool> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: [
          'email',
        ],
      ).signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        print('User signed in: ${userCredential.user}');
        return true;
      } else {
        return false; // Nếu không có người dùng nào
      }
    } catch (e) {
      print('Error signing in with Google: $e');
      return false;
    }
  }
}
