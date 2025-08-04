import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_dashboard/config/routes/app_router.dart';
import 'package:two_dashboard/features/about-us%20&%20why-us/presentation/bloc/about_us_why_us_bloc.dart';
import 'package:two_dashboard/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_dashboard/features/contact-us/presentation/bloc/contact_us_bloc.dart';
import 'package:two_dashboard/features/contracts/presentation/bloc/contract_bloc.dart';
import 'package:two_dashboard/features/posts/presentation/bloc/post_bloc.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/entity/project_status_model.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/bloc/project_status_team_bloc.dart';
import 'package:two_dashboard/features/roles/data/datasources/role_local_datasource.dart';
import 'package:two_dashboard/features/roles/data/models/role_response_model.dart';
import 'package:two_dashboard/features/services/presentation/bloc/service_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/presentation/bloc/sprint_and_task_bloc.dart';
import 'config/theme/theme_cubit.dart';
import 'injection_container.dart' as di;

import 'config/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();

  // Register adapters
  Hive.registerAdapter(RoleModelAdapter());
  Hive.registerAdapter(ProjectStatusAdapter());

  // Open boxes
  await Hive.openBox<RoleModel>(CACHED_ROLES);

  await Hive.openBox<ProjectStatus>(CACHED_STATUS);
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
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (context) => di.sl<AuthRoleProfileBloc>()),
        BlocProvider(create: (context) => di.sl<ProjectStatusTeamBloc>()),
        BlocProvider(create: (context) => di.sl<SprintAndTaskBloc>()),
        BlocProvider(create: (context) => di.sl<AboutUsWhyUsBloc>()),
        BlocProvider(create: (context) => di.sl<ContactUsBloc>()),
        BlocProvider(create: (context) => di.sl<ContractBloc>()),
        BlocProvider(create: (context) => di.sl<ServiceBloc>()),
        BlocProvider(create: (context) => di.sl<PostBloc>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'TWO',
        theme: AppTheme.getTheme(),
        darkTheme: AppTheme.getDarkTheme(),
        themeMode: ThemeMode.light,
        routerConfig: AppRouter().router,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        builder: (context, child) => child!,
      ),
    );
  }
}
