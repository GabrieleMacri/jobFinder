import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/job_model.dart';

class RecomendedJobWidget extends StatelessWidget {
  const RecomendedJobWidget({Key? key, required this.job});

  final JobModel job;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Recommended job information',
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Semantics(
              label: 'Company Icon',
              child: FaIcon(
                job.companyIcon,
                size: 50,
                semanticsLabel: 'Company Icon',
              ),
            ),
            Text(
              job.job,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              job.company,
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
            Text(
              '\$${job.salary.toStringAsFixed(2)}/year',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: 150,
        decoration: BoxDecoration(
          color: job.bannerColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
