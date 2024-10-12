// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_firebase/lession25_dio/core/services/logger_service.dart';
import 'package:flutter_firebase/lession25_dio/domain/entities/genre.dart';
import 'package:flutter_firebase/lession25_dio/domain/entities/image_configuration.dart';
import 'package:flutter_firebase/lession25_dio/domain/usecases/global_info_usecases.dart';


part 'global_info_event.dart';
part 'global_info_state.dart';

class GlobalInfoBloc extends Bloc<GlobalInfoEvent, GlobalInfoState> {
  final GlobalInfoUsecases usecase;
  GlobalInfoBloc(
    this.usecase,
  ) : super(GlobalInfoInitial()) {
    on<GetGlobalInfo>((event, emit) async {
      emit(GlobalInfoLoading());
      try {
        final genreList = await usecase.getGenre();
        final imageConfig = await usecase.getImageInfo();
        emit(GlobalInfoLoaded(
            genreList: genreList, imageConfigInfo: imageConfig));
      } catch (e) {
        printE("[GlobalInfoBloc] - [GetGlobalInfo] error: ${e.toString()}");
        emit(GlobalInfoError(message: "error occured"));
      }
    });
  }
}