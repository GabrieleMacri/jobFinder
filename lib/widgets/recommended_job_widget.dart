import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter';

import '../models/job_model.dart';

class RecomendedJobWidget extends StatelessWidget {
  const RecomendedJobWidget({Key? key, required this.job});

  final JobModel job;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Recommended job information',
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Semantics(
              label: 'Company Icon',
              child: FaIcon(
                job.companyIcon,
                size: 50,
                semanticLabel: 'Company icon ${job.company}',
              ),
            ),
            Text(
              job.job,
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            Text(
              job.company,
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
            Text(
              '\$${job.salary.toStringAsFixed(2)}/y',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
