import 'package:flutter/material.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/features/contracts/presentation/widgets/create_contract_form.dart';

class CreateContractMobile extends StatelessWidget {
  const CreateContractMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SizesConfig.defaultSpace),
          child: Column(children: [CreateContractForm()]),
        ),
      ),
    );
  }
}
