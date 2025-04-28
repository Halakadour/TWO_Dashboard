// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_role_profile_bloc.dart';

abstract class AuthRoleProfileEvent {
  const AuthRoleProfileEvent();
}

// Auth Events //
class CheckAuthEvent extends AuthRoleProfileEvent {}

class RegisteNewUserEvent extends AuthRoleProfileEvent {
  final String name;
  final String email;
  final String password;
  const RegisteNewUserEvent({
    required this.name,
    required this.email,
    required this.password,
  });
}

class LoginUserEvent extends AuthRoleProfileEvent {
  final String email;
  final String password;
  const LoginUserEvent({required this.email, required this.password});
}

class LogoutUserEvent extends AuthRoleProfileEvent {}

// Role Events //

class GetRolesWithoutClientEvent extends AuthRoleProfileEvent {}

class GetRolesEvent extends AuthRoleProfileEvent {}

// Profile Events //

class UpdateEmployeeProfileEvent extends AuthRoleProfileEvent {
  final String image;
  final String cv;
  final int roleId;
  UpdateEmployeeProfileEvent({
    required this.image,
    required this.cv,
    required this.roleId,
  });
}

class GetUserProfileEvent extends AuthRoleProfileEvent {}

class ToggleUserApprovedEvent extends AuthRoleProfileEvent {
  final int userId;

  ToggleUserApprovedEvent({required this.userId});
}

class ShowUsersWithFilterEvent extends AuthRoleProfileEvent {
  int approvedFilter;
  int? roleFilter;
  ShowUsersWithFilterEvent({this.approvedFilter = 0, this.roleFilter});
}
