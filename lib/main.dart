import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meows/about_page.dart';
import 'package:meows/crud_page.dart';
import 'package:meows/login_page.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: LoginPage(),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    CrudPage(),
    About_Page()
    
  ];

  void onTappedBar(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.orange[300],
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.catching_pokemon,),
            label: ("Meows"),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.contact_support,),
            label: ("About" ),
          ),
        ],
      ),
    );
  }
}