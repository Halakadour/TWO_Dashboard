class ContractEntity {
  final int contractId;
  final String contractPath;
  final String clientId;
  final String clientName;
  final String clientImage;
  final String? clientSign;

  ContractEntity({
    required this.contractId,
    required this.contractPath,
    required this.clientId,
    required this.clientName,
    required this.clientImage,
    required this.clientSign,
  });
}
