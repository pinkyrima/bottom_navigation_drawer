import 'package:bottom_navigation_drawer/bottom_nav/bottom_nav1.dart';
import 'package:bottom_navigation_drawer/bottom_nav/bottom_nav2.dart';
import 'package:bottom_navigation_drawer/bottom_nav/bottom_nav3.dart';
import 'package:bottom_navigation_drawer/bottom_nav/bottom_nav4.dart';
import 'package:bottom_navigation_drawer/drawer/drawer1.dart';
import 'package:bottom_navigation_drawer/drawer/drawer2.dart';
import 'package:bottom_navigation_drawer/drawer/drawer3.dart';
import 'package:bottom_navigation_drawer/drawer/drawer4.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> views = [
    Navigation1(),
    Navigation2(),
    Navigation3(),
    Navigation4()
  ];
  final List<Widget> drawerViews=[
    Drawer1(),
    Drawer2(),
    Drawer3(),
    Drawer4()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: drawerViews[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.bluetooth), label: "Bluetooth"),
          BottomNavigationBarItem(
              icon: Icon(Icons.flare_sharp), label: "Brightness"),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_searching_outlined),
              label: "Location search"),
          BottomNavigationBarItem(icon: Icon(Icons.mood_bad), label: "Mood"),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xFF776795),
        currentIndex: _selectedIndex,
        onTap: onTabTapped,
        backgroundColor: Color(0xFF230D58),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text("Sandra Adams",style: TextStyle(fontSize: 20),),
                accountEmail: Text("sandra@gmail.com"),
              currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(43),
                  child: Image.network("https://www.forestgreenfood.com/wp-content/uploads/2014/11/testimonial4.jpg")),
            ),
            ListTile(
              leading: Icon(Icons.access_alarm,color: Colors.pinkAccent,),
              title: Text("Awake me at 5:35 am",style: TextStyle(fontSize: 15),),
              onTap: (){
                setState(() {
                  _selectedIndex=0;
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.add_a_photo,color: Colors.blue,),
              title: Text("Add a photo",style: TextStyle(fontSize: 15),),
              onTap: (){
                setState(() {
                  _selectedIndex=1;
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.admin_panel_settings,color: Colors.teal,),
              title: Text("Admin panel",style: TextStyle(fontSize: 15),),
              onTap: (){
                setState(() {
                  _selectedIndex=2;
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.add_to_drive,color: Colors.indigo,),
              title: Text("Upload a file",style: TextStyle(fontSize: 15),),
              onTap: (){
                setState(() {
                  _selectedIndex=3;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /*void onTapDrawer(value){
    setState(() {
      _selectedIndex=value;
    });
  }
*/

}
