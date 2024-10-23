// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/lesson_30_firestore/core/apis/dio_client.dart';
import 'package:flutter_firebase/lesson_30_firestore/core/services/logger_service.dart';
import 'package:flutter_firebase/lesson_30_firestore/core/utils/convert_util.dart';
import 'package:flutter_firebase/lesson_30_firestore/features/home/data/datasources/movie_remote_data_source.dart';
import 'package:flutter_firebase/lesson_30_firestore/features/home/data/repositories/movie_repository_impl.dart';
import 'package:flutter_firebase/lesson_30_firestore/features/home/domain/usecases/movie_usecase.dart';
import 'package:flutter_firebase/lesson_30_firestore/features/home/presentation/logic_holders/global_info_bloc/global_info_bloc.dart';
import 'package:flutter_firebase/lesson_30_firestore/features/home/presentation/logic_holders/movie_info_bloc/movie_info_bloc.dart';
import 'package:flutter_firebase/lesson_30_firestore/features/home/presentation/widgets/header_section.dart';
import 'package:flutter_firebase/lesson_30_firestore/features/home/presentation/widgets/movie_item.dart';
import 'package:flutter_firebase/lesson_30_firestore/features/home/presentation/widgets/upcoming_section.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieInfoBloc>(
      create: (context) => MovieInfoBloc(GetMovies(MovieRepositoryImpl(
          remoteDataSource: MovieRemoteDataSourceImpl(dio: DioClient().dio))))
        ..add(LoadMovies()),
      child: Scaffold(
        body: Column(
          children: [
            HeaderSection(
              onPressed: () async {
                // await GoogleSignIn()
                //     .signOut(); // Đảm bảo rằng đăng xuất Google trước tiên
                // await FirebaseAuth.instance.signOut();

                Navigator.of(context).pushNamed('profile');
              },
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: BlocBuilder<MovieInfoBloc, MoviesState>(
                      builder: (context, state) {
                        if (state is MoviesLoaded) {
                          final upcommingMovies = state.upcommingMovies;
                          return BlocBuilder<GlobalInfoBloc, GlobalInfoState>(
                              builder: (_, state) {
                            if (state is GlobalInfoLoaded) {
                              final imageConfigInfo = state.imageConfigInfo;
                              final listPosterImage = upcommingMovies
                                  .map((e) =>
                                      imageConfigInfo!.baseUrl +
                                      imageConfigInfo
                                          .getPosterSizeText('w342') +
                                      e.posterPath)
                                  .toList();
                              printI("List poster: $listPosterImage");
                              return UpcomingSection(
                                listUpcommingMoviesPoster: listPosterImage,
                                setStateFunc: (index) {
                                  setState(() {
                                    currentIndex = index;
                                  });
                                },
                              );
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          });
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                  // SliverToBoxAdapter(
                  //   child: Center(
                  //     child: AnimatedSmoothIndicator(
                  //       activeIndex: currentIndex,
                  //       count: listUpcommingMoviesPoster.length,
                  //       effect: const ExpandingDotsEffect(
                  //           activeDotColor: Color(0xffFF8036),
                  //           expansionFactor: 2.5,
                  //           spacing: 6,
                  //           dotHeight: 8,
                  //           dotColor: Color(0xff637394),
                  //           dotWidth: 8),
                  //     ),
                  //   ),
                  // ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Now in cinemas",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: Colors.white),
                          ),
                          Icon(
                            Icons.search,
                            color: Color(0xff637394),
                            size: 28,
                          )
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding:
                        const EdgeInsets.only(top: 16.0, left: 16, right: 16),
                    sliver: BlocBuilder<MovieInfoBloc, MoviesState>(
                        builder: (context, state) {
                      if (state is MoviesLoading) {
                        return const SliverToBoxAdapter(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (state is MoviesLoaded) {
                        final movies = state.nowPlayingMovies;

                        return BlocBuilder<GlobalInfoBloc, GlobalInfoState>(
                          builder: (context, state) {
                            if (state is GlobalInfoLoaded) {
                              final imageConfigInfo = state.imageConfigInfo;

                              return SliverGrid.builder(
                                  itemCount: movies.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 16,
                                    mainAxisSpacing: 16,
                                    childAspectRatio: 163 / 282,
                                  ),
                                  itemBuilder: (_, index) {
                                    final filteredGenreList =
                                        convertGenreIdsToGenreStrings(
                                            movies[index].genreIds,
                                            state.genreList!);
                                    final selectedGenreTexts = filteredGenreList
                                        .map((e) => e.name)
                                        .toList();
                                    return MovieItem(
                                      posterImgPath: imageConfigInfo!.baseUrl +
                                          imageConfigInfo
                                              .getPosterSizeText("w342") +
                                          movies[index].posterPath,
                                      title: movies[index].title,
                                      genre: selectedGenreTexts.join(", "),
                                      score: movies[index].voteAverage,
                                    );
                                  });
                            }
                            return const SliverToBoxAdapter(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                        );
                      }

                      return const SliverToBoxAdapter(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}