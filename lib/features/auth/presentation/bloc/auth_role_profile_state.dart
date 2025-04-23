// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_role_profile_bloc.dart';

// ignore: must_be_immutable
class AuthRoleProfileState {
  String message;
  //Auth States //
  CasualStatus authModelStatus;
  UserModel? authModel;
  CasualStatus logoutStatusStatus;
  //Role States //
  List<RoleModel> roleWithoutClientList;
  CasualStatus roleWithoutClientListStatus;
  List<RoleModel> roleList;
  CasualStatus roleListStatus;
  //Profile States //
  CasualStatus updateEmployeeProfileStatus;
  CasualStatus employeeEntityStatus;
  EmployeeEntity? employeeEntity;
  CasualStatus toggleApproveStatus;
  List<EmployeeEntity> userList;
  CasualStatus userListStatus;

  AuthRoleProfileState({
    this.message = "",
    this.authModelStatus = CasualStatus.initial,
    this.authModel,
    this.logoutStatusStatus = CasualStatus.initial,
    this.roleWithoutClientList = const [],
    this.roleWithoutClientListStatus = CasualStatus.initial,
    this.roleList = const [],
    this.roleListStatus = CasualStatus.initial,
    this.updateEmployeeProfileStatus = CasualStatus.initial,
    this.employeeEntityStatus = CasualStatus.initial,
    this.employeeEntity,
    this.toggleApproveStatus = CasualStatus.initial,
    this.userList = const [],
    this.userListStatus = CasualStatus.initial,
  });

  AuthRoleProfileState copyWith({
    String? message,
    CasualStatus? authModelStatus,
    UserModel? authModel,
    CasualStatus? logoutStatusStatus,
    List<RoleModel>? roleWithoutClientList,
    CasualStatus? roleWithoutClientListStatus,
    List<RoleModel>? roleList,
    CasualStatus? roleListStatus,
    CasualStatus? updateEmployeeProfileStatus,
    CasualStatus? employeeEntityStatus,
    EmployeeEntity? employeeEntity,
    CasualStatus? toggleApproveStatus,
    List<EmployeeEntity>? userList,
    CasualStatus? userListStatus,
  }) {
    return AuthRoleProfileState(
      message: message ?? this.message,
      authModelStatus: authModelStatus ?? this.authModelStatus,
      authModel: authModel ?? this.authModel,
      logoutStatusStatus: logoutStatusStatus ?? this.logoutStatusStatus,
      roleWithoutClientList:
          roleWithoutClientList ?? this.roleWithoutClientList,
      roleWithoutClientListStatus:
          roleWithoutClientListStatus ?? this.roleWithoutClientListStatus,
      roleList: roleList ?? this.roleList,
      roleListStatus: roleListStatus ?? this.roleListStatus,
      updateEmployeeProfileStatus:
          updateEmployeeProfileStatus ?? this.updateEmployeeProfileStatus,
      employeeEntityStatus: employeeEntityStatus ?? this.employeeEntityStatus,
      employeeEntity: employeeEntity ?? this.employeeEntity,
      toggleApproveStatus: toggleApproveStatus ?? this.toggleApproveStatus,
      userList: userList ?? this.userList,
      userListStatus: userListStatus ?? this.userListStatus,
    );
  }
}
