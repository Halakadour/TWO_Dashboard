import 'package:flutter/material.dart';
import 'package:two_dashboard/core/widgets/layouts/templates/custom_site_template.dart';
import 'package:two_dashboard/features/services/presentation/pages/create-service/responsive-pages/create_service_desktop_tablet.dart';
import 'package:two_dashboard/features/services/presentation/pages/create-service/responsive-pages/create_service_mobile.dart';

class CreateServicePage extends StatelessWidget {
  const CreateServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSiteTemplate(
      currentPageIndex: 0,
      onItemSelected: (p0) {},
      useLayout: false,
      desktop: const CreateServiceDesktopTablet(),
      tablet: const CreateServiceDesktopTablet(),
      mobile: const CreateServiceMobile(),
    );
  }
}
