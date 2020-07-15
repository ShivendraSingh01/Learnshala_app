import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'Screens/home_page.dart';
import 'Screens/notice_screen.dart';
import 'Screens/attendance_screen.dart';
import 'Screens/marksheet_screen.dart';
import 'widgets/Sidemenu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff023e8a),
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State {
  int current_Index;

  @override
  void initState() {
    super.initState();

    current_Index = 0;
  }

  changePage(int index) {
    setState(() {
      current_Index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Sharda University',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        opacity: 0.2,
        backgroundColor: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
        currentIndex: current_Index,
        hasInk: true,
        inkColor: Colors.black12,
        hasNotch: true,
        onTap: changePage,
        items: [
          BubbleBottomBarItem(
            backgroundColor: Color(0xffff006e),
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.home,
              color: Color(0xffff006e),
            ),
            title: Text('Home'),
          ),
          BubbleBottomBarItem(
            backgroundColor: Color(0xffffbe0b),
            icon: Icon(
              Icons.poll,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.poll,
              color: Color(0xffffbe0b),
            ),
            title: Text('Attendance'),
          ),
          BubbleBottomBarItem(
            backgroundColor: Color(0xff8338ec),
            icon: Icon(
              Icons.school,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.school,
              color: Color(0xff8338ec),
            ),
            title: Text('Marksheet'),
          ),
          BubbleBottomBarItem(
            backgroundColor: Color(0xff1a936f),
            icon: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.notifications_active,
              color: Color(0xff1a936f),
            ),
            title: Text('Notices'),
          ),
        ],
      ),
      body: (current_Index == 0)
          ? homepage()
          : (current_Index == 1)
              ? attendancescreen()
              : (current_Index == 2) ? marksheetscreen() : noticescreen(),
    );
  }
}
