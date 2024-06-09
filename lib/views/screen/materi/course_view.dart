import 'package:flutter/material.dart';
import 'package:assesment2/views/screen/nilai/nilai_view.dart'; // Pastikan Anda mengimpor file nilai_view.dart
import 'package:assesment2/views/screen/materi/materi_views.dart';
import 'package:assesment2/views/widgets/home_navbar_widget.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Add back button functionality
          },
        ),
        title: Text(''),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question 1',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                'Among the triangles with side lengths as follows which are classified as right triangles are:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 16),
            OptionButton(text: '2 cm, 4 cm, 6 cm', selected: false),
            OptionButton(text: '8 cm, 6 cm, 7 cm', selected: false),
            OptionButton(text: '9 cm, 9 cm, 9 cm', selected: true),
            OptionButton(text: '3 cm, 4 cm, 5 cm', selected: false),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Basic Solution',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Equilateral triangle = a triangle whose three sides are the same length. An example is triangle option C.',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CongratulationScreen()), // Navigate to NilaiView
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                'Next',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(12, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: index < 3 ? Colors.purple : Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  final String text;
  final bool selected;

  OptionButton({required this.text, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: ElevatedButton(
        onPressed: () {
          // Add option button functionality
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: selected ? Color.fromARGB(255, 195, 170, 208) : Colors.grey.shade100,
          foregroundColor: selected ? Colors.white : Colors.black,
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide.none, // No border shadow
          ),
          elevation: 0, // No shadow
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
