import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_firebase/lession25_dio/core/apis/dio_client.dart';
import 'package:flutter_firebase/lession25_dio/core/theme/my_theme.dart';
import 'package:flutter_firebase/lession25_dio/data/datasources/movie_remote_data_source.dart';
import 'package:flutter_firebase/lession25_dio/data/repositories/movie_repository_impl.dart';
import 'package:flutter_firebase/lession25_dio/domain/usecases/global_info_usecases.dart';
import 'package:flutter_firebase/lession25_dio/presentation/home/home_screen.dart';
import 'package:flutter_firebase/lession25_dio/presentation/home/logic_holders/global_info_bloc/bloc/global_info_bloc.dart';

void main(List<String> args) async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GlobalInfoBloc>(
      create: (_) => GlobalInfoBloc(
        GlobalInfoUsecases(MovieRepositoryImpl(
            remoteDataSource: MovieRemoteDataSourceImpl(dio: DioClient().dio))),
      )..add(GetGlobalInfo()),
      child: MaterialApp(
        theme: MyTheme.darkTheme(),
        home: BlocBuilder<GlobalInfoBloc, GlobalInfoState>(builder: (_, state) {
          if (state is GlobalInfoLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is GlobalInfoLoaded) {
            return const HomeScreen();
          }
          return Container(
            color: Colors.amber,
          );
        }),
      ),
    );
  }
}

// NowPlayingMoviesScreen()