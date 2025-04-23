import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/routes/app_route_config.dart';
import 'package:two_dashboard/config/strings/text_strings.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/widgets/breadcrumbs/breadcumbs_item.dart';
import 'package:two_dashboard/core/widgets/buttons/back_button.dart';
import 'package:two_dashboard/core/widgets/buttons/desmiss_elevated_buttom.dart';
import 'package:two_dashboard/core/widgets/buttons/save_elevated_button.dart';
import 'package:two_dashboard/core/widgets/images/fetch_image_box.dart';
import 'package:two_dashboard/core/widgets/layouts/templates/page_template.dart';
import 'package:two_dashboard/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_dashboard/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:two_dashboard/features/posts/presentation/bloc/post_bloc.dart';

class CreatePostForm extends StatefulWidget {
  const CreatePostForm({super.key});

  @override
  State<CreatePostForm> createState() => _CreatePostFormState();
}

class _CreatePostFormState extends State<CreatePostForm> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _postTitleController;
  String? imageBytes;
  void updateImageBytes(String? bytes) {
    setState(() {
      imageBytes = bytes;
    });
  }

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _postTitleController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostBloc, PostState>(
      listener: (context, state) {
        createPostStateHandling(state, context);
      },
      listenWhen:
          (previous, current) =>
              previous.createPostStatus != current.createPostStatus,
      child: PageTemplate(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Breadcrumbs(
                paths: [AppRouteConfig.post, AppRouteConfig.createPost],
                pages: ["Posts", "Create Post"],
              ),
              PaddingConfig.h16,
              Row(
                children: [
                  const CustomBackButton(),
                  PaddingConfig.w8,
                  Text("Create Post", style: AppTextStyle.heading04()),
                ],
              ),
              PaddingConfig.h24,
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(SizesConfig.md),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(
                    SizesConfig.borderRadiusMd,
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        labelText: 'Post Title',
                        controller: _postTitleController,
                        validator: (p0) {
                          if (p0 != null) {
                            return null;
                          } else {
                            return TextStrings.fieldValidation;
                          }
                        },
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
              PaddingConfig.h16,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const DesmissElevatedButtom(),
                  PaddingConfig.w16,
                  SaveElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (imageBytes == null) {
                          CustomQuickAlert().addImageAlert(context);
                        } else {
                          context.read<PostBloc>().add(
                            CreatePostEvent(
                              image: imageBytes!,
                              body: _postTitleController.text,
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
      ),
    );
  }

  void createPostStateHandling(PostState state, BuildContext context) {
    if (state.createPostStatus == CasualStatus.loading) {
      CustomQuickAlert().loadingAlert(context);
    } else if (state.createPostStatus == CasualStatus.success) {
      context.pop();
      CustomQuickAlert().successAlert(context);
      context.read<PostBloc>().add(GetActivePostsEvent());
      context.pop();
    } else if (state.createPostStatus == CasualStatus.failure) {
      context.pop();
      CustomQuickAlert().failureAlert(context, state.message);
    } else if (state.createPostStatus == CasualStatus.noToken) {
      context.pop();
      CustomQuickAlert().noTokenAlert(context);
    }
  }
}
