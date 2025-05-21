import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/core/network/enums.dart';

class HelperFunctions {
  static String projectDurationText(DateTime startDate, DateTime endDate) {
    final duration = endDate.difference(startDate);

    if (duration.inDays < 0) return "End Date Must Be After The Strating Date.";

    final months = (duration.inDays / 30).floor();
    final days = duration.inDays % 30;

    if (months > 0 && days > 0) {
      return "$months month $days day";
    } else if (months > 0) {
      return "$months month";
    } else {
      return "$days day";
    }
  }

  // Formate Date Time

  static String formatDate(DateTime date) {
    return DateFormat('yyyy/MM/dd').format(date);
  }

  // Get Status By Number
  static TaskStatus getTaskStatusByNum(int value) {
    if (value == 0) {
      return TaskStatus.toDo;
    } else if (value == 1) {
      return TaskStatus.inProgress;
    } else if (value == 2) {
      return TaskStatus.inReview;
    } else if (value == 3) {
      return TaskStatus.completed;
    } else {
      return TaskStatus.canceled;
    }
  }

  static ProjectVisibility getProjectVisibilityByNum(int value) {
    if (value == 0) {
      return ProjectVisibility.public;
    } else {
      return ProjectVisibility.private;
    }
  }

  // Task Status Title
  static String getTaskStatusTitle(TaskStatus value) {
    if (value == TaskStatus.toDo) {
      return "To Do";
    } else if (value == TaskStatus.inProgress) {
      return "In Progress";
    } else if (value == TaskStatus.inReview) {
      return "In Review";
    } else if (value == TaskStatus.completed) {
      return "Completed";
    } else if (value == TaskStatus.canceled) {
      return "Canceled";
    } else {
      return "";
    }
  }

  // Task Status Color Returning
  static Color getTaskStatusColor(TaskStatus value) {
    if (value == TaskStatus.toDo) {
      return AppColors.yellowShade2;
    } else if (value == TaskStatus.inProgress) {
      return AppColors.blueShade2;
    } else if (value == TaskStatus.inReview) {
      return AppColors.rockShade2;
    } else if (value == TaskStatus.completed) {
      return AppColors.greenShade2;
    } else if (value == TaskStatus.canceled) {
      return AppColors.redShade2;
    } else {
      return AppColors.gray;
    }
  }

  static Color getTaskStatusBackgroundColor(TaskStatus value) {
    if (value == TaskStatus.toDo) {
      return AppColors.yellowShade1;
    } else if (value == TaskStatus.inProgress) {
      return AppColors.blueShade1;
    } else if (value == TaskStatus.inReview) {
      return AppColors.rockshade1;
    } else if (value == TaskStatus.completed) {
      return AppColors.greenShade1;
    } else if (value == TaskStatus.canceled) {
      return AppColors.redShade1;
    } else {
      return AppColors.gray;
    }
  }

  // Priority Color Returning

  static Color getPriorityColor(Priority value) {
    if (value == Priority.low) {
      return AppColors.yellowShade2;
    } else if (value == Priority.medium) {
      return AppColors.blueShade2;
    } else if (value == Priority.high) {
      return AppColors.redShade2;
    } else {
      return AppColors.gray;
    }
  }

  static Color getPriorityBackgroundColor(Priority value) {
    if (value == Priority.low) {
      return AppColors.yellowShade1;
    } else if (value == Priority.medium) {
      return AppColors.blueShade1;
    } else if (value == Priority.high) {
      return AppColors.redShade1;
    } else {
      return AppColors.gray;
    }
  }

  // Visibilty
  static Color getVisibiltyColor(ProjectVisibility value) {
    if (value == ProjectVisibility.private) {
      return AppColors.redShade2;
    } else {
      return AppColors.blueShade2;
    }
  }

  static Color getVisibiltyBackGroundColor(ProjectVisibility value) {
    if (value == ProjectVisibility.private) {
      return AppColors.redShade1;
    } else {
      return AppColors.blueShade1;
    }
  }

  static int getVisibiltyNum(ProjectVisibility value) {
    if (value == ProjectVisibility.private) {
      return 1;
    } else {
      return 0;
    }
  }

  // Field Status Color Returning

  static Color geFieldStatusColor(FieldStatus value) {
    if (value == FieldStatus.active) {
      return AppColors.greenShade2;
    } else if (value == FieldStatus.unActive) {
      return AppColors.rockShade2;
    } else if (value == FieldStatus.approved) {
      return AppColors.blueShade2;
    } else if (value == FieldStatus.unApproved) {
      return AppColors.redShade2;
    } else if (value == FieldStatus.seen) {
      return AppColors.blueShade2;
    } else if (value == FieldStatus.nonSeen) {
      return AppColors.yellowShade2;
    } else {
      return AppColors.gray;
    }
  }

  static Color getFieldStatusBackgroundColor(FieldStatus value) {
    if (value == FieldStatus.active) {
      return AppColors.greenShade1;
    } else if (value == FieldStatus.unActive) {
      return AppColors.rockshade1;
    } else if (value == FieldStatus.approved) {
      return AppColors.blueShade1;
    } else if (value == FieldStatus.unApproved) {
      return AppColors.redShade1;
    } else if (value == FieldStatus.seen) {
      return AppColors.blueShade1;
    } else if (value == FieldStatus.nonSeen) {
      return AppColors.yellowShade1;
    } else {
      return AppColors.gray;
    }
  }
}
