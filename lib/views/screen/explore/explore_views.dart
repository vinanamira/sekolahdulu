import 'package:flutter/material.dart';
import 'package:assesment2/views/screen/materi/list_materi_views.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 64.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Vina',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      '17 y.o / 12th Grade',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
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
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            margin: const EdgeInsets.only(bottom: 72),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Today Lessons',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
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
                // Text('New Course', style: Theme.of(context).textTheme.titleLarge),
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
                          MaterialPageRoute(
                              builder: (context) => const LiveCoursesScreen()),
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
                          MaterialPageRoute(
                              builder: (context) => const LiveCoursesScreen()),
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
                          MaterialPageRoute(
                              builder: (context) => const LiveCoursesScreen()),
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
                          MaterialPageRoute(
                              builder: (context) => const LiveCoursesScreen()),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text('Popular Course',
                    style: Theme.of(context).textTheme.titleLarge),
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
                          MaterialPageRoute(
                              builder: (context) => const LiveCoursesScreen()),
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
                          MaterialPageRoute(
                              builder: (context) => const LiveCoursesScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
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
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8.0)),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150.0,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
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
                      icon:
                          const Icon(Icons.arrow_forward, color: Colors.white),
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
