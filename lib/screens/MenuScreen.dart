import 'package:flutter/material.dart';
import 'dart:async';
import 'package:kerala_travel_mart/components/app_bar.dart';
import 'package:kerala_travel_mart/components/drawer.dart';
import 'package:kerala_travel_mart/components/shimmer_loading_widget.dart';
import 'package:kerala_travel_mart/pages/exhibitors_page.dart';
import 'package:kerala_travel_mart/pages/floor_plan_page.dart';
import 'package:kerala_travel_mart/pages/profile_page.dart';
import 'package:kerala_travel_mart/pages/programmes_page.dart';
import 'package:kerala_travel_mart/pages/venue_page.dart';

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

final PageController _pageController = PageController(initialPage: 0);

Timer? _timer;

Map<String, IconData> title = {
  "Company Profile": Icons.person,
  "Exhibitors": Icons.group,
  "Programmes": Icons.event,
  "Floor Plan": Icons.map,
  "Quick Help": Icons.help_outline,
  "My Meetings": Icons.meeting_room,
  "Venue": Icons.location_on,
  "Activities": Icons.calendar_month_sharp,
  "KTM": Icons.people, // KTM could refer to bikes
  "Moments": Icons.photo_album,
};

class _MenuScreenState extends State<MenuScreen> {
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.page == _pages.length - 1) {
        _pageController.animateToPage(0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.bounceInOut);
      } else {
        _pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      }
    });
  }

  @override
  void initState() {
    // startTimer();
    _pages = List.generate(
      _images.length,
      (index) => ImagePlaceholders(
        imagePath: _images[index],
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    _pageController.dispose();
    super.dispose();
  }

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

      case "company profile":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProfilePage()));
        return;
      case "venue":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const VenuePage()));
        return;
       case "quick help":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ShimmerLoading()));
        return;  

      default:
        print(data);
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
          children: [
            // Search Field
            TextField(
              decoration: InputDecoration(
                filled: true,
                labelText: "Search",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 239, 245, 248),
                    width: 1.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Image Carousel
            SizedBox(
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
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: InkWell(
                    onTap: () {
                      _pageController.animateToPage(index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                    child: CircleAvatar(
                      radius: _activepage == index ? 6 : 4,
                      backgroundColor: _activepage == index
                          ? const Color.fromARGB(255, 164, 163, 163)
                          : const Color.fromARGB(255, 214, 214, 214),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Menu Grid
            Expanded(
              child: GridView.builder(
                itemCount: title.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 items per row
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  String key = title.keys.elementAt(index);
                  IconData iconPath = title[key]!;
                  return GestureDetector(
                    onTap: () => pagRoute(key),
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [Color(0xFF2B6A77), Color(0xFF2B6A77)]),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            iconPath,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          key,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
