import 'package:two_dashboard/features/contracts/domain/entities/draft_entity.dart';

class DraftModel extends DraftEntity {
  final int id;
  final String contract;
  final int? state;
  // final int clientId;
  // final String clientName
  // final String clientImage

  DraftModel({required this.id, required this.contract, required this.state})
    : super(
        draftId: id,
        draftPath: contract,
        approvedStatus: state,
        clientId: 0,
        clientImage: "",
        clientName: "",
      );

  factory DraftModel.fromJson(Map<String, dynamic> json) => DraftModel(
    id: json["id"],
    contract: json["contract"],
    state: json["state"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "contract": contract,
    "state": state,
  };
}
