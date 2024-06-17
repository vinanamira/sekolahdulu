import 'package:sekolahdulu/views/screen/explore/explore_views.dart';
import 'package:sekolahdulu/views/widgets/home_navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:sekolahdulu/views/screen/materi/materi_views.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LiveCoursesScreen extends StatefulWidget {
  const LiveCoursesScreen({super.key});

  @override
  State<LiveCoursesScreen> createState() => _LiveCoursesScreenState();
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeNavbarWidget(
                            isFromHome: true,
                          ),
                        ),
                      );
                    },
                  ),
                  const Spacer(),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Vina',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '17 y.o / 12th grade',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/profile-pict.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Exercise title
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your Exercise',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
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
                            builder: (context) => const ThirdPage(
                              title: 'Simplifying of Algebraic',
                              index: 0,
                            ),
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
                            builder: (context) => const ThirdPage(
                              title: 'Simplifying of Algebraic',
                              index: 0,
                            ),
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
                            builder: (context) => const ThirdPage(
                              title: 'Simplifying of Algebraic',
                              index: 0,
                            ),
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
                            builder: (context) => const ThirdPage(
                              title: 'Simplifying of Algebraic',
                              index: 0,
                            ),
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
                            builder: (context) => const ThirdPage(
                              title: 'Simplifying of Algebraic',
                              index: 0,
                            ),
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
                            builder: (context) => const ThirdPage(
                              title: 'Simplifying of Algebraic',
                              index: 0,
                            ),
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
    super.key,
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
