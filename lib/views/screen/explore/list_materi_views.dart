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
                  const Spacer(),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
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
                  const SizedBox(width: 8),
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile-pict.jpg'), // Replace with your profile image asset
                    radius: 20,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Exercise title
              const Align(
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
              const SizedBox(height: 16),
              // List of courses
              Expanded(
                child: ListView(
                  children: [
                    CourseCard(
                      title: "Arithmetic Operations",
                      progress: 0.95,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ThirdPage(),
                          ),
                        );
                      },
                    ),
                    CourseCard(
                      title: "Al - Jabr",
                      progress: 0.95,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ThirdPage(),
                          ),
                        );
                      },
                    ),
                    CourseCard(
                      title: "Integers",
                      progress: 0.95,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ThirdPage(),
                          ),
                        );
                      },
                    ),
                    CourseCard(
                      title: "Algebraic Expressions",
                      progress: 0.95,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ThirdPage(),
                          ),
                        );
                      },
                    ),
                    CourseCard(
                      title: "Percentages",
                      progress: 0.95,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ThirdPage(),
                          ),
                        );
                      },
                    ),
                    CourseCard(
                      title: "Algebraic Expressions",
                      progress: 0.95,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ThirdPage(),
                          ),
                        );
                      },
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
  final VoidCallback onTap;

  const CourseCard({
    required this.title,
    required this.progress,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white, // Set the background color to white
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(
            color: Colors.grey.shade300, // Thin border color
            width: 1.0, // Thin border width
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
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
                  style: const TextStyle(
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
      ),
    );
  }
}
