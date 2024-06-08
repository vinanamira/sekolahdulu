import 'package:flutter/material.dart';
import 'package:assesment2/views/screen/materi/materi_views.dart';
import 'package:assesment2/views/widgets/home_navbar_widget.dart';

void main() {
  runApp(CourseScreen());
}

class CourseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ThirdPage()), 
            );
          },
        ),
        title: Text(''),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Skip',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearProgressIndicator(
                value: 0.75,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('4 sec', style: TextStyle(fontSize: 16)),
                  Icon(Icons.timer),
                ],
              ),
              SizedBox(height: 30),
              Text(
                'Question 4/4',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '1x1 = ?',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 20),
                      OptionButton(option: '1. 5'),
                      OptionButton(option: '2. 7'),
                      OptionButton(option: '3. 1'),
                      OptionButton(option: '4. 7'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16.0),
                child: GridView.count(
                  crossAxisCount: 5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  shrinkWrap: true,
                  children: List.generate(20, (index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Logika untuk menangani tombol submit
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple, // Warna ungu
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 16, color: Colors.white), // Ubah warna teks menjadi putih
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      
    );
  }
}

class OptionButton extends StatelessWidget {
  final String option;

  OptionButton({required this.option});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: const Color.fromARGB(255, 65, 62, 62),
          backgroundColor: Colors.white,
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.grey),
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(option, style: TextStyle(fontSize: 16)),
            Icon(Icons.radio_button_unchecked),
          ],
        ),
      ),
    );
  }
}
