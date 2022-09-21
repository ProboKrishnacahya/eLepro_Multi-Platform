import 'package:elepro/utils/style_helper.dart';
import 'package:elepro/views/pages/fragments/courses_fragment.dart';
import 'package:elepro/views/pages/fragments/profile_fragment.dart';
import 'package:elepro/views/pages/fragments/projects_fragment.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int indexFragment = 0;

  List listFragment = [
    CoursesFragment(),
    ProjectsFragment(),
    ProfileFragment(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexFragment,
        onTap: (value) {
          indexFragment = value;
          setState(() {});
        },
        backgroundColor: Style.white,
        selectedFontSize: 12,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.school),
            sel
            icon: Icon(Icons.school_outlined),
            label: 'Kelas',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.task),
            icon: Icon(Icons.task_outlined),
            label: 'Proyek',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.account_circle),
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profil',
          ),
        ],
      ),
      body: listFragment[indexFragment],
    );
  }
}
