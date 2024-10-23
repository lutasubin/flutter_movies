import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/lesson_30_firestore/core/enums/status_state.dart';
import 'package:flutter_firebase/lesson_30_firestore/core/services/logger_service.dart';
import 'package:flutter_firebase/lesson_30_firestore/features/profile/domain/entities/account_entity.dart';
import 'package:flutter_firebase/lesson_30_firestore/features/profile/domain/repositories/account_repository.dart';


part 'account_info_event.dart';
part 'account_info_state.dart';

class AccountInfoBloc extends Bloc<AccountInfoEvent, AccountInfoState> {
  final AccountRepository repository;
  AccountInfoBloc(this.repository) : super(const AccountInfoState()) {
    on<UpdateDob>((event, emit) {
      final localAccountInfo = state.updatedLocalAccountData;
      final updatedInfo = localAccountInfo.copyWith(dob: event.newDob);
      emit(state.copyWith(updatedLocalAccountData: updatedInfo));
    });
    on<UpdateGender>((event, emit) {
      final localAccountInfo = state.updatedLocalAccountData;
      final updatedInfo = localAccountInfo.copyWith(gender: event.newGender);
      emit(state.copyWith(updatedLocalAccountData: updatedInfo));
    });
    on<UpdateFullname>((event, emit) {
      printS("[UpdateFullname] value: ${event.newName}");
      final localAccountInfo = state.updatedLocalAccountData;
      final updatedInfo = localAccountInfo.copyWith(fullName: event.newName);
      emit(state.copyWith(updatedLocalAccountData: updatedInfo));
    });
    on<UpdatePhoneNum>((event, emit) {
      printS("[UpdatePhoneNum] value: ${event.newPhoneNum}");
      final localAccountInfo = state.updatedLocalAccountData;
      final updatedInfo =
          localAccountInfo.copyWith(phoneNumber: event.newPhoneNum);
      emit(state.copyWith(updatedLocalAccountData: updatedInfo));
    });
    on<UpdateEmail>((event, emit) {
      printS("[UpdateEmail] value: ${event.newEmail}");
      final localAccountInfo = state.updatedLocalAccountData;
      final updatedInfo = localAccountInfo.copyWith(email: event.newEmail);
      emit(state.copyWith(updatedLocalAccountData: updatedInfo));
    });
    on<SaveInfo>((event, emit) async {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId != null) {
        emit(state.copyWith(status: StatusState.loading));
        final localAccountInfo = state.updatedLocalAccountData;
        printS("[SaveInfo] Info is ready to save: $localAccountInfo");
        await repository.createOrUpdateAccountData(userId, localAccountInfo);
        emit(state.copyWith(
            successMsg: "Lưu file thành công", status: StatusState.idle));
        add(FetchAccountInfo());
      }
    });
    on<FetchAccountInfo>((event, emit) async {
      try {
        emit(state.copyWith(status: StatusState.loading));
        final userId = FirebaseAuth.instance.currentUser?.uid;
        if (userId != null) {
          final result = await repository.getAccountData(userId);
          emit(state.copyWith(
              accountDataFromFirestore: result,
              updatedLocalAccountData: const AccountEntity()));
        }
      } catch (e) {
        printE("[FetchAccountInfo] error: $e");
      } finally {
        emit(state.copyWith(status: StatusState.idle));
      }
    });
  }

  bool get canUpdate {
    final updatedAccountInfo = state.updatedLocalAccountData;
    final fullname = updatedAccountInfo.fullName;
    final dob = updatedAccountInfo.dob;
    final phoneNum = updatedAccountInfo.phoneNumber;
    final email = updatedAccountInfo.email;
    final gender = updatedAccountInfo.gender;
    return fullname != null ||
        dob != null ||
        phoneNum != null ||
        email != null ||
        gender != null;
  }
}