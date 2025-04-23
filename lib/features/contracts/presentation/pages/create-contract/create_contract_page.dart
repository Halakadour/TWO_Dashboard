import 'package:flutter/material.dart';
import 'package:two_dashboard/core/widgets/layouts/templates/custom_site_template.dart';
import 'package:two_dashboard/features/contracts/presentation/pages/create-contract/responsive-pages/create_contract_desktop_tablet.dart';
import 'package:two_dashboard/features/contracts/presentation/pages/create-contract/responsive-pages/create_contract_mobile.dart';

class CreateContractPage extends StatelessWidget {
  const CreateContractPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSiteTemplate(
      currentPageIndex: 0,
      onItemSelected: (p0) {},
      useLayout: false,
      desktop: const CreateContractDesktopTablet(),
      tablet: const CreateContractDesktopTablet(),
      mobile: const CreateContractMobile(),
    );
  }
}
