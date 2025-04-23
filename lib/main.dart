import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_dashboard/config/routes/app_router.dart';
import 'package:two_dashboard/features/about-us-why-us/presentation/bloc/about_us_why_us_bloc.dart';
import 'package:two_dashboard/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_dashboard/features/contact-us/presentation/bloc/contact_us_bloc.dart';
import 'package:two_dashboard/features/contracts/presentation/bloc/contract_bloc.dart';
import 'package:two_dashboard/features/posts/presentation/bloc/post_bloc.dart';
import 'package:two_dashboard/features/services/presentation/bloc/service_bloc.dart';
import 'injection_container.dart' as di;

import 'config/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      path: 'assets/lang',
      supportedLocales: const [Locale('en'), Locale('ar')],
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('en'),
      saveLocale: true,
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<AuthRoleProfileBloc>()),
        BlocProvider(create: (context) => di.sl<PostBloc>()),
        BlocProvider(create: (context) => di.sl<ServiceBloc>()),
        BlocProvider(create: (context) => di.sl<AboutUsWhyUsBloc>()),
        BlocProvider(create: (context) => di.sl<ContactUsBloc>()),
        BlocProvider(create: (context) => di.sl<ContractBloc>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'TWO',
        theme: AppTheme.getTheme(),
        routerConfig: AppRouter().router,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        builder: (context, child) => child!,
      ),
    );
  }
}
