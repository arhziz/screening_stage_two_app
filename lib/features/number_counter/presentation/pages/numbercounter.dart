import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:screening_stage_two_app/core/constants/appstats.dart';
import 'package:screening_stage_two_app/core/constants/constants.dart';

class NumberCounter extends StatefulWidget {
  const NumberCounter({super.key});

  @override
  State<NumberCounter> createState() => _NumberCounterState();
}

class _NumberCounterState extends State<NumberCounter> {
  List<String> pages = <String>[HOME, DISPLAY_COUNTER, USER_PROFILES];
  int _selectedIndex = 0;
  void increaseCounter() {
    setState(() {
      AppStats.counter++;
    });
  }

  void decreaseDigit() {
    if (AppStats.counter > 0) {
      setState(() {
        AppStats.counter--;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      //_selectedIndex = index;
      Navigator.popAndPushNamed(context, pages[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Number Counter",
          style: TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStats.counter.toString(),
                style: TextStyle(
                    fontSize: 40, color: Theme.of(context).primaryColorDark),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.grey),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(vertical: 12)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )),
                        ),
                        onPressed: () {
                          decreaseDigit();
                        },
                        child: Text(
                          '-',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 5,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(vertical: 12)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )),
                        ),
                        onPressed: () {
                          increaseCounter();
                        },
                        child: Text(
                          '+',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
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
}
