import 'package:go_router/go_router.dart';
import 'package:two_dashboard/config/routes/app_route_config.dart';
import 'package:two_dashboard/core/param/task_param.dart';
import 'package:two_dashboard/features/about-us%20&%20why-us/presentation/pages/about_us_why_us_page.dart';
import 'package:two_dashboard/features/auth/presentation/pages/fill-profile/fill_employee_profile_page.dart';
import 'package:two_dashboard/features/auth/presentation/pages/login/login_page.dart';
import 'package:two_dashboard/features/auth/presentation/pages/sign-up/sign_up_page.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/data/models/project/team.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/entity/project_entity.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/pages/my_projects_page.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/pages/pended_projects_page.dart';
import 'package:two_dashboard/features/contracts/presentation/pages/signature_board_page.dart';
import 'package:two_dashboard/features/contracts/presentation/pages/contracts_page.dart';
import 'package:two_dashboard/features/contracts/presentation/pages/create-contract/create_contract_page.dart';
import 'package:two_dashboard/features/contracts/presentation/pages/create_draft_page.dart';
import 'package:two_dashboard/features/contracts/presentation/pages/drafts_page.dart';
import 'package:two_dashboard/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/pages/create_team_page.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/pages/all_projects_page.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/pages/project_details_page.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/pages/select_team_page.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/pages/update_project_page.dart';
import 'package:two_dashboard/features/services/presentation/pages/update-service/update_service_page.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/entity/sprint_entity.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/entity/task_entity.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/presentation/pages/create_sprint_page.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/presentation/pages/create_task_page.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/presentation/pages/sprint_details_page.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/presentation/pages/task_details_page.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/presentation/pages/update_sprint_page.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/presentation/pages/update_task_page.dart';
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
          // All Projects Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouteConfig.allProjects,
                path: '/allProjects',
                builder: (context, state) => const AllProjectPage(),
              ),
              GoRoute(
                name: AppRouteConfig.projectDetails,
                path: '/projectDetails',
                builder:
                    (context, state) => ProjectDetailsPage(
                      projectEntity: state.extra! as ProjectEntity,
                    ),
              ),
              GoRoute(
                name: AppRouteConfig.updateProject,
                path: '/updateProject',
                builder:
                    (context, state) => UpdateProjectPage(
                      projectEntity: state.extra! as ProjectEntity,
                    ),
              ),
              GoRoute(
                name: AppRouteConfig.createSprint,
                path: '/createSprint/:projectId',
                builder:
                    (context, state) => CreateSprintPage(
                      projectId: state.pathParameters['projectId'] ?? '',
                    ),
              ),
              GoRoute(
                name: AppRouteConfig.createTask,
                path: '/createTask/:projectId/:sprintId',
                builder:
                    (context, state) => CreateTaskPage(
                      projectTeam: state.extra as Team,
                      projectId: state.pathParameters['projectId'] ?? '',
                      sprintId: state.pathParameters['sprintId'] ?? '',
                    ),
              ),
              GoRoute(
                name: AppRouteConfig.updateSprint,
                path: '/updateSprint/:projectId',
                builder:
                    (context, state) => UpdateSprintPage(
                      sprintEntity: state.extra as SprintEntity,
                      projectId: state.pathParameters['projectId'] ?? '',
                    ),
              ),
              GoRoute(
                name: AppRouteConfig.updateTask,
                path: '/updateTask/:projectId/:sprintId',
                builder:
                    (context, state) => UpdateTaskPage(
                      taskEntityAndTeam: state.extra as UpdateTaskPageParam,
                      projectId: state.pathParameters['projectId'] ?? '',
                      sprintId: state.pathParameters['sprintId'] ?? '',
                    ),
              ),
              GoRoute(
                name: AppRouteConfig.sprintDetails,
                path: '/sprintDetails',
                builder:
                    (context, state) => SprintDetailsPage(
                      sprintEntity: state.extra as SprintEntity,
                    ),
              ),
              GoRoute(
                name: AppRouteConfig.taskDetails,
                path: '/taskDetails',
                builder:
                    (context, state) =>
                        TaskDetailsPage(taskEntity: state.error as TaskEntity),
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
          // My Project Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouteConfig.myProjects,
                path: '/myProjects',
                builder: (context, state) => const MyProjectsPage(),
              ),
            ],
          ),
          // Pended Project Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouteConfig.pendedProjects,
                path: '/pendedProjects',
                builder: (context, state) => const PendedProjectsPage(),
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
