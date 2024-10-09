import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/firebase_options.dart';
import 'package:flutter_firebase/lesson22/bloc/facebook_bloc.dart';
import 'package:flutter_firebase/lesson22/bloc/facebook_event.dart';
import 'package:flutter_firebase/lesson22/bloc/facebook_state.dart';
import 'package:flutter_firebase/lesson22/bloc/forgot_password_bloc.dart';
import 'package:flutter_firebase/lesson22/bloc/google_bloc.dart';
import 'package:flutter_firebase/lesson22/bloc/google_event.dart';
import 'package:flutter_firebase/lesson22/bloc/google_state.dart';
import 'package:flutter_firebase/lesson22/bloc/login_bloc.dart';
import 'package:flutter_firebase/lesson22/bloc/login_event.dart';
import 'package:flutter_firebase/lesson22/bloc/login_state.dart';
import 'package:flutter_firebase/lesson22/root_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'quenmk.dart';

//! khoi tao ung dung va Firebase:
void main(List<String> args) async {
  WidgetsFlutterBinding
      .ensureInitialized(); //?dam bao rang flutter duoc khoi tao truoc khi cahy vat ki doan code nao
  //?khoi tao Firebase voi cac thong tin cau hinh
  //?tu firebase_option.dieu nay can thiet cho chuc nang login google ,facebook
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

//! cau truc ung dung MyApp:
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      //?:cho phep su dung nhieu Bloc
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => FacebookBloc()),
        BlocProvider(create: (context) => ForgotPasswordBloc()),
        BlocProvider(
          create: (context) => GoogleBloc(),
        ) // Khởi tạo ForgotPasswordBloc ở đây
      ],
      child: MaterialApp(
        title: 'LutaSubin',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const RootPage(),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;//hien thi mat khau
  //!TextEditingController: Được sử dụng để nhận dữ liệu từ các trường nhập liệu (username và password).
  //!late đảm bảo rằng biến được khởi tạo trước khi sử dụng.
  late final TextEditingController userNameTextController;
  late final TextEditingController passwordTextController;
//khoi tao
  @override
  void initState() {
    super.initState();
    userNameTextController = TextEditingController();
    passwordTextController = TextEditingController();
  }
//giai phong
  @override
  void dispose() {
    userNameTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //! lang nghe loginBloc
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is SuccessfullyLoginState) {
          // Navigator.of(context).pushReplacement(
          //   MaterialPageRoute(builder: (context) => const HomeScreen()),
          // );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.successfulMsg),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is FailedLoginState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF0A0E21),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //!avatar logo
                CircleAvatar(
                  radius: 60,
                  backgroundColor: const Color.fromARGB(255, 231, 230, 229),
                  child: Image.asset('asset/image/Group 1.png'),
                ),
                const SizedBox(height: 40),
                //!bam dang nhap vong tron loading mau cam se thay the  colum
                BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                  if (state is LoadingState) {
                    // Hiển thị spinner khi đang đăng nhập
                    return const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                    );
                  }

                  return Column(
                    children: [
                      TextField(
                        controller: userNameTextController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: "Tên đăng nhập",
                          labelStyle:
                              TextStyle(color: Colors.amber, fontSize: 15),
                          hintText: "Nhập tên của bạn",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 212, 206, 189),
                            fontSize: 13,
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: passwordTextController,
                        style: const TextStyle(color: Colors.white),
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                            labelText: "Mật khẩu",
                            labelStyle: const TextStyle(
                                color: Colors.amber, fontSize: 15),
                            hintText: "Nhập mật khẩu của bạn",
                            hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 212, 206, 189),
                              fontSize: 13,
                            ),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.amber,
                            ),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                                //!bam con mat de co the xem duoc mK
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.amber,
                                ))),
                      ),

                      //!chuc nang quen mat khau
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const ForgotPasswordDialog(); // Sử dụng dialog mà không khởi tạo thêm ForgotPasswordBloc
                              },
                            );
                          },
                          child: const Text(
                            "Quên mật khẩu?",
                            style: TextStyle(color: Colors.amber),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      //!dang nhap
                      ElevatedButton(
                        onPressed: state is! LoadingState
                            ? () {
                                BlocProvider.of<LoginBloc>(context).add(
                                  LoginButtonPressed(
                                    userNameTextController.text,
                                    passwordTextController.text,
                                  ),
                                );
                              }
                            : null, // Vô hiệu hóa nút khi đang tải
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: state is LoadingState
                            ? const SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                'Đăng nhập',
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    ],
                  );
                }),
                const SizedBox(height: 60),
                const Text(
                  "Hoặc đăng nhập với",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocListener<GoogleBloc, GoogleState>(
                      listener: (context, state) {
                        if (state is GoogleLoginSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.successMessage),
                              backgroundColor: Colors.green,
                            ),
                          );
                        } else if (state is GoogleLoginFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.errorMessage),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      child: BlocBuilder<GoogleBloc, GoogleState>(
                        builder: (context, state) {
                          if (state is GoogleLoading) {
                            return const CircularProgressIndicator(
                              color: Colors.amber,
                            );
                          }
                          return Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  BlocProvider.of<GoogleBloc>(context)
                                      .add(GoogleLoginPressed());
                                },
                                icon: const CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.white,
                                  child: Icon(FontAwesomeIcons.google,
                                      color: Colors.red),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Google',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 212, 206, 189),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    BlocListener<FacebookBloc, FacebookState>(
                      listener: (context, state) {
                        if (state is FacebookLoginSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.successMessage),
                              backgroundColor: Colors.green,
                            ),
                          );
                        } else if (state is FacebookLoginFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.errorMessage),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      child: BlocBuilder<FacebookBloc, FacebookState>(
                        builder: (context, state) {
                          if (state is FacebookLoading) {
                            return const CircularProgressIndicator(
                              color: Colors.amber,
                            );
                          }
                          return Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  BlocProvider.of<FacebookBloc>(context)
                                      .add(FacebookLoginPressed());
                                },
                                icon: const CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.white,
                                  child: Icon(FontAwesomeIcons.facebook,
                                      color: Colors.blue),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Facebook',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 212, 206, 189),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
