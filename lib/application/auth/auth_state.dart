// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final AuthenticationStatus statusAuth;
  final FormzSubmissionStatus status;
  final Profile profile;
  const AuthState({
    this.statusAuth = AuthenticationStatus.loading,
    this.status = FormzSubmissionStatus.initial,
    this.profile = const Profile(),
  });

  @override
  List<Object> get props => [
        statusAuth,
        status,
        profile,
      ];

  AuthState copyWith({
    AuthenticationStatus? statusAuth,
    FormzSubmissionStatus? status,
    Profile? profile,
  }) {
    return AuthState(
      statusAuth: statusAuth ?? this.statusAuth,
      status: status ?? this.status,
      profile: profile ?? this.profile,
    );
  }
}
