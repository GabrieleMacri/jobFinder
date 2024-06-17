import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/job_model.dart';

class FeaturedJobWidget extends StatelessWidget {
  FeaturedJobWidget({Key? key, required this.job});

  final JobModel job;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Job details',
      child: Container(
        decoration: BoxDecoration(
          color: job.bannerColor,
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
            image: AssetImage(
              'images/pattern.png',
            ),
            repeat: ImageRepeat.repeat,
          ),
        ),
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  child: Semantics(
                    label: 'Company Icon',
                    child: FaIcon(job.companyIcon),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.all(15),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job.job,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      job.company,
                      style: TextStyle(
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Semantics(
                  label: 'Bookmark',
                  child: Icon(
                    Icons.bookmark_add,
                    color: Colors.grey.shade300,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: [
                _buildJobDetailChip('Design'),
                _buildJobDetailChip('Full-Time'),
                _buildJobDetailChip('Junior'),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  '\$${job.salary.toStringAsFixed(2)}/year',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  'California, USA',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJobDetailChip(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
