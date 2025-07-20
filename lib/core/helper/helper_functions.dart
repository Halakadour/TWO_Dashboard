import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/core/network/enums.dart';

class HelperFunctions {
  static String getDurationText(DateTime startDate, DateTime endDate) {
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

  static TaskStatus getWorkStatusByName(String value) {
    if (value.contains("Pen")) {
      return TaskStatus.pended;
    } else if (value.contains("IN PROGR")) {
      return TaskStatus.inProgress;
    } else if (value.contains("Review")) {
      return TaskStatus.inReview;
    } else if (value.contains("TO D")) {
      return TaskStatus.toDo;
    } else if (value.contains("Done")) {
      return TaskStatus.completed;
    } else {
      return TaskStatus.pended;
    }
  }

  static TaskStatus getWorkStatusByNum(int value) {
    switch (value) {
      case 0:
        return TaskStatus.pended;
      case 1:
        return TaskStatus.toDo;
      case 2:
        return TaskStatus.inProgress;
      case 3:
        return TaskStatus.inReview;
      case 4:
        return TaskStatus.completed;
      case 5:
        return TaskStatus.canceled;
    }
    return TaskStatus.pended;
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

  static TaskPriority getPriorityByName(String value) {
    if (value.contains("Lo")) {
      return TaskPriority.low;
    } else if (value.contains("Mid")) {
      return TaskPriority.medium;
    } else {
      return TaskPriority.high;
    }
  }

  // Project Status Title
  static String getWorkStatusTitle(TaskStatus value) {
    switch (value) {
      case TaskStatus.pended:
        return "Pending";
      case TaskStatus.toDo:
        return "To Do";
      case TaskStatus.inProgress:
        return "In Progress";
      case TaskStatus.inReview:
        return "In Review";
      case TaskStatus.completed:
        return "Completed";
      case TaskStatus.canceled:
        return "Canceled";
    }
  }

  //////// **************** COLORS **************** ////////

  // Project Type Color Returning
  static Color getProjectTypeColor(ProjectType value) {
    switch (value) {
      case ProjectType.mobile:
        return AppColors.blueShade2;
      case ProjectType.maintain:
        return AppColors.yellowShade2;
      case ProjectType.website:
        return AppColors.greenShade2;
      case ProjectType.softwareTestisng:
        return AppColors.redShade2;
      case ProjectType.systemAnalysis:
        return AppColors.rockShade2;
    }
  }

  static Color getProjectTypeBackgroundColor(ProjectType value) {
    switch (value) {
      case ProjectType.mobile:
        return AppColors.blueShade1;
      case ProjectType.maintain:
        return AppColors.yellowShade1;
      case ProjectType.website:
        return AppColors.greenShade1;
      case ProjectType.softwareTestisng:
        return AppColors.redShade1;
      case ProjectType.systemAnalysis:
        return AppColors.rockshade1;
    }
  }

  // Project Status Color Returning
  static Color getWorkStatusColor(TaskStatus value) {
    switch (value) {
      case TaskStatus.pended:
        return AppColors.yellowShade2;
      case TaskStatus.toDo:
        return AppColors.rockShade2;
      case TaskStatus.inProgress:
        return AppColors.blueShade2;
      case TaskStatus.inReview:
        return AppColors.redShade2;
      case TaskStatus.completed:
        return AppColors.greenShade2;
      case TaskStatus.canceled:
        return AppColors.redShade2;
    }
  }

  static Color getWorkStatusBackgroundColor(TaskStatus value) {
    switch (value) {
      case TaskStatus.pended:
        return AppColors.yellowShade1;
      case TaskStatus.toDo:
        return AppColors.rockshade1;
      case TaskStatus.inProgress:
        return AppColors.blueShade1;
      case TaskStatus.inReview:
        return AppColors.redShade1;
      case TaskStatus.completed:
        return AppColors.greenShade1;
      case TaskStatus.canceled:
        return AppColors.redShade1;
    }
  }
  // Priority Color Returning

  static Color getPriorityColor(TaskPriority value) {
    switch (value) {
      case TaskPriority.low:
        return AppColors.yellowShade2;
      case TaskPriority.medium:
        return AppColors.blueShade2;
      case TaskPriority.high:
        return AppColors.redShade2;
    }
  }

  static Color getPriorityBackgroundColor(TaskPriority value) {
    switch (value) {
      case TaskPriority.low:
        return AppColors.yellowShade1;
      case TaskPriority.medium:
        return AppColors.blueShade1;
      case TaskPriority.high:
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

  // Cooperation Type Color Returning
  static Color getCooperationTypeColor(CooperationType value) {
    switch (value) {
      case CooperationType.analysis:
        return AppColors.blueShade2;
      case CooperationType.development:
        return AppColors.greenShade2;
      case CooperationType.managment:
        return Colors.orange;
      case CooperationType.test:
        return Colors.purple;
    }
  }

  static Color getCooperationTypeBackgroundColor(CooperationType value) {
    switch (value) {
      case CooperationType.analysis:
        return AppColors.blueShade1;
      case CooperationType.development:
        return AppColors.greenShade1;
      case CooperationType.managment:
        return Colors.orange.shade100;
      case CooperationType.test:
        return Colors.purple.shade100;
    }
  }
}
