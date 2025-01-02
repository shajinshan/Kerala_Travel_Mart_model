import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Column(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                margin: EdgeInsets.zero, // Removes extra margin
                padding: EdgeInsets.zero, // Removes extra padding
                child: Image.asset("assets/icons/logo.png"),
              ),
            ],
          ),

          //drawer data
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromARGB(255, 89, 30, 30),
                Color.fromARGB(255, 126, 25, 25),
              ])),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //home
                  Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: ListTile(
                      leading: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Home",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(right: 30, left: 20),
                    child: Divider(),
                  ),

                  //Sync Data
                  Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: ListTile(
                      leading: Icon(
                        Icons.refresh,
                        color: Colors.white,
                      ),
                      title: Text("Sync Data",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(right: 30, left: 20),
                    child: Divider(),
                  ),
                  //Documents
                  Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: ListTile(
                      leading: Icon(
                        Icons.file_present,
                        color: Colors.white,
                      ),
                      title: Text("Documents",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 30, left: 20),
                    child: Divider(),
                  ),
                  //Feedback
                  Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: ListTile(
                      leading: Icon(
                        Icons.info,
                        color: Colors.white,
                      ),
                      title: Text("FeedBack",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(right: 30, left: 20),
                    child: Divider(),
                  ),

                  //about app
                  Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: ListTile(
                      leading: Icon(
                        Icons.person_pin_rounded,
                        color: Colors.white,
                      ),
                      title: Text("About App",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(right: 30, left: 20),
                    child: Divider(),
                  ),
                  //Logout
                  Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: ListTile(
                      leading: Icon(
                        Icons.login,
                        color: Colors.white,
                      ),
                      title: Text("Log in",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
