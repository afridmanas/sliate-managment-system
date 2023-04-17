import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sliate_mngmt_app/home/pages/home/notes_page.dart';
import 'package:sliate_mngmt_app/home/pages/home/resultspage.dart';
import 'package:sliate_mngmt_app/home/pages/login_signup/login_page.dart';
import 'package:sliate_mngmt_app/home/pages/screens/about.dart';
import 'package:sliate_mngmt_app/home/pages/screens/course.dart';
import 'package:sliate_mngmt_app/home/pages/screens/lecturers.dart';
import 'package:sliate_mngmt_app/home/pages/screens/news.dart';
import 'package:sliate_mngmt_app/home/pages/screens/results.dart';
import 'package:sliate_mngmt_app/home/pages/screens/settings.dart';

class MymainpagePage extends StatefulWidget {
  @override
  State<MymainpagePage> createState() => _MymainpagePageState();
}

class _MymainpagePageState extends State<MymainpagePage> {
  final Color _mainbodyColor = const Color(0xFF3A4D7F);

  int _selectedIndex = 0;
  final List<Widget> _screens = [
    notes_page(),
    notes_page(),
    notes_page(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Handle the back button press
        // Pop back to a particular screen
        Navigator.of(context).popUntil((route) => route.isFirst);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "SLIATE",
            style: TextStyle(fontSize: 20),
          ),
          elevation: 0,
          titleSpacing: 15,
          centerTitle: true,
          scrolledUnderElevation: 15,
          flexibleSpace: const FlexibleSpaceBar(),
        ),
        drawer: const drawer(),
        body: const mainbody(),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.deepPurple[100]!,
                  gap: 8,
                  activeColor: Colors.black,
                  iconSize: 24,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: const Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.grey[100]!,
                  color: Colors.black,
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  tabs: [
                    GButton(
                      icon: LineIcons.stickyNote,
                      text: 'Notes',
                      hoverColor: Colors.deepPurple,
                    ),
                    GButton(
                      icon: LineIcons.home,
                      text: 'Home ',
                      hoverColor: Colors.deepPurple,
                    ),
                    GButton(
                      icon: LineIcons.tasks,
                      text: 'Tasks',
                      hoverColor: Colors.deepPurple,
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

class mainbody extends StatelessWidget {
  const mainbody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0),
              const SizedBox(height: 25.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 340,
                      height: 150.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey,
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset('assets/images/01.jpg',
                                  height: 200,
                                  scale: 2.5,
                                  // color: Color.fromARGB(255, 15, 147, 59),
                                  opacity: const AlwaysStoppedAnimation<double>(
                                      0.5)),
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  gradient: LinearGradient(
                                      begin: FractionalOffset.topCenter,
                                      end: FractionalOffset.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        const Color(0xFF00060d)
                                            .withOpacity(0.8),
                                      ],
                                      stops: const [
                                        0.0,
                                        1.0,
                                      ])),
                            ),
                            onTap: () {
                              (FirebaseAuth.instance
                                  .signOut()
                                  .then((value) => (value) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const loginscreen()));
                                      }));
                            },
                          ),
                          const Align(
                            child: Text('HNDIT',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)),
                            alignment: Alignment(-0.8, 0.5),
                          ),
                          const Align(
                            child: Text(
                              'See More',
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            alignment: Alignment(-0.8, 0.8),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    Container(
                      width: 340,
                      height: 150.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey,
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset(
                                'assets/images/02.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                gradient: LinearGradient(
                                    begin: FractionalOffset.topCenter,
                                    end: FractionalOffset.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      const Color(0xFF00060d).withOpacity(0.8),
                                    ],
                                    stops: const [
                                      0.0,
                                      1.0,
                                    ])),
                          ),
                          const Align(
                            child: Text('HNDE',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)),
                            alignment: Alignment(-0.8, 0.5),
                          ),
                          const Align(
                            child: Text(
                              'See More',
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            alignment: Alignment(-0.8, 0.8),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    Container(
                      width: 340,
                      height: 150.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey,
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset(
                                  'assets/images/03.jpg',
                                  fit: BoxFit.cover,
                                ),
                              )),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                gradient: LinearGradient(
                                    begin: FractionalOffset.topCenter,
                                    end: FractionalOffset.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      const Color(0xFF00060d).withOpacity(0.8),
                                    ],
                                    stops: const [
                                      0.0,
                                      1.0,
                                    ])),
                          ),
                          const Align(
                            child: Text('HNDA',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)),
                            alignment: Alignment(-0.8, 0.5),
                          ),
                          const Align(
                            child: Text(
                              'See More',
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            alignment: Alignment(-0.8, 0.8),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12.0),
                  ],
                ),
              ),
              const SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Latest News',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Container(
                    width: 90.0,
                    height: 30.0,
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 13.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: const Color(0xFFEFEFEF)),
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Text('See all',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              _makeNewsTile(size.width),
              const SizedBox(height: 20.0),
              _makeNewsTile(size.width),
              const SizedBox(height: 20.0),
              _makeNewsTile(size.width),
              const SizedBox(height: 20.0),
              _makeNewsTile(size.width),
              const SizedBox(height: 20.0),
              _makeNewsTile(size.width),
              const SizedBox(height: 20.0),
              _makeNewsTile(size.width),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _makeNewsTile(double width) {
  double totalWidth = width - 30;
  double titleWidth = totalWidth * 0.7;
  double thumbnailSize = (totalWidth - titleWidth) - 20.0;
  return Container(
    width: totalWidth,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: thumbnailSize,
          height: thumbnailSize,
          decoration: const BoxDecoration(
            // color: Colors.blueAccent,
            image: DecorationImage(
              image: AssetImage('assets/images/01.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: const ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(13.0)),
            //  child: Image.asset(
            //    'assets/images/01.jpg',
            //    width: _thumbnailSize,
            //    height: _thumbnailSize,
            //    fit: BoxFit.cover,
            //    errorBuilder: (context, ex, stackTrace) {
            //      return Padding(
            //          padding: EdgeInsets.all(5.0),
            //         child: Icon(Icons.cancel_outlined, color: Colors.grey));
            //   },
          ),
        ),
        const SizedBox(width: 20.0),
        Container(
          width: titleWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Mar 28, 2023',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 7.0),
              const Text(
                'Results Release | HNDIT First Year 1st Semester.',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class drawer extends StatelessWidget {
  const drawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Padding(
              padding: EdgeInsets.only(left: 55.0, top: 35),
              child: Text(
                'SLIATE',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.book,
            ),
            title: const Text('Course Contents'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => course()),
              );
            },
          ),
          ListTile(
            title: const Text('Results'),
            leading: const Icon(
              Icons.note_alt_sharp,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => results_page()),
              );
            },
          ),
          ListTile(
            title: const Text('Lecturers'),
            leading: const Icon(
              Icons.supervised_user_circle_outlined,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => lecturers()),
              );
            },
          ),
          ListTile(
            title: const Text('Latest News'),
            leading: const Icon(
              Icons.newspaper,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => news()),
              );
            },
          ),
          ListTile(
            title: const Text('Settings'),
            leading: const Icon(
              Icons.settings,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => settings()),
              );
            },
          ),
          ListTile(
            title: const Text('About'),
            leading: const Icon(
              Icons.info,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => about()),
              );
            },
          ),
        ],
      ),
    );
  }
}
