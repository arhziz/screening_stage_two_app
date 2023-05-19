import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:screening_stage_two_app/core/constants/appstats.dart';

import '../../../../core/constants/constants.dart';

class DsiplayCounterValue extends StatefulWidget {
  const DsiplayCounterValue({super.key});

  @override
  State<DsiplayCounterValue> createState() => _DsiplayCounterValueState();
}

class _DsiplayCounterValueState extends State<DsiplayCounterValue> {
  List<String> pages = <String>[HOME, DISPLAY_COUNTER, USER_PROFILES];
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
          "Display Counter",
          style: TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Text(
            AppStats.counter.toString(),
            style: TextStyle(
                fontSize: 30, color: Theme.of(context).primaryColorDark),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
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
