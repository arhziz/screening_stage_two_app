import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/dark_theme/provider/dark_theme_provider.dart';
import '../../domain/entities/user_profile.dart';

class UserProfiles extends StatefulWidget {
  const UserProfiles({super.key});

  @override
  State<UserProfiles> createState() => _UserProfilesState();
}

class _UserProfilesState extends State<UserProfiles> {
  List<String> pages = <String>[HOME, DISPLAY_COUNTER, USER_PROFILES];
  //create list of users
  List<UserProfile> profiles = <UserProfile>[
    UserProfile(
        fullname: "Oladayo Azeez",
        email: "arhziz@outlook.com",
        avatar: "https://i.pravatar.cc/150?img=52"),
    UserProfile(
        fullname: "Olayinka Kareem",
        email: "info@decloud23tech.com",
        avatar: "https://i.pravatar.cc/150?img=63"),
    UserProfile(
        fullname: "Jacob Jonah",
        email: "jjonah@outlook.com",
        avatar: "https://i.pravatar.cc/150?img=18"),
    UserProfile(
        fullname: "Peter Parker",
        email: "pparker@outlook.com",
        avatar: "https://i.pravatar.cc/150?img=70"),
    UserProfile(
        fullname: "Tony Stark",
        email: "tstark@outlook.com",
        avatar: "https://i.pravatar.cc/150?img=10"),
    UserProfile(
        fullname: "Yakoob Josh",
        email: "yjosh@outlook.com",
        avatar: "https://i.pravatar.cc/150?img=14"),
    UserProfile(
        fullname: "Oladayo Azeez",
        email: "arhziz@outlook.com",
        avatar: "https://i.pravatar.cc/150?img=52"),
    UserProfile(
        fullname: "Olayinka Kareem",
        email: "info@decloud23tech.com",
        avatar: "https://i.pravatar.cc/150?img=63"),
    UserProfile(
        fullname: "Jacob Jonah",
        email: "jjonah@outlook.com",
        avatar: "https://i.pravatar.cc/150?img=18"),
    UserProfile(
        fullname: "Peter Parker",
        email: "pparker@outlook.com",
        avatar: "https://i.pravatar.cc/150?img=70"),
    UserProfile(
        fullname: "Tony Stark",
        email: "tstark@outlook.com",
        avatar: "https://i.pravatar.cc/150?img=10"),
    UserProfile(
        fullname: "Yakoob Josh",
        email: "yjosh@outlook.com",
        avatar: "https://i.pravatar.cc/150?img=14")
  ];

  bool isSwitched = false;
  bool darkThemeSwitch = false;

  void _onItemTapped(int index) {
    setState(() {
      //_selectedIndex = index;
      Navigator.popAndPushNamed(context, pages[index]);
    });
  }

  int rowCounts = 2;

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool useMobileLayout = shortestSide < 600;
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: FlutterSwitch(
            width: 50.0,
            height: 25.0,
            activeColor: Color(0xff0000000),
            valueFontSize: 12.0,
            toggleSize: 15.0,
            value: themeChange.darkTheme,
            borderRadius: 10.0,
            padding: 3.0,
            showOnOff: false,
            onToggle: (val) {
              themeChange.darkTheme = val;
            },
          ),
        ),
        title: Text(
          "User Profiles",
          style: TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontSize: 20,
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: FlutterSwitch(
              width: 50.0,
              height: 25.0,
              activeColor: Color(0xff0000000),
              valueFontSize: 12.0,
              toggleSize: 15.0,
              value: isSwitched,
              borderRadius: 10.0,
              padding: 3.0,
              showOnOff: false,
              onToggle: (val) {
                setState(() {
                  isSwitched = val;
                });
              },
            ),
          ),
        ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return !isSwitched
                ? portraitList()
                : !useMobileLayout
                    ? portraitTabGrid()
                    : portraitGrid();
          } else {
            return !isSwitched
                ? landscapeList()
                : !useMobileLayout
                    ? landscapeTabGrid()
                    : landscapeGrid();
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).primaryColorDark,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Counter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.countertops),
            label: 'Display',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups),
            label: 'Profiles',
          ),
        ],
      ),
    );
  }

//private methods

  GridView landscapeGrid() {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: profiles.length,
        itemBuilder: (BuildContext ctx, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Card(
              //add shadow
              elevation: 5,
              child: Column(
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              profiles[index].avatar,
                            ),
                            fit: BoxFit.cover)),
                  ),
                  ListTile(
                    title: Text(profiles[index].fullname),
                    subtitle: Text(
                      profiles[index].email,
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  GridView portraitTabGrid() {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: profiles.length,
        itemBuilder: (BuildContext ctx, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Card(
              //add shadow
              elevation: 5,
              child: Column(
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              profiles[index].avatar,
                            ),
                            fit: BoxFit.cover)),
                  ),
                  ListTile(
                    title: Text(profiles[index].fullname),
                    subtitle: Text(
                      profiles[index].email,
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  GridView landscapeTabGrid() {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6),
        itemCount: profiles.length,
        itemBuilder: (BuildContext ctx, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Card(
              //add shadow
              elevation: 5,
              child: Column(
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              profiles[index].avatar,
                            ),
                            fit: BoxFit.cover)),
                  ),
                  ListTile(
                    title: Text(profiles[index].fullname),
                    subtitle: Text(
                      profiles[index].email,
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  ListView landscapeList() {
    return ListView.builder(
      itemCount: profiles.length,
      itemBuilder: ((context, index) {
        return ListTile(
          leading: Image.network(profiles[index].avatar),
          title: Text(profiles[index].fullname),
          subtitle: Text(profiles[index].email),
        );
      }),
    );
  }

  GridView portraitGrid() {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: profiles.length,
        itemBuilder: (BuildContext ctx, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Card(
              //add shadow
              elevation: 5,
              child: Column(
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              profiles[index].avatar,
                            ),
                            fit: BoxFit.cover)),
                  ),
                  ListTile(
                    title: Text(profiles[index].fullname),
                    subtitle: Text(
                      profiles[index].email,
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  ListView portraitList() {
    return ListView.builder(
      itemCount: profiles.length,
      itemBuilder: ((context, index) {
        return ListTile(
          leading: Image.network(profiles[index].avatar),
          title: Text(profiles[index].fullname),
          subtitle: Text(profiles[index].email),
        );
      }),
    );
  }
}
