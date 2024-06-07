import 'package:flutter/material.dart';
import 'package:assesment2/views/screen/materi/materi_views.dart';
import 'package:assesment2/views/screen/explore/explore_views.dart';

class LiveCoursesScreen extends StatefulWidget {
  @override
  _LiveCoursesScreenState createState() => _LiveCoursesScreenState();
}

class _LiveCoursesScreenState extends State<LiveCoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ExploreScreen()), 
            );
          },
        ),
        title: const Text("Lesson"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Today's Exercise",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            CourseCard(
              teacher: "Hanna Rose",
              title: "Arithmetic Operations",
              time: "09-09 9:00 am",
              image: "assets/images/directions.jpg",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThirdPage()), 
                );
              },
            ),
            CourseCard(
              teacher: "Hanna Rose",
              title: "Alghorithm",
              time: "10:30 - 11:30 am",
              image: "assets/images/directions.jpg",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThirdPage()), 
                );
              },
            ),
            CourseCard(
              teacher: "Hanna Rose",
              title: "Al-Jabr",
              time: "10:30 - 11:30 am",
              image: "assets/images/directions.jpg",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThirdPage()), 
                );
              },
            ),
            CourseCard(
              teacher: "Hanna Rose",
              title: "Geometry",
              time: "10:30 - 11:30 am",
              image: "assets/images/directions.jpg",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThirdPage()), 
                );
              },
            ),
            CourseCard(
              teacher: "Hanna Rose",
              title: "Integers",
              time: "10:30 - 11:30 am",
              image: "assets/images/directions.jpg",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThirdPage()), 
                );
              },
            ),
            CourseCard(
              teacher: "Hanna Rose",
              title: "Algebraic",
              time: "10:30 - 11:30 am",
              image: "assets/images/directions.jpg",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThirdPage()), 
                );
              },
            ),
            CourseCard(
              teacher: "Hanna Rose",
              title: "Percentages",
              time: "10:30 - 11:30 am",
              image: "assets/images/directions.jpg",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThirdPage()), 
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String teacher;
  final String title;
  final String time;
  final String image;
  final VoidCallback? onTap;

  const CourseCard({
    required this.teacher,
    required this.title,
    required this.time,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Icon(
                  Icons.bookmark,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
