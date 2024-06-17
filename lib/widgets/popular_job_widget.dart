import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/job_model.dart';

class PopularJobWidget extends StatelessWidget {
  const PopularJobWidget({Key? key, required this.job}) : super(key: key);

  final JobModel job;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Job information',
      child: Container(
        child: Row(
          children: [
            Semantics(
              label: 'Company icon',
              child: FaIcon(
                job.companyIcon,
                size: 45,
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Semantics(
                    label: 'Job title',
                    child: Text(
                      job.job,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Semantics(
                    label: 'Company name',
                    child: Text(
                      job.company,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Semantics(
                  label: 'Salary',
                  child: Text(
                    '\$${job.salary.toStringAsFixed(2)}/y',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Semantics(
                  label: 'Location',
                  child: Text(
                    'Los Angeles, US',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(right: 20, left: 20, bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
