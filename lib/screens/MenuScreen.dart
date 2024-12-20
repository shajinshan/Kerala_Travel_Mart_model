import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

List<String> _images = [
  "https://media.istockphoto.com/id/670688480/photo/green-tea-plantations-munnar-kerala-india.jpg?s=2048x2048&w=is&k=20&c=ZNzI2OKvsEyF5IuyqV9DPbDr224FpUuAhFBthyS3OUM=",
  "https://media.istockphoto.com/id/589538028/photo/manali-town.jpg?s=2048x2048&w=is&k=20&c=16NUhEO0f1m0danaOsxRIU4x9iCHshjT2keQtxJ6zJ0=",
  "https://media.istockphoto.com/id/1415327017/photo/pokut-plateau-rize-camlihemsin-pokut-plateau-in-the-black-sea-and-turkey-rize-turkey.jpg?s=2048x2048&w=is&k=20&c=MkrPUU-zikeb6DVcdIqDtkheBBkEkXN1sEV8ml0SRoc="
];

late List<Widget> _pages;
int _activepage = 0;

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

  void initState() {
    _pages = List.generate(
      _images.length,
      (index) => ImagePlaceholders(
        imagePath: _images[index],
      ),
    );
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 70,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 200,
                height: 70,
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Image.asset("assets/images/KTM-white-logo.jpg"),
              ),
              Container(
                height: 50,
                width: 50,
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Image.asset("assets/images/scanner-icon.jpg"),
              ),
            ],
          )),
      drawer: Drawer(),
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
            SizedBox(
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
            SizedBox(
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
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15),
                    itemBuilder: (context, index) {
                      String key = title.keys.elementAt(index);
                      String _iconPath = title[key]!;
                      return Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Color(0xFFFEDD14),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(17),
                                bottomRight: Radius.circular(17)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  offset: Offset(4, 4),
                                  blurRadius: 2,
                                  spreadRadius: 1)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 70, child: Image.asset(_iconPath)),
                            Text(
                              key,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
                            )
                          ],
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

class ImagePlaceholders extends StatelessWidget {
  final String? imagePath;
  const ImagePlaceholders({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.hardEdge,
        child: Image.network(
          imagePath!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
