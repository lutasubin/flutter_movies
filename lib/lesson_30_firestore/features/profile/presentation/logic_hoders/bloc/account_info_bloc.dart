import 'package:bloc/bloc.dart';
import 'package:flutter_firebase/lesson_30_firestore/core/enums/status_state.dart';
import 'package:flutter_firebase/lesson_30_firestore/features/profile/domain/entities/account_entity.dart';


part 'account_info_event.dart';
part 'account_info_state.dart';

class AccountInfoBloc extends Bloc<AccountInfoEvent, AccountInfoState> {
  AccountInfoBloc() : super(AccountInfoState()) {
    on<AccountInfoEvent>((event, emit) {});
  }
}
