import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kerala_travel_mart/components/app_bar.dart';
import 'package:kerala_travel_mart/components/drawer.dart';
import 'package:kerala_travel_mart/pages/exhibitors_page.dart';
import 'package:kerala_travel_mart/pages/floor_plan_page.dart';
import 'package:kerala_travel_mart/pages/programmes_page.dart';

import '../components/image_placeholder.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

List<String> _images = [
  "assets/images/003.jpg",
  "assets/images/004.webp",
  "assets/images/005.jpg"
];

late List<Widget> _pages;
int _activepage = 0;

final Color _color = Color.fromARGB(255, 52, 175, 48);

final PageController _pageController = PageController(initialPage: 0);

Timer? _timer;

Map<String, String> title = {
  "Exhibitors": "assets/menuIcons/exhibitors-icon.png",
  "Programmes": "assets/menuIcons/programs-icon.png",
  "Floor Plan": "assets/menuIcons/floor-plan-icon.png",
  "Quick Help": "assets/menuIcons/Quickhelp-icon.png",
  "My Meetings": "assets/menuIcons/myMeeting-icon.png",
  "Venue": "assets/menuIcons/venue-icon.png",
  "Activities": "assets/menuIcons/activities-icon.png",
  "KTM": "assets/menuIcons/KTM-icon.png",
  "Moments": "assets/menuIcons/moments-icon.png",
};

class _MenuScreenState extends State<MenuScreen> {
  @override
  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.page == _pages.length - 1) {
        _pageController.animateToPage(0,
            duration: Duration(milliseconds: 500), curve: Curves.bounceInOut);
      } else {
        _pageController.nextPage(
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
    });
  }
@override
  void initState() {
    _pages = List.generate(
      _images.length,
      (index) => ImagePlaceholders(
        imagePath: _images[index],
      ),
    );
    // TODO: implement initState
    super.initState();
    // startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    _pageController.dispose();
    super.dispose();
  }

//page route

  void pagRoute(String data) {
    switch (data.toLowerCase()) {
      case "exhibitors":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ExhibitorsPage()));
        return;

      case "programmes":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProgrammesPage()));
        return;

      case "floor plan":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const FloorPlanPage()));
        return;

      default:
        print(data);
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 242, 242),
      appBar:const CustomAppBar(),

      //drawer
      drawer: const CustomDrawer(),

      //Body
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        _activepage = value;
                      });
                    },
                    controller: _pageController,
                    itemCount: _images.length,
                    itemBuilder: (context, index) {
                      return _pages[index];
                    }),
              ),
            ),
          const  SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  _pages.length,
                  (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: InkWell(
                          onTap: () {
                            _pageController.animateToPage(index,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          },
                          child: CircleAvatar(
                            radius: _activepage == index ? 8 : 6,
                            backgroundColor: _activepage == index
                                ? Colors.black
                                : const Color.fromARGB(255, 143, 143, 143),
                          ),
                        ),
                      )),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: GridView.builder(
                    itemCount: title.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      String key = title.keys.elementAt(index);
                      String _iconPath = title[key]!;
                      return GestureDetector(
                        onTap: () => pagRoute(key),
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                colors: [
                                  Color.fromARGB(255, 62, 17, 17),
                                  Color.fromARGB(255, 90, 26, 22),
                                ]),
                            borderRadius: BorderRadius.circular(20),
                            // boxShadow: [
                            //   // BoxShadow(
                            //   //     color: Colors.black.withOpacity(0.3),
                            //   //     offset: Offset(4, 4),
                            //   //     blurRadius: 2,
                            //   //     spreadRadius: 1)
                            // ]
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: 50, child: Image.asset(_iconPath)),
                              Text(
                                key,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
