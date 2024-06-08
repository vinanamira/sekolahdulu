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
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeNavbarWidget(),
              ),
            );
          },
        ),
        title: const Text("Lesson"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
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
              title: "Arithmetic Operations",
              progress: 0.95,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThirdPage()),
                );
              },
            ),
            CourseCard(
              title: "Algorithm",
              progress: 0.80,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThirdPage()),
                );
              },
            ),
            CourseCard(
              title: "Al-Jabr",
              progress: 0.70,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThirdPage()),
                );
              },
            ),
            CourseCard(
              title: "Geometry",
              progress: 0.60,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThirdPage()),
                );
              },
            ),
            CourseCard(
              title: "Integers",
              progress: 0.85,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThirdPage()),
                );
              },
            ),
            CourseCard(
              title: "Algebraic",
              progress: 0.90,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThirdPage()),
                );
              },
            ),
            CourseCard(
              title: "Percentages",
              progress: 0.75,
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
  final String title;
  final double progress;
  final VoidCallback? onTap;

  const CourseCard({
    required this.title,
    required this.progress,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.deepPurple, // Warna ungu untuk kartu
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Warna putih untuk teks
                  ),
                ),
              ),
              CircularPercentIndicator(
                radius: 32.0,
                lineWidth: 6.0,
                percent: progress,
                center: Text(
                  "${(progress * 100).toStringAsFixed(1)}%",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                    color: Colors.white, // Warna putih untuk teks indikator
                  ),
                ),
                progressColor: Colors.green,
                backgroundColor:
                    Colors.white24, // Warna latar belakang indikator
              ),
            ],
          ),
        ),
      ),
    );
  }
}
