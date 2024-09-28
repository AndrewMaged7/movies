import 'package:flutter/material.dart';
import 'package:movies_app/ui/tabs/browse_tab.dart';
import 'package:movies_app/ui/tabs/home_tap.dart';
import 'package:movies_app/ui/tabs/search_tab.dart';
import 'package:movies_app/ui/tabs/watch_list_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> taps = [
    HomeTap(),
    const SearchTab(),
    const BrowseTab(),
    const WatchListTab()
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1D1E1D),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor:const Color(0xff1A1A1A),
          // backgroundColor: Colors.red,
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          selectedItemColor: const Color(0xffFFBB3B),
          onTap: (value) {
            index = value;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "SEARCH"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "BROWSE"),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: "WATCHLIST"),
          ]),
      body: taps[index],
    );
  }
}
