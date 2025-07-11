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

  // Get Status By Number Or Name
  static ProjectType getProjectTypeByName(String value) {
    if (value.contains("mob") || value.contains("موب")) {
      return ProjectType.mobile;
    } else if (value.contains("web") || value.contains("موق")) {
      return ProjectType.website;
    } else if (value.contains("syst") || value.contains("تحل")) {
      return ProjectType.systemAnalysis;
    } else if (value.contains("soft") || value.contains("اختب")) {
      return ProjectType.softwareTestisng;
    } else {
      return ProjectType.maintain;
    }
  }

  static CooperationType getCooperationTypeByName(String value) {
    if (value.contains("anal") || value.contains("تحل")) {
      return CooperationType.analysis;
    } else if (value.contains("deve") || value.contains("تطو")) {
      return CooperationType.development;
    } else if (value.contains("tes") || value.contains("اختب")) {
      return CooperationType.test;
    } else {
      return CooperationType.managment;
    }
  }

  static WorkStatus getWorkStatusByName(String value) {
    if (value.contains("Pen")) {
      return WorkStatus.pended;
    } else if (value.contains("IN PROGR")) {
      return WorkStatus.inProgress;
    } else if (value.contains("Review")) {
      return WorkStatus.inReview;
    } else if (value.contains("TO D")) {
      return WorkStatus.toDo;
    } else if (value.contains("Done")) {
      return WorkStatus.completed;
    } else {
      return WorkStatus.pended;
    }
  }

  static WorkStatus getWorkStatusByNum(int value) {
    switch (value) {
      case 0:
        return WorkStatus.pended;
      case 1:
        return WorkStatus.toDo;
      case 2:
        return WorkStatus.inProgress;
      case 3:
        return WorkStatus.inReview;
      case 4:
        return WorkStatus.completed;
      case 5:
        return WorkStatus.canceled;
    }
    return WorkStatus.pended;
  }

  static ProjectVisibility getVisibilityByNum(int value) {
    if (value == 0) {
      return ProjectVisibility.public;
    } else {
      return ProjectVisibility.private;
    }
  }

  static int getVisibiltyNum(ProjectVisibility value) {
    if (value == ProjectVisibility.private) {
      return 1;
    } else {
      return 0;
    }
  }

  static Priority getPriorityByName(String value) {
    if (value.contains("Lo")) {
      return Priority.low;
    } else if (value.contains("Mid")) {
      return Priority.medium;
    } else {
      return Priority.high;
    }
  }

  // Project Status Title
  static String getWorkStatusTitle(WorkStatus value) {
    switch (value) {
      case WorkStatus.pended:
        return "Pending";
      case WorkStatus.toDo:
        return "To Do";
      case WorkStatus.inProgress:
        return "In Progress";
      case WorkStatus.inReview:
        return "In Review";
      case WorkStatus.completed:
        return "Completed";
      case WorkStatus.canceled:
        return "Canceled";
    }
  }

  // Project Status Color Returning
  static Color getWorkStatusColor(WorkStatus value) {
    switch (value) {
      case WorkStatus.pended:
        return AppColors.yellowShade2;
      case WorkStatus.toDo:
        return AppColors.rockShade2;
      case WorkStatus.inProgress:
        return AppColors.blueShade2;
      case WorkStatus.inReview:
        return AppColors.redShade2;
      case WorkStatus.completed:
        return AppColors.greenShade2;
      case WorkStatus.canceled:
        return AppColors.redShade2;
    }
  }

  static Color getWorkStatusBackgroundColor(WorkStatus value) {
    switch (value) {
      case WorkStatus.pended:
        return AppColors.yellowShade1;
      case WorkStatus.toDo:
        return AppColors.rockshade1;
      case WorkStatus.inProgress:
        return AppColors.blueShade1;
      case WorkStatus.inReview:
        return AppColors.redShade1;
      case WorkStatus.completed:
        return AppColors.greenShade1;
      case WorkStatus.canceled:
        return AppColors.redShade1;
    }
  }
  // Priority Color Returning

  static Color getPriorityColor(Priority value) {
    switch (value) {
      case Priority.low:
        return AppColors.yellowShade2;
      case Priority.medium:
        return AppColors.blueShade2;
      case Priority.high:
        return AppColors.redShade2;
    }
  }

  static Color getPriorityBackgroundColor(Priority value) {
    switch (value) {
      case Priority.low:
        return AppColors.yellowShade1;
      case Priority.medium:
        return AppColors.blueShade1;
      case Priority.high:
        return AppColors.redShade1;
    }
  }

  // Visibilty
  static Color getVisibiltyColor(ProjectVisibility value) {
    switch (value) {
      case ProjectVisibility.public:
        return AppColors.blueShade2;
      case ProjectVisibility.private:
        return AppColors.redShade2;
    }
  }

  static Color getVisibiltyBackGroundColor(ProjectVisibility value) {
    switch (value) {
      case ProjectVisibility.public:
        return AppColors.blueShade1;
      case ProjectVisibility.private:
        return AppColors.redShade1;
    }
  }

  // Field Status Color Returning

  static Color geFieldStatusColor(FieldStatus value) {
    switch (value) {
      case FieldStatus.active:
        return AppColors.greenShade2;
      case FieldStatus.unActive:
        return AppColors.rockShade2;
      case FieldStatus.approved:
        return AppColors.blueShade2;
      case FieldStatus.unApproved:
        return AppColors.redShade2;
      case FieldStatus.seen:
        return AppColors.blueShade2;
      case FieldStatus.nonSeen:
        return AppColors.yellowShade2;
    }
  }

  static Color getFieldStatusBackgroundColor(FieldStatus value) {
    switch (value) {
      case FieldStatus.active:
        return AppColors.greenShade1;
      case FieldStatus.unActive:
        return AppColors.rockshade1;
      case FieldStatus.approved:
        return AppColors.blueShade1;
      case FieldStatus.unApproved:
        return AppColors.redShade1;
      case FieldStatus.seen:
        return AppColors.blueShade1;
      case FieldStatus.nonSeen:
        return AppColors.yellowShade1;
    }
  }
}
