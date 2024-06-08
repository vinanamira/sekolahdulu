import 'package:flutter/material.dart';
import 'package:assesment2/views/screen/explore/list_materi_views.dart';


class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Today Lessons'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    border: InputBorder.none,
                    hintText: 'Search courses',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text('New Course', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 10),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75, 
                children: [
                  CourseCard(
                    imageUrl: 'assets/images/card1.jpg',
                    title: 'Math',
                    viewers: '71.3K',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LiveCoursesScreen()),
                      );
                    },
                  ),
                  CourseCard(
                    imageUrl: 'assets/images/card2.jpg',
                    title: 'Biology',
                    viewers: '57.3K',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LiveCoursesScreen()),
                      );
                    },
                  ),
                  CourseCard(
                    imageUrl: 'assets/images/card3.jpg',
                    title: 'Physic',
                    viewers: '102.5K',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LiveCoursesScreen()),
                      );
                    },
                  ),
                  CourseCard(
                    imageUrl: 'assets/images/card4.jpg',
                    title: 'Economics',
                    viewers: '85.7K',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LiveCoursesScreen()),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text('Popular Course', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 10),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75, 
                children: [
                  CourseCard(
                    imageUrl: 'assets/images/card1.jpg',
                    title: 'Math',
                    viewers: '120.4K',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LiveCoursesScreen()),
                      );
                    },
                  ),
                  CourseCard(
                    imageUrl: 'assets/images/card2.jpg',
                    title: 'Economics',
                    viewers: '95.3K',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LiveCoursesScreen()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class CourseCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String viewers;
  final VoidCallback onTap;

  const CourseCard({
    required this.imageUrl,
    required this.title,
    required this.viewers,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150.0, 
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '$viewers viewers',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      color: Colors.deepPurple,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward, color: Colors.white),
                      onPressed: onTap,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
    
