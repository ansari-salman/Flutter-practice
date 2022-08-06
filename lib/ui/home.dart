import 'package:demo_app/ui/meal_enquiry_form.dart';
import 'package:demo_app/ui/sliver_practice.dart';
import 'package:flutter/material.dart';
import '/ui/recipe.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _selectedItem = 0;
  var _title = ['Home', 'Category', 'Favorite', 'Setting'];
  var _pages = [Recipe(), SliverPractice(), MealEnquiryForm(), MealEnquiryForm()];

  void _onItemTap(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(_title[_selectedItem]),
      //   actions: <Widget>[
      //     IconButton(
      //       onPressed: () => {},
      //       icon: Icon(Icons.search),
      //       tooltip: "Search",
      //     )
      //   ],
      // ),
      body: _pages[_selectedItem],
      // (_selectedItem == 0) ? Recipe() :
      //  SliverPractice(),
      //  Center(
      //   child: Text(_title[_selectedItem]),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedItem,
        onTap: _onItemTap,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.folder_open), label: "Category"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_rounded), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
        ],
      ),
    );
  }
}
