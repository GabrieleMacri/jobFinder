import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/job_model.dart';
import '../widgets/featured_job_widget.dart';
import '../widgets/popular_job_widget.dart';
import '../widgets/recommended_job_widget.dart';
import 'job_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<JobModel> jobsList = [
    JobModel(
      job: 'Product Manager',
      company: 'Google',
      companyIcon: FontAwesomeIcons.google,
      salary: 160,
      bannerColor: Colors.red,
    ),
    JobModel(
      job: 'UI Designer',
      company: 'Dribbble',
      companyIcon: FontAwesomeIcons.dribbble,
      salary: 100,
      bannerColor: Colors.green,
    ),
    JobModel(
      job: 'Front-end Developer',
      company: 'Shopify',
      companyIcon: FontAwesomeIcons.shopify,
      salary: 80,
      bannerColor: Colors.purple,
    ),
    JobModel(
      job: 'Back-end Developer',
      company: 'Telegram',
      companyIcon: FontAwesomeIcons.telegram,
      salary: 96,
      bannerColor: Colors.black,
    ),
    JobModel(
      job: 'DevOps Engineer',
      company: 'Spotify',
      companyIcon: FontAwesomeIcons.spotify,
      salary: 73,
      bannerColor: Colors.pink,
    ),
    JobModel(
      job: 'Game Developer',
      company: 'XBOX',
      companyIcon: FontAwesomeIcons.xbox,
      salary: 200,
      bannerColor: Colors.blueGrey,
    ),
  ];

  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(viewportFraction: 0.97);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        color: Colors.white,
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, semanticLabel: 'Home'), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.mail_outlined, semanticLabel: 'Messages'), label: 'Messages'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_outline, semanticLabel: 'Bookmarks'), label: 'Bookmarks'),
            BottomNavigationBarItem(
                icon: Icon(Icons.widgets_outlined, semanticLabel: 'Widgets'), label: 'Widgets'),
          ],
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey.shade400,
          selectedItemColor: Colors.green,
          currentIndex: selectedItem,
          iconSize: 30,
          backgroundColor: Colors.white,
          elevation: 0,
          onTap: (value) {
            setState(() {
              selectedItem = value;
            });
          },
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(top: 50),
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Welcome Back!',
                              style: TextStyle(
                                color: Colors.black, // Change to black for contrast
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Rifat Sarkar 👋',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                              ),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        Container(
                          child: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(8),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search a job or position',
                                border: InputBorder.none,
                                icon: Icon(Iconsax.search_normal),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: EdgeInsets.only(left: 20),
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          child: Icon(
                            Icons.tune,
                          ),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                          'Featured Jobs',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'See all',
                          style: TextStyle(
                            color: Colors.green, // Change for better contrast
                            fontSize: 14,
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 200,
                    child: PageView.builder(
                      controller: controller,
                      itemCount: jobsList.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    JobScreen(job: jobsList[index]),
                              ));
                        },
                        child: FeaturedJobWidget(
                          job: jobsList[index],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SmoothPageIndicator(
                    controller: controller,
                    count: jobsList.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Colors.green,
                      dotWidth: 10,
                      dotHeight: 10,
                      dotColor: Colors.grey.shade300,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Text(
                    'Popular Jobs',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: Colors.green, // Change for better contrast
                      fontSize: 14,
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
          ),
          SliverList.builder(
            itemCount: jobsList.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JobScreen(job: jobsList[index]),
                    ));
              },
              child: PopularJobWidget(job: jobsList[index]),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Text(
                    'Recommended Jobs',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: Colors.green, // Change for better contrast
                      fontSize: 14,
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: jobsList.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JobScreen(job: jobsList[index]),
                        ));
                  },
                  child: RecomendedJobWidget(job: jobsList[index]),
                ),
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 40),
          ),
        ],
      ),
    );
  }
}
