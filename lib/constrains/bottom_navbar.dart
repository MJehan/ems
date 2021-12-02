import 'package:copy_ems/screen/more_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  Widget child = Container();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    switch(_currentIndex) {
      case 0:
        child = const MoreScreen();
        break;

      case 1:
        child = const MoreScreen();
        break;

      case 2:
        child = const MoreScreen();
        break;

      case 3:
        child = const MoreScreen();
        break;
    }

    return BottomNavigationBar(
      currentIndex: _currentIndex,
      //type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.black87.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      onTap: (value) {
        setState(() => _currentIndex = value,
        );
      },
      items:  const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.archive_rounded),
          label: 'My Feed',
          //title: const Text("0")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.card_travel),
          label: 'Leave',
          //title: const Text("1")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_task),
          label: 'Tasks',
          //title: const Text("2")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz),
          label: 'More',
          //title: const Text("3")
        ),
      ],
    );
  }
}
