import 'package:flutter/material.dart';

class GroupModel {
  final String name;
  final int members;
  final IconData icon;
  final List<Color> gradient;

  GroupModel({
    required this.name,
    required this.members,
    required this.icon,
    required this.gradient,
  });
}


class GroupTypeModel {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final Color bgColor;

  GroupTypeModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
  });
}
