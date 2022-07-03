import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mobile_app/screens/ContactPage.dart';
import 'package:mobile_app/screens/InfoPage.dart';

import 'HomeTab.dart';
import 'CalendarTab.dart';
import 'TeacherTab.dart';
import 'ClassTab.dart';
import 'ExamTab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String PAGE_ROUTE = "/home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController();
  late List<Widget> _pages;
  int _selectedPage = 0;

  @override
  void initState() {
    _pages = const [
      HomeTab(),
      CalendarTab(),
      ListTeacherTab(),
      ClassTab(),
      ExamTab()
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: const GlobalObjectKey("SCAFFOLD"),
        body: PageView(
          allowImplicitScrolling: true,
          controller: _pageController,
          children: _pages,
          onPageChanged: (index) {
            setState(() => _selectedPage = index);
          },
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(0.25))
          ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: GNav(
                haptic: true, // feedback click

                tabBorderRadius: 15,
                tabActiveBorder: null,
                tabBorder: null,
                curve: Curves.easeOutExpo,
                duration: const Duration(milliseconds: 200),
                gap: 8,
                color: Colors.grey[800],
                activeColor: Colors.white,
                tabBackgroundColor: Colors.green[800]!,
                iconSize: 24,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                selectedIndex: _selectedPage,
                onTabChange: (index) {
                  _pageController.jumpToPage(index);
                  setState(() => _selectedPage = index);
                },
                tabs: const [
                  GButton(
                    icon: LineIcons.university,
                    text: 'Home',
                  ),
                  GButton(
                    icon: LineIcons.clock,
                    text: 'Orario',
                  ),
                  GButton(
                    icon: LineIcons.graduationCap,
                    text: 'Docenti',
                  ),
                  GButton(
                    icon: LineIcons.book,
                    text: 'Corsi',
                  ),
                  GButton(
                    icon: LineIcons.penFancy,
                    text: 'Esami',
                  ),
                ]),
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.green[800],
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          )),

          child: ListView(
            children: [
              DrawerHeader(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(offset: Offset(3, 3), blurRadius: 4)],
                  ),
                  child: Image.asset("assets/images/ppp.png"),
                ) 
              ),
              const Divider(
                height: 1,
                thickness: 1,
                color: Colors.white,
              ),
              
              ListTile(
                leading: const Icon(Icons.info_outline, color: Colors.white),
                title: const Text('About', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                onTap: () => Navigator.pushNamed(context, InfoPage.PAGE_ROUTE),
              ),

              const Divider(
                height: 1,
                thickness: 1,
                color: Colors.white,
              ),

              ListTile(
                leading: const Icon(Icons.contact_phone_outlined, color: Colors.white),
                title: const Text('Contact', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                onTap: () => Navigator.pushNamed(context, ContactPage.PAGE_ROUTE),
              ),

              const Divider(
                height: 1,
                thickness: 1,
                color: Colors.white,
              ),
            ],
          )
        ),
      ),
    );
  }
}
