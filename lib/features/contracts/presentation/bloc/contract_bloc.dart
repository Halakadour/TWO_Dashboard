import 'package:bloc/bloc.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/param/casule_param.dart';
import 'package:two_dashboard/core/param/contract_draft_param.dart';
import 'package:two_dashboard/core/services/shared_preferences_services.dart';
import 'package:two_dashboard/features/contracts/domain/entities/contract_entity.dart';
import 'package:two_dashboard/features/contracts/domain/entities/draft_entity.dart';
import 'package:two_dashboard/features/contracts/domain/usecases/contract-usecase/add_contract_usecase.dart';
import 'package:two_dashboard/features/contracts/domain/usecases/contract-usecase/add_sign_usecase.dart';
import 'package:two_dashboard/features/contracts/domain/usecases/contract-usecase/get_client_contract_usecase.dart';
import 'package:two_dashboard/features/contracts/domain/usecases/contract-usecase/get_contracts_usecase.dart';
import 'package:two_dashboard/features/contracts/domain/usecases/draft-usecase/create_draft_usecase.dart';
import 'package:two_dashboard/features/contracts/domain/usecases/draft-usecase/delete_draft_usecase.dart';
import 'package:two_dashboard/features/contracts/domain/usecases/draft-usecase/get_draft_usecase.dart';

part 'contract_event.dart';
part 'contract_state.dart';

class ContractBloc extends Bloc<ContractEvent, ContractState> {
  final AddContractUsecase addContractUsecase;
  final AddSignUsecase addSignUsecase;
  final GetClientContractUsecase getClientContractUsecase;
  final GetContractsUsecase getContractsUsecase;
  final CreateDraftUsecase createDraftUsecase;
  final DeleteDraftUsecase deleteDraftUsecase;
  final GetDraftUsecase getDraftUsecase;
  ContractBloc(
    this.addContractUsecase,
    this.addSignUsecase,
    this.getClientContractUsecase,
    this.getContractsUsecase,
    this.createDraftUsecase,
    this.deleteDraftUsecase,
    this.getDraftUsecase,
  ) : super(ContractState()) {
    // Contract Bloc //
    on<GetContractEvent>((event, emit) async {
      emit(state.copyWith(contrcatListStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await getContractsUsecase.call(
          GetDraftOrContractParam(token: token, filter: event.filter),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              contrcatListStatus: CasualStatus.failure,
              message: l.message,
            ),
          ),
          (r) => emit(
            state.copyWith(
              contrcatListStatus: CasualStatus.success,
              contractList: r,
            ),
          ),
        );
      } else {
        emit(state.copyWith(contrcatListStatus: CasualStatus.not_authorized));
      }
    });
    on<GetClientContractEvent>((event, emit) async {
      emit(state.copyWith(clientContrcatListStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await getClientContractUsecase.call(
          GetDraftOrContractParam(token: token, filter: event.filter),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              clientContrcatListStatus: CasualStatus.failure,
              message: l.message,
            ),
          ),
          (r) => emit(
            state.copyWith(
              clientContrcatListStatus: CasualStatus.success,
              clientContractList: r,
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(clientContrcatListStatus: CasualStatus.not_authorized),
        );
      }
    });
    on<CreateContractEvent>((event, emit) async {
      emit(state.copyWith(addContractStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await addContractUsecase.call(
          AddContractParam(
            token: token,
            contract: event.contract,
            clientId: event.clientId,
            drafId: event.drafId,
          ),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              addContractStatus: CasualStatus.failure,
              message: l.message,
            ),
          ),
          (r) => emit(state.copyWith(addContractStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(addContractStatus: CasualStatus.not_authorized));
      }
    });
    on<AddSignEvent>((event, emit) async {
      emit(state.copyWith(addSignStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await addSignUsecase.call(
          AddSignParam(
            token: token,
            signature: event.signature,
            contractId: event.contractId,
          ),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              addSignStatus: CasualStatus.failure,
              message: l.message,
            ),
          ),
          (r) => emit(state.copyWith(addSignStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(addSignStatus: CasualStatus.not_authorized));
      }
    });
    // Draft Bloc
    on<GetDrafEvent>((event, emit) async {
      emit(state.copyWith(drafListStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await getDraftUsecase.call(
          GetDraftOrContractParam(token: token, filter: event.filter),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              drafListStatus: CasualStatus.failure,
              message: l.message,
            ),
          ),
          (r) => emit(
            state.copyWith(drafListStatus: CasualStatus.success, drafList: r),
          ),
        );
      } else {
        emit(state.copyWith(drafListStatus: CasualStatus.not_authorized));
      }
    });
    on<CreateDrafEvent>((event, emit) async {
      emit(state.copyWith(createDrafStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await createDraftUsecase.call(
          CreateDraftParam(
            token: token,
            draf: event.draf,
            clientId: event.clientId,
          ),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              createDrafStatus: CasualStatus.failure,
              message: l.message,
            ),
          ),
          (r) => emit(state.copyWith(createDrafStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(createDrafStatus: CasualStatus.not_authorized));
      }
    });
    on<DeleteDrafEvent>((event, emit) async {
      emit(state.copyWith(deleteDrafStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await deleteDraftUsecase.call(
          TokenWithIdParam(token: token, id: event.drafId),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              deleteDrafStatus: CasualStatus.failure,
              message: l.message,
            ),
          ),
          (r) => emit(state.copyWith(deleteDrafStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(deleteDrafStatus: CasualStatus.not_authorized));
      }
    });
  }
}
