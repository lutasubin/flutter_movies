import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'facebook_event.dart';
import 'facebook_state.dart';

class FacebookBloc extends Bloc<FacebookEvent, FacebookState> {
  FacebookBloc() : super(FacebookInitial()) {
    on<FacebookLoginPressed>((event, emit) async {
      emit(FacebookLoading());

      try {
        // Thực hiện đăng nhập với Facebook
        final isSuccess = await signInWithFacebook();

        if (isSuccess) {
          emit(FacebookLoginSuccess("Đăng nhập Facebook thành công!"));
        } else {
          emit(FacebookLoginFailure("Đăng nhập Facebook thất bại."));
        }
      } catch (e) {
        emit(FacebookLoginFailure('Lỗi đăng nhập Facebook: $e'));
      }
    });
  }
Future<bool> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken!.token);

      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      return true;
    } on FirebaseAuthException catch (e) {
      print('Error while signing in with Facebook: ${e.code}');
      return false;
    } catch (e) {
      print('Exception: $e');
      return false;
    }
  }
}