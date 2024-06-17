import 'package:flutter/material.dart';

class JobModel {
  String job;
  String company;
  IconData companyIcon;
  int salary;
  Color bannerColor;

  JobModel({
    required this.job,
    required this.company,
    required this.companyIcon,
    required this.salary,
    required this.bannerColor,
  });
}
