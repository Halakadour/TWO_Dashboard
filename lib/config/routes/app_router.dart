import 'package:go_router/go_router.dart';
import 'package:two_dashboard/config/routes/app_route_config.dart';
import 'package:two_dashboard/features/about-us%20&%20why-us/presentation/pages/about_us_why_us_page.dart';
import 'package:two_dashboard/features/auth/presentation/pages/fill-profile/fill_employee_profile_page.dart';
import 'package:two_dashboard/features/auth/presentation/pages/login/login_page.dart';
import 'package:two_dashboard/features/auth/presentation/pages/sign-up/sign_up_page.dart';
import 'package:two_dashboard/features/calendar/presentation/pages/calender_page.dart';
import 'package:two_dashboard/features/contact-us/presentation/pages/contact_us_page.dart';
import 'package:two_dashboard/features/contracts/presentation/pages/signature_board_page.dart';
import 'package:two_dashboard/features/contracts/presentation/pages/contracts_page.dart';
import 'package:two_dashboard/features/contracts/presentation/pages/create-contract/create_contract_page.dart';
import 'package:two_dashboard/features/contracts/presentation/pages/create_draft_page.dart';
import 'package:two_dashboard/features/contracts/presentation/pages/drafts_page.dart';
import 'package:two_dashboard/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:two_dashboard/features/inbox/presentation/pages/inbox_page.dart';
import 'package:two_dashboard/features/projects%20&%20team/presentation/pages/create_project_page.dart';
import 'package:two_dashboard/features/projects%20&%20team/presentation/pages/create_team_page.dart';
import 'package:two_dashboard/features/projects%20&%20team/presentation/pages/projects_page.dart';
import 'package:two_dashboard/features/projects%20&%20team/presentation/pages/select_team_page.dart';
import 'package:two_dashboard/features/services/presentation/pages/update-service/update_service_page.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/presentation/pages/task_page.dart';
import 'package:two_dashboard/root_page.dart';
import 'package:two_dashboard/features/posts/presentation/pages/create-post/create_post_page.dart';
import 'package:two_dashboard/features/posts/presentation/pages/post_replies_page.dart';
import 'package:two_dashboard/features/posts/presentation/pages/posts_page.dart';
import 'package:two_dashboard/features/profile/presentation/pages/accounts_page.dart';
import 'package:two_dashboard/features/profile/presentation/pages/setting_page.dart';
import 'package:two_dashboard/features/services/presentation/pages/create-service/create_service_page.dart';
import 'package:two_dashboard/features/services/presentation/pages/services_page.dart';

class AppRouter {
  GoRouter router = GoRouter(
    initialLocation: '/login',
    routes: [
      // AUTH PAGES
      GoRoute(
        name: AppRouteConfig.login,
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: AppRouteConfig.signup,
        path: '/signup',
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        name: AppRouteConfig.fillEmployeeProfile,
        path: '/fillEmployeeProfile',
        builder: (context, state) => const FillEmployeeProfilePage(),
      ),
      // MAIN WEB APP PAGES
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => RootPage(shell: shell),
        branches: [
          // Dashboard Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouteConfig.dashboard,
                path: '/dashboard',
                builder: (context, state) => const DashboardPage(),
              ),
            ],
          ),
          // Tasks Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouteConfig.tasks,
                path: '/tasks',
                builder: (context, state) => const TaskPage(),
              ),
            ],
          ),
          // Projects Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouteConfig.projects,
                path: '/projects',
                builder: (context, state) => const ProjectPage(),
              ),
              GoRoute(
                name: AppRouteConfig.createProject,
                path: '/createProject',
                builder: (context, state) => const CreateProjectPage(),
              ),
              GoRoute(
                name: AppRouteConfig.selectTeam,
                path: '/selectTeam/:id',
                builder:
                    (context, state) => SelectTeamPage(
                      projectId: state.pathParameters['id'] ?? '',
                    ),
              ),
              GoRoute(
                name: AppRouteConfig.createTeam,
                path: '/createTeam',
                builder: (context, state) => const CreateTeamPage(),
              ),
            ],
          ),
          // Calendar Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouteConfig.calendar,
                path: '/calendar',
                builder: (context, state) => CalendarPage(),
              ),
            ],
          ),
          // Inbox Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouteConfig.inbox,
                path: '/inbox',
                builder: (context, state) => const InboxPage(),
              ),
            ],
          ),
          // Acounts Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouteConfig.acounts,
                path: '/acounts',
                builder: (context, state) => const AccountsPage(),
              ),
            ],
          ),
          // Contracts Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouteConfig.contracts,
                path: '/contracts',
                builder: (context, state) => const ContractsPage(),
              ),
              GoRoute(
                name: AppRouteConfig.createContract,
                path: '/createContracts',
                builder: (context, state) => const CreateContractPage(),
              ),
              GoRoute(
                name: AppRouteConfig.addSign,
                path: '/addSign/:id',
                builder:
                    (context, state) => SignatureBoardPage(
                      id: state.pathParameters['id'] ?? '',
                    ),
              ),
            ],
          ),
          // Drafts Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouteConfig.drafts,
                path: '/drafts',
                builder: (context, state) => const DraftsPage(),
              ),
              GoRoute(
                name: AppRouteConfig.createDraft,
                path: '/createDraft',
                builder: (context, state) => CreateDraftPage(),
              ),
            ],
          ),
          // About Us Why Us Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouteConfig.aboutUsWhyUs,
                path: '/aboutUsWhyUs',
                builder: (context, state) => const AboutUsWhyUsPage(),
              ),
            ],
          ),
          // Service Branch
          StatefulShellBranch(
            routes: [
              // services page
              GoRoute(
                name: AppRouteConfig.services,
                path: '/services',
                builder: (context, state) => const ServicesPage(),
              ),
              // create service page
              GoRoute(
                name: AppRouteConfig.createService,
                path: '/services/createService',
                builder: (context, state) => const CreateServicePage(),
              ),
              // update service page
              GoRoute(
                name: AppRouteConfig.updateService,
                path: '/posts/updateService/:id/:title/:description/:image',
                builder:
                    (context, state) => UpdateServicePage(
                      id: state.pathParameters['id'] ?? '',
                      title: state.pathParameters['title'] ?? '',
                      description: state.pathParameters['description'] ?? '',
                      image: state.pathParameters['image'] ?? '',
                    ),
              ),
            ],
          ),
          // Posts Branch
          StatefulShellBranch(
            routes: [
              // posts page
              GoRoute(
                name: AppRouteConfig.post,
                path: '/posts',
                builder: (context, state) => const PostsPage(),
              ),
              // create post page
              GoRoute(
                name: AppRouteConfig.createPost,
                path: '/posts/createPost',
                builder: (context, state) => const CreatePostPage(),
              ),
              // post replies page
              GoRoute(
                name: AppRouteConfig.postReplies,
                path: '/posts/postReplies/:id',
                builder:
                    (context, state) => PostRepliesPage(
                      postId: state.pathParameters['id'] ?? '',
                    ),
              ),
            ],
          ),
          // Contact Us Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouteConfig.contactUs,
                path: '/contactUs',
                builder: (context, state) => const ContactUsPage(),
              ),
            ],
          ),
          // Setting Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouteConfig.settings,
                path: '/settings',
                builder: (context, state) => const SettingPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
