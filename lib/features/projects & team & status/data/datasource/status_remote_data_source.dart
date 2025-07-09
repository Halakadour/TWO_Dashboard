import 'package:two_dashboard/core/models/empty_response_model.dart';
import 'package:two_dashboard/core/param/casule_param.dart';
import 'package:two_dashboard/core/param/status_param.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/data/models/status/create_project_status_response_model.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/data/models/status/show_project_status_response_model.dart';

abstract class StatusRemoteDataSource {
  // craete status
  Future<CreateProjectStatusResponseModel> createStatus(
    CreateStatusParam param,
  );
  // delete status
  Future<EmptyResponseModel> deleteStatus(DeleteStatusParam param);
  // update order
  Future<EmptyResponseModel> updateStatusOrder(UpdateStatusOrderParam param);

  // get status
  Future<ShowProjectStatusResponseModel> showStatus(TokenWithIdParam project);
}
