import 'package:two_dashboard/features/contracts/domain/entities/contract_entity.dart';

class ContractModel extends ContractEntity {
  final int id;
  final String contract;
  final String clientId;
  // final String clientName;
  // final String clientImage;
  final String? clientSign;

  ContractModel({
    required this.id,
    required this.contract,
    required this.clientId,
    required this.clientSign,
  }) : super(
         contractId: id,
         contractPath: contract,
         clientId: clientId,
         clientImage: "",
         clientName: "name",
         clientSign: clientSign,
       );

  factory ContractModel.fromJson(Map<String, dynamic> json) => ContractModel(
    id: json["id"],
    contract: json["contract"],
    clientId: json["client_id"],
    clientSign: json["client_sign"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "contract": contract,
    "client_id": clientId,
    "client_sign": clientSign,
  };
}
