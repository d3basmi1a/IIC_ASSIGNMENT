import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importing the date formatting library
import 'account.dart'; // Import the account.dart file
import 'report.dart'; // Import the report.dart file
import 'notif.dart'; // Import the notif.dart file
import 'calendar.dart'; // Import the calendar.dart file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<IconData> navIcons = [
    Icons.home,
    Icons.calendar_today,
    Icons.person,
  ];
  List<String> navTitle = [
    "Home",
    "Calendar",
    "Profile",
  ];
  int selectedIndex = 0;

  // List to hold months
  List<String> months = [
    'JAN 2024',
    'FEB 2024',
    'MAR 2024',
    'APR 2024',
    'MAY 2024',
    'JUN 2024',
    'JUL 2024',
    'AUG 2024',
    'SEP 2024',
    'OCT 2024',
    'NOV 2024',
    'DEC 2024'
  ];

  // Current selected month
  String selectedMonth = 'MAR 2024'; // Initialize with current month

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Add functionality to open menu here
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Back,',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      'Amit Patel',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 150,
                  width: 350,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(151, 140, 208, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                            child: Text(
                              'Arrendance',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                            child: DropdownButton<String>(
                              value: selectedMonth,
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    selectedMonth = newValue;
                                  });
                                }
                              },
                              items: months.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            right: 15), // Adjust padding as needed
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Color.fromRGBO(151, 140, 208, 1),
                          backgroundImage:
                              AssetImage('assets/images/chart.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Quick Links',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(220, 217, 239, 1),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildQuickLink(Icons.article_outlined, 'Report',
                                () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ReportPage()),
                              );
                            }),
                            _buildQuickLink(Icons.file_copy, 'Syllabus', () {
                              print('Syllabus tapped');
                            }),
                            _buildQuickLink(
                                Icons.square_foot_outlined, 'Unit Test', () {
                              print('Unit Test tapped');
                            }),
                            _buildQuickLink(
                                Icons.credit_card_outlined, 'Payment', () {
                              print('Payment tapped');
                            }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Upcoming Events ()',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              // Adding 6 containers under "Upcoming Events"
              _buildEventContainer('Event 1'),
              _buildEventContainer('Event 2'),
              _buildEventContainer('Event 3'),
              _buildEventContainer('Event 4'),
              _buildEventContainer('Event 5'),
              _buildEventContainer('Event 6'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _navbar(),
    );
  }

  Widget _navbar() {
    return Container(
      height: 65,
      margin: EdgeInsets.only(
        right: 24,
        left: 24,
        bottom: 24,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 20,
            spreadRadius: 10,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          navIcons.length,
          (index) => Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                if (index == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalendarPage()),
                  );
                } else if (index == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountPage()),
                  );
                } else {
                  setState(() {
                    selectedIndex = index;
                  });
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    navIcons[index],
                    color: selectedIndex == index
                        ? Color.fromRGBO(151, 140, 208, 1)
                        : Colors.grey,
                  ),
                  SizedBox(height: 4),
                  Text(
                    navTitle[index],
                    style: TextStyle(
                      color: selectedIndex == index
                          ? Color.fromRGBO(151, 140, 208, 1)
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuickLink(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 30, color: Colors.black45),
          SizedBox(height: 5),
          Text(label, style: TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }

  Widget _buildEventContainer(String eventName) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 80,
        width: 350,
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color.fromRGBO(220, 217, 239, 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(eventName),
      ),
    );
  }
}
