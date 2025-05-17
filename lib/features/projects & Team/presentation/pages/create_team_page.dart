import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/widgets/images/fetch_network_image.dart';
import 'package:two_dashboard/features/auth/presentation/bloc/auth_role_profile_bloc.dart';

import '../../../profile/domain/entities/employee_entity.dart';
import '../../../roles/data/models/role_response_model.dart';

class CreateTeamPage extends StatefulWidget {
  const CreateTeamPage({super.key});

  @override
  State<CreateTeamPage> createState() => _CreateTeamPageState();
}

class _CreateTeamPageState extends State<CreateTeamPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  List<RoleModel> jobList = []; // جاي من bloc لاحقاً
  List<EmployeeEntity> selectedEmployees = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create New Team")),
      body: Column(
        children: [
          /// ✅ صندوق الأعضاء المختارين
          if (selectedEmployees.isNotEmpty)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              color: Colors.grey.shade100,
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children:
                    selectedEmployees.map((emp) {
                      return Chip(
                        avatar: CircleAvatar(
                          backgroundImage:
                              emp.eImage != null
                                  ? NetworkImage(emp.eImage!)
                                  : null,
                          child: emp.eImage == null ? Icon(Icons.person) : null,
                        ),
                        label: Text(emp.eName),
                        onDeleted: () {
                          setState(() => selectedEmployees.remove(emp));
                        },
                      );
                    }).toList(),
              ),
            ),

          /// ✅ التبويبات الديناميكية للوظائف
          BlocBuilder<AuthRoleProfileBloc, AuthRoleProfileState>(
            buildWhen:
                (previous, current) =>
                    previous.roleListStatus != current.roleListStatus,
            builder: (context, state) {
              if (state.roleListStatus == CasualStatus.success) {
                jobList = state.roleList;

                // 👇 إنشاء TabController مرة وحدة بس
                _tabController = TabController(
                  length: jobList.length,
                  vsync: this,
                );

                // 👇 إرسال الحدث فقط أول مرة لما يتم تحميل الوظائف
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  context.read<AuthRoleProfileBloc>().add(
                    ShowUsersWithFilterEvent(roleFilter: jobList.first.id),
                  );
                });

                return Column(
                  children: [
                    TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: Theme.of(context).primaryColor,
                      tabs: jobList.map((job) => Tab(text: job.role)).toList(),
                      onTap: (index) {
                        context.read<AuthRoleProfileBloc>().add(
                          ShowUsersWithFilterEvent(
                            roleFilter: jobList[index].id,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 8),

                    /// ✅ تبويبة الموظفين
                    BlocBuilder<AuthRoleProfileBloc, AuthRoleProfileState>(
                      buildWhen:
                          (previous, current) =>
                              previous.userListStatus != current.userListStatus,

                      builder: (context, state) {
                        if (state.userListStatus == CasualStatus.success) {
                          final employees = state.userList;

                          return Expanded(
                            child: ListView.builder(
                              itemCount: employees.length,
                              itemBuilder: (context, index) {
                                final emp = employees[index];
                                final isSelected = selectedEmployees.contains(
                                  emp,
                                );

                                return ListTile(
                                  leading: FetchNetworkImage(
                                    imagePath: emp.eImage,
                                  ),
                                  title: Text(emp.eName),
                                  subtitle: Text(emp.eRole),
                                  trailing: Checkbox(
                                    value: isSelected,
                                    onChanged: (val) {
                                      setState(() {
                                        if (val == true) {
                                          selectedEmployees.add(emp);
                                        } else {
                                          selectedEmployees.remove(emp);
                                        }
                                      });
                                    },
                                  ),
                                );
                              },
                            ),
                          );
                        } else if (state.userListStatus ==
                            CasualStatus.loading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return const Text("No employees found");
                        }
                      },
                    ),
                  ],
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
