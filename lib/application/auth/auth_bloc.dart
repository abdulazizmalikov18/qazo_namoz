import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:qazo_namoz/core/utils/constants.dart';
import 'package:qazo_namoz/models/profile.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_event.dart';
part 'auth_state.dart';

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
  loading,
  cancelLoading,
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<GetMeEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      emit(state.copyWith(
        status: FormzSubmissionStatus.failure,
        statusAuth: AuthenticationStatus.unauthenticated,
      ));
    });
    on<LoginEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        await supabase.auth.signInWithPassword(
          email: event.phone,
          password: event.password,
        );
        emit(state.copyWith(
          status: FormzSubmissionStatus.success,
          statusAuth: AuthenticationStatus.authenticated,
        ));
      } on AuthException catch (error) {
        event.onError(error.message);
      } catch (_) {
        event.onError(unexpectedErrorMessage);
      }
    });

    on<RegisterEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        await supabase.auth.signUp(
          email: event.phone,
          password: event.password,
          data: {
            'username': event.phone.substring(0, event.phone.indexOf('@'))
          },
        );
        event.onSucces();
      } on AuthException catch (error) {
        event.onError(error.message);
      } catch (_) {
        event.onError(unexpectedErrorMessage);
      }
    });
  }
}
