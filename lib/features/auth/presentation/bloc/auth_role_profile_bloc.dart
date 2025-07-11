import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/param/auth_param.dart';
import 'package:two_dashboard/core/param/casule_param.dart';
import 'package:two_dashboard/core/param/profile_param.dart';
import 'package:two_dashboard/core/services/shared_preferences_services.dart';
import 'package:two_dashboard/features/auth/data/models/user_model.dart';
import 'package:two_dashboard/features/auth/domain/usecases/login_usecase.dart';
import 'package:two_dashboard/features/auth/domain/usecases/logout_usecase.dart';
import 'package:two_dashboard/features/auth/domain/usecases/register_usecase.dart';
import 'package:two_dashboard/features/profile/domain/entities/client_entity.dart';
import 'package:two_dashboard/features/profile/domain/entities/employee_entity.dart';
import 'package:two_dashboard/features/profile/domain/usecases/get_image_usecase.dart';
import 'package:two_dashboard/features/profile/domain/usecases/get_user_profile_usecase.dart';
import 'package:two_dashboard/features/profile/domain/usecases/show_clients_usecase.dart';
import 'package:two_dashboard/features/profile/domain/usecases/show_users_usecase.dart';
import 'package:two_dashboard/features/profile/domain/usecases/toggle_user_approved_usecase.dart';
import 'package:two_dashboard/features/profile/domain/usecases/update_employee_profile_usecase.dart';
import 'package:two_dashboard/features/roles/domain/usecases/show_role_client_usecase.dart';
import 'package:two_dashboard/features/roles/domain/usecases/show_roles_without_client_usecase.dart';

import '../../../roles/data/models/role_response_model.dart';

part 'auth_role_profile_event.dart';
part 'auth_role_profile_state.dart';

class AuthRoleProfileBloc
    extends Bloc<AuthRoleProfileEvent, AuthRoleProfileState> {
  // Auth Usecases //
  final RegisterUsecase registerUsecase;
  final LoginUsecase loginUsecase;
  final LogoutUsecase logoutUsecase;
  // Role Usecases //
  final ShowRolesWithoutClientUsecase showRolesWithoutClientUsecase;
  final ShowRoleClientUsecase showRoleClientUsecase;
  // Profile Usecases //
  final UpdateEmployeeProfileUsecase updateEmployeeProfileUsecase;
  final GetUserProfileUsecase getUserProfileUsecase;
  final ToggleUserApprovedUsecase toggleUserApprovedUsecase;
  final ShowUsersUsecase showUsersUsecase;
  final ShowClientsUsecase showClientsUsecase;
  final GetImageUsecase getImageUsecase;
  AuthRoleProfileBloc({
    required this.registerUsecase,
    required this.loginUsecase,
    required this.logoutUsecase,
    required this.showRolesWithoutClientUsecase,
    required this.showRoleClientUsecase,
    required this.updateEmployeeProfileUsecase,
    required this.getUserProfileUsecase,
    required this.toggleUserApprovedUsecase,
    required this.showUsersUsecase,
    required this.showClientsUsecase,
    required this.getImageUsecase,
  }) : super(AuthRoleProfileState()) {
    // Auth Bloc //
    on<RegisteNewUserEvent>((event, emit) async {
      emit(state.copyWith(authModelStatus: CasualStatus.loading));
      final result = await registerUsecase.call(
        SignUpParam(
          name: event.name,
          email: event.email,
          password: event.password,
          confirmPassword: event.password,
        ),
      );
      result.fold(
        (l) => emit(state.copyWith(authModelStatus: CasualStatus.failure)),
        (r) => emit(
          state.copyWith(authModel: r, authModelStatus: CasualStatus.success),
        ),
      );
    });
    on<LoginUserEvent>((event, emit) async {
      emit(state.copyWith(authModelStatus: CasualStatus.loading));
      final result = await loginUsecase.call(
        LoginParam(email: event.email, password: event.password),
      );
      result.fold(
        (l) => emit(
          state.copyWith(
            authModelStatus: CasualStatus.failure,
            message: l.message,
          ),
        ),
        (r) => emit(
          state.copyWith(authModelStatus: CasualStatus.success, authModel: r),
        ),
      );
    });
    on<LogoutUserEvent>((event, emit) async {
      emit(state.copyWith(logoutStatusStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await logoutUsecase.call(token);
        result.fold(
          (l) => emit(
            state.copyWith(
              logoutStatusStatus: CasualStatus.failure,
              message: l.message,
            ),
          ),
          (r) => emit(state.copyWith(logoutStatusStatus: CasualStatus.success)),
        );
      } else {
        emit(
          state.copyWith(
            logoutStatusStatus: CasualStatus.not_authorized,
            message: "No Token",
          ),
        );
      }
    });
    on<CheckAuthEvent>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      if (token != null) {
        emit(state.copyWith(authModelStatus: CasualStatus.success));
      } else {
        emit(
          state.copyWith(
            message: "No Token",
            authModelStatus: CasualStatus.failure,
          ),
        );
      }
    });
    // Role Bloc //
    on<GetRolesWithoutClientEvent>((event, emit) async {
      emit(state.copyWith(roleWithoutClientListStatus: CasualStatus.loading));
      final result = await showRolesWithoutClientUsecase.call();
      result.fold(
        (l) => emit(
          state.copyWith(
            roleWithoutClientListStatus: CasualStatus.failure,
            message: l.message,
          ),
        ),
        (r) => emit(
          state.copyWith(
            roleWithoutClientListStatus: CasualStatus.success,
            roleWithoutClientList: r.data,
          ),
        ),
      );
    });
    on<GetRolesEvent>((event, emit) async {
      emit(state.copyWith(roleListStatus: CasualStatus.loading));
      final result = await showRoleClientUsecase.call();
      result.fold(
        (l) => emit(
          state.copyWith(
            roleListStatus: CasualStatus.failure,
            message: l.message,
          ),
        ),
        (r) => emit(
          state.copyWith(
            roleListStatus: CasualStatus.success,
            roleList: r.data,
          ),
        ),
      );
    });
    // Profile Bloc //
    on<UpdateEmployeeProfileEvent>((event, emit) async {
      emit(state.copyWith(updateEmployeeProfileStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await updateEmployeeProfileUsecase.call(
          UpdateEmployeeProfileParam(
            token: token,
            image: event.image,
            cv: event.cv,
            roleId: event.roleId,
          ),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              updateEmployeeProfileStatus: CasualStatus.failure,
              message: l.message,
            ),
          ),
          (r) => emit(
            state.copyWith(updateEmployeeProfileStatus: CasualStatus.success),
          ),
        );
      } else {
        emit(
          state.copyWith(
            updateEmployeeProfileStatus: CasualStatus.not_authorized,
          ),
        );
      }
    });
    on<GetUserProfileEvent>((event, emit) async {
      emit(state.copyWith(employeeEntityStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await getUserProfileUsecase.call(token);
        result.fold(
          (l) => emit(
            state.copyWith(
              employeeEntityStatus: CasualStatus.failure,
              message: l.message,
            ),
          ),
          (r) => emit(
            state.copyWith(
              employeeEntityStatus: CasualStatus.success,
              employeeEntity: r,
            ),
          ),
        );
      } else {
        emit(state.copyWith(employeeEntityStatus: CasualStatus.not_authorized));
      }
    });
    on<ToggleUserApprovedEvent>((event, emit) async {
      emit(state.copyWith(toggleApproveStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await toggleUserApprovedUsecase.call(
          TokenWithIdParam(token: token, id: event.userId),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              toggleApproveStatus: CasualStatus.failure,
              message: l.message,
            ),
          ),
          (r) =>
              emit(state.copyWith(toggleApproveStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(toggleApproveStatus: CasualStatus.not_authorized));
      }
    });
    on<ShowUsersWithFilterEvent>((event, emit) async {
      emit(state.copyWith(userListStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await showUsersUsecase.call(
          ShowUsersParam(
            roleFilter: event.roleFilter ?? 0,
            approvedFilter: event.approvedFilter,
            token: token,
          ),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              userListStatus: CasualStatus.failure,
              message: l.message,
            ),
          ),
          (r) => emit(
            state.copyWith(userListStatus: CasualStatus.success, userList: r),
          ),
        );
      } else {
        emit(state.copyWith(userListStatus: CasualStatus.not_authorized));
      }
    });
    on<ShowClientsEvent>((event, emit) async {
      emit(state.copyWith(clientListStatus: CasualStatus.loading));
      final result = await showClientsUsecase.call();
      result.fold(
        (l) => emit(
          state.copyWith(
            clientListStatus: CasualStatus.failure,
            message: l.message,
          ),
        ),
        (r) => emit(
          state.copyWith(clientListStatus: CasualStatus.success, clientList: r),
        ),
      );
    });
    on<GetImageEvent>((event, emit) async {
      emit(state.copyWith(imageBytesStatus: CasualStatus.loading));
      final result = await getImageUsecase.call(event.imagePath);
      result.fold(
        (l) => emit(
          state.copyWith(
            imageBytesStatus: CasualStatus.failure,
            message: l.message,
          ),
        ),
        (r) => emit(
          state.copyWith(imageBytesStatus: CasualStatus.success, imageBytes: r),
        ),
      );
    });
  }
}
