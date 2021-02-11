import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:tradaruprojecttest/temp_save/pass_data.dart';
import 'package:tradaruprojecttest/view/fragments/categories.dart';
import 'package:tradaruprojecttest/view/fragments/product.dart';
import 'package:tradaruprojecttest/view/fragments/search_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  var bottomNavigationBarItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: const Icon(Icons.home_outlined),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.favorite_outline),
      label: "Favorit",
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.chat_bubble_outline),
      label: "History",
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.person_outline),
      label: "Profile",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfef5f8),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 20),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4nS0E7o72SAoTp4PBsONDR8VFl-gwy0MfpA&usqp=CAU"),
              ),
            ),
            actions: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(right: 20),
                child: Badge(
                  badgeContent: Text(PassData.totalOrder.toString()),
                  child: Icon(Icons.shopping_cart_outlined, color: Colors.black, size: 25,),
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SearchBar(),
            SizedBox(height:10),
            Categories(),
            Expanded(
              flex: 1,
              child: Product()
            ),
          ]
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        items: bottomNavigationBarItems,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        unselectedFontSize: 10,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.pink[300],
        unselectedItemColor: Colors.grey[350],
        backgroundColor: Colors.white,
      ),
    );
  }
}