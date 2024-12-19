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
      appBar: AppBar(title: Text("kerala")),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: 200,
              width: double.infinity,
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
            )
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
    return Image.network(
      imagePath!,
      fit: BoxFit.cover,
    );
  }
}
