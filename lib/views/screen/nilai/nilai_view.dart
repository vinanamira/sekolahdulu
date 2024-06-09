import 'package:flutter/material.dart';
import 'package:assesment2/views/screen/beranda/beranda_views.dart'; 
import 'package:assesment2/views/widgets/home_navbar_widget.dart';

class CongratulationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 20.0), // Add padding to the top
          child: Row(
            children: [
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Kevin Anggara', style: TextStyle(fontSize: 16)),
                  Text('18 y.o / SMA', style: TextStyle(fontSize: 12)),
                ],
              ),
              SizedBox(width: 10),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.png'), // Add your image asset here
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align all children to the start
              children: [
                Container(
                  margin: EdgeInsets.only(top: 32, left: 24),
                  child: Text(
                    'Congrats! Keep on going Kevin!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start, // Align text to the start
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(left: 24),
                  child: Text(
                    '"Believe in yourself and all that you are. Know that there is something inside you that is greater than any obstacle." - Christian D. Larson',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.start, // Align text to the start
                  ),
                ),
                
                SizedBox(height: 10),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Image.asset('assets/images/medal.png'), // Add your image asset here
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Image.asset('assets/images/star.png'), // Add your image asset here
                    ),
                  ],
                ),
                SizedBox(height: 1),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 110, 110, 110).withOpacity(0.5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '96',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Pronunciation Practice', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              Image.asset('assets/images/star.png'),
                              Image.asset('assets/images/star.png'),
                              Image.asset('assets/images/star.png'),
                              Image.asset('assets/images/star.png'),
                            ],
                          ),
                          Text('Kevin Anggara • 10 mins', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeNavbarWidget()),
                    );
                  },
                  child: Text(
                    'Done',
                    style: TextStyle(color: Colors.white), // Set text color to white
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 46, 10, 94), // Background color
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20), // Button padding
                    textStyle: TextStyle(fontSize: 16),
                    minimumSize: Size(double.infinity, 50), // Minimum width
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Rounded corners
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
