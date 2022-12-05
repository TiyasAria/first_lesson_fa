import 'package:first_lesson_fintek/model/travel.dart';
import 'package:first_lesson_fintek/page/favorite.dart';
import 'package:first_lesson_fintek/page/list_travel.dart';
import 'package:first_lesson_fintek/theme/style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage(this.favoriteTravel,);

  final List<Travel> favoriteTravel;
  // List<Travel> travel; 

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //  make data for mapping key and page
  List<Map<String, dynamic>>? _pages;
  int _pageSelected = 0;

//  inisialisasi dahulu var pages yang sudah kita buat
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = [
      {
        "pages": ListTravel(),
      },
      {
        "pages": FavoritePage(widget.favoriteTravel),
      }
    ];
  }

//  buat func ketika dia di klik
  void onClick(int index) {
    setState(() {
      _pageSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffF9F8FD),
          title: Center(child: Image.asset('asset/Logo.png')),
          leading: Icon(Icons.menu_rounded, color: greyNew)),
      body: _pages![_pageSelected]['pages'],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
        ],
        currentIndex: _pageSelected,
        onTap: onClick,
        selectedItemColor: greenColor,
        unselectedItemColor: greenSecond,
        backgroundColor: Colors.white,
      ),
    );
  }
}
