import 'package:flutter/material.dart';
import 'package:two_dashboard/core/widgets/layouts/templates/custom_site_template.dart';
import 'package:two_dashboard/features/services/domain/entities/service_entity.dart';
import 'package:two_dashboard/features/services/presentation/pages/update-service/responsive-pages/update_service_desktop_tablet.dart';
import 'package:two_dashboard/features/services/presentation/pages/update-service/responsive-pages/update_service_mobile.dart';

class UpdateServicePage extends StatelessWidget {
  const UpdateServicePage({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });
  final String id;
  final String title;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    final serviceEntity = ServiceEntity(
      idE: int.parse(id),
      titleE: title,
      descriptionE: description,
      imageE: image,
    );
    return CustomSiteTemplate(
      currentPageIndex: 0,
      onItemSelected: (p0) {},
      useLayout: false,
      desktop: UpdateServiceDesktopTablet(serviceEntity: serviceEntity),
      tablet: UpdateServiceDesktopTablet(serviceEntity: serviceEntity),
      mobile: UpdateServiceMobile(serviceEntity: serviceEntity),
    );
  }
}
