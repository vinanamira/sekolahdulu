import 'package:assesment2/views/widgets/home_navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:assesment2/views/screen/materi/materi_views.dart';
import 'package:assesment2/views/screen/explore/explore_views.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LiveCoursesScreen extends StatefulWidget {
  @override
  _LiveCoursesScreenState createState() => _LiveCoursesScreenState();
}

class _LiveCoursesScreenState extends State<LiveCoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile and back button section
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        'Kevin Anggara',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '18 y.o / SMA',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 8),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile-pict.jpg'), // Replace with your profile image asset
                    radius: 20,
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Exercise title
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your exercise',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 61, 7, 109),
                  ),
                ),
              ),
              SizedBox(height: 16),
              // List of courses
              Expanded(
                child: ListView(
                  children: [
                    CourseCard(
                      title: "Oral Communication",
                      progress: 0.95,
                    ),
                    CourseCard(
                      title: "Listening",
                      progress: 0.95,
                    ),
                    CourseCard(
                      title: "Reading",
                      progress: 0.95,
                    ),
                    CourseCard(
                      title: "Writing Texts",
                      progress: 0.95,
                    ),
                    CourseCard(
                      title: "Grammar",
                      progress: 0.95,
                    ),
                    CourseCard(
                      title: "Integrated English",
                      progress: 0.95,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final double progress;

  const CourseCard({
    required this.title,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white, // Set the background color to white
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(
          color: Colors.grey.shade300, // Thin border color
          width: 1.0, // Thin border width
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 69, 20, 128),
              ),
            ),
            CircularPercentIndicator(
              radius: 30.0,
              lineWidth: 6.0,
              percent: progress,
              center: Text(
                "${(progress * 100).toStringAsFixed(0)}%",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color: Colors.green,
                ),
              ),
              progressColor: Colors.green,
              backgroundColor: Colors.grey.shade200,
            ),
          ],
        ),
      ),
    );
  }
}
