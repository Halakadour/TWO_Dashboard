part of 'contract_bloc.dart';

class ContractState {
  final String message;
  final List<ContractEntity> contractList;
  final List<ContractEntity> clientContractList;
  final CasualStatus contrcatListStatus;
  final CasualStatus clientContrcatListStatus;
  final CasualStatus createContractStatus;
  final CasualStatus addSignStatus;
  final CasualStatus createDrafStatus;
  final CasualStatus deleteDrafStatus;
  final List<DraftEntity> drafList;
  final CasualStatus drafListStatus;
  ContractState({
    this.message = "",
    this.contractList = const [],
    this.clientContractList = const [],
    this.contrcatListStatus = CasualStatus.initial,
    this.clientContrcatListStatus = CasualStatus.initial,
    this.createContractStatus = CasualStatus.initial,
    this.addSignStatus = CasualStatus.initial,
    this.createDrafStatus = CasualStatus.initial,
    this.deleteDrafStatus = CasualStatus.initial,
    this.drafList = const [],
    this.drafListStatus = CasualStatus.initial,
  });

  ContractState copyWith({
    String? message,
    List<ContractEntity>? contractList,
    List<ContractEntity>? clientContractList,
    CasualStatus? contrcatListStatus,
    CasualStatus? clientContrcatListStatus,
    CasualStatus? addContractStatus,
    CasualStatus? addSignStatus,
    CasualStatus? createDrafStatus,
    CasualStatus? deleteDrafStatus,
    List<DraftEntity>? drafList,
    CasualStatus? drafListStatus,
  }) {
    return ContractState(
      message: message ?? this.message,
      contractList: contractList ?? this.contractList,
      clientContractList: clientContractList ?? this.clientContractList,
      contrcatListStatus: contrcatListStatus ?? this.contrcatListStatus,
      clientContrcatListStatus:
          clientContrcatListStatus ?? this.clientContrcatListStatus,
      createContractStatus: addContractStatus ?? this.createContractStatus,
      addSignStatus: addSignStatus ?? this.addSignStatus,
      createDrafStatus: createDrafStatus ?? this.createDrafStatus,
      deleteDrafStatus: deleteDrafStatus ?? this.deleteDrafStatus,
      drafList: drafList ?? this.drafList,
      drafListStatus: drafListStatus ?? this.drafListStatus,
    );
  }
}
