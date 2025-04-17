import 'package:flutter/material.dart';

import '../theme/app_svg_images.dart';

enum TaskTypesEnum {
  work,
  personal,
  shopping,
  sport,
  urgent,
}

extension TaskTypeExtension on TaskTypesEnum {
  String get name {
    switch (this) {
      case TaskTypesEnum.work:
        return 'work';
      case TaskTypesEnum.personal:
        return 'personal';
      case TaskTypesEnum.shopping:
        return 'shopping';
      case TaskTypesEnum.sport:
        return 'sport';
      case TaskTypesEnum.urgent:
        return 'urgent';
    }
  }

  Color get color {
    switch (this) {
      case TaskTypesEnum.work:
        return Colors.blue;
      case TaskTypesEnum.personal:
        return Colors.green;
      case TaskTypesEnum.shopping:
        return Colors.orange;
      case TaskTypesEnum.sport:
        return Colors.yellow;
      case TaskTypesEnum.urgent:
        return Colors.red;
    }
  }

  String get iconPath {
    switch (this) {
      case TaskTypesEnum.work:
        return AppSvgImages.iconTaskTypeWork;
      case TaskTypesEnum.personal:
        return AppSvgImages.iconTaskTypePersonal;
      case TaskTypesEnum.shopping:
        return AppSvgImages.iconTaskTypeShopping;
      case TaskTypesEnum.sport:
        return AppSvgImages.iconTaskTypeSport;
      case TaskTypesEnum.urgent:
        return AppSvgImages.iconTaskTypeUrgent;
    }
  }

  static TaskTypesEnum fromString(String type) {
    return TaskTypesEnum.values.firstWhere((e) => e.name == type);
  }
}