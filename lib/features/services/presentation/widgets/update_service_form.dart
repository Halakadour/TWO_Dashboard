import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/routes/app_route_config.dart';
import 'package:two_dashboard/config/strings/text_strings.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/functions/get_network_image.dart';
import 'package:two_dashboard/core/widgets/breadcrumbs/breadcumbs_item.dart';
import 'package:two_dashboard/core/widgets/buttons/desmiss_elevated_buttom.dart';
import 'package:two_dashboard/core/widgets/buttons/save_elevated_button.dart';
import 'package:two_dashboard/core/widgets/images/fetch_image_box.dart';
import 'package:two_dashboard/core/widgets/layouts/templates/page_template.dart';
import 'package:two_dashboard/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_dashboard/core/widgets/texts/page_title.dart';
import 'package:two_dashboard/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:two_dashboard/features/services/domain/entities/service_entity.dart';
import 'package:two_dashboard/features/services/presentation/bloc/service_bloc.dart';

class UpdateServiceForm extends StatefulWidget {
  const UpdateServiceForm({super.key, required this.serviceEntity});
  final ServiceEntity serviceEntity;

  @override
  State<UpdateServiceForm> createState() => _UpdateServiceFormState();
}

class _UpdateServiceFormState extends State<UpdateServiceForm> {
  late final GlobalKey<FormState> _formkey;
  late final TextEditingController _serviceTitleController;
  late final TextEditingController _serviceDescController;
  String? imageBytes;
  void updateImageBytes(String? bytes) {
    setState(() {
      imageBytes = bytes;
    });
  }

  void getImage() {
    setState(() async {
      imageBytes = await fetchImage(widget.serviceEntity.imageE);
    });
  }

  @override
  void initState() {
    _formkey = GlobalKey<FormState>();
    _serviceTitleController = TextEditingController(
      text: widget.serviceEntity.titleE,
    );
    _serviceDescController = TextEditingController(
      text: widget.serviceEntity.descriptionE,
    );
    getImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ServiceBloc, ServiceState>(
      listener: (context, state) {},
      listenWhen:
          (previous, current) =>
              previous.createServiceStatus != current.createServiceStatus,
      child: PageTemplate(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Breadcrumbs(
              paths: [AppRouteConfig.services, AppRouteConfig.updateService],
              pages: ["Services", "Update Service"],
            ),
            PaddingConfig.h16,
            Row(
              children: [
                IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.arrow_back),
                ),
                PaddingConfig.w8,
                PageTitle(pageTitle: "Update Service"),
              ],
            ),
            PaddingConfig.h24,
            SizedBox(
              height: 400,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: const EdgeInsets.all(SizesConfig.md),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(
                          SizesConfig.borderRadiusMd,
                        ),
                      ),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Basic Information",
                              style: AppTextStyle.subtitle03(),
                            ),
                            PaddingConfig.h16,
                            CustomTextFormField(
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: AppColors.gray,
                                  width: .7,
                                ),
                                borderRadius: BorderRadius.circular(
                                  SizesConfig.cardRadiusMd,
                                ),
                              ),
                              labelText: 'Service Title',
                              controller: _serviceTitleController,
                              validator: (p0) {
                                if (p0 != null) {
                                  return null;
                                } else {
                                  return TextStrings.fieldValidation;
                                }
                              },
                            ),
                            PaddingConfig.h16,
                            CustomTextFormField(
                              maxLines: 6,
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: AppColors.gray,
                                  width: .7,
                                ),
                                borderRadius: BorderRadius.circular(
                                  SizesConfig.cardRadiusMd,
                                ),
                              ),
                              labelText: 'Service Description',
                              controller: _serviceDescController,
                              validator: (p0) {
                                if (p0 != null) {
                                  return null;
                                } else {
                                  return TextStrings.fieldValidation;
                                }
                              },
                            ),
                            PaddingConfig.h16,
                          ],
                        ),
                      ),
                    ),
                  ),
                  PaddingConfig.w16,
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(SizesConfig.md),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(
                          SizesConfig.borderRadiusMd,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Service Image",
                            style: AppTextStyle.subtitle03(),
                          ),
                          PaddingConfig.h16,
                          FetchImageBox(
                            imageB64: imageBytes,
                            onUpdate: updateImageBytes,
                          ),
                          PaddingConfig.h16,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            PaddingConfig.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const DesmissElevatedButtom(),
                PaddingConfig.w16,
                SaveElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      if (imageBytes == null) {
                        CustomQuickAlert().addImageAlert(context);
                      } else {
                        context.read<ServiceBloc>().add(
                          UpdateServiceEvent(
                            serviceId: widget.serviceEntity.idE.toString(),
                            title: _serviceTitleController.text,
                            description: _serviceDescController.text,
                            image: imageBytes!,
                          ),
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
