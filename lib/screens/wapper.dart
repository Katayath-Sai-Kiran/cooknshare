import 'package:cooknshare/screens/home.dart';
import 'package:cooknshare/screens/search_screen.dart';
import 'package:flutter/material.dart';

import 'create_recipe.dart';
import 'favourites.dart';
import 'profile.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final ScrollController _scrollController = ScrollController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: [
          HomeScreen(scrollController: _scrollController),
          SearchScreen(),
          CreateRecipeScreen(),
          FavouriteScreen(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          onTap: (currentIndex) {
            setState(() {
              index = currentIndex;
            });
          },
          selectedItemColor: Colors.amber,
          items: const [
            BottomNavigationBarItem(
                label: 'Explore',
                icon: Icon(
                  Icons.explore,
                )),
            BottomNavigationBarItem(
                label: 'Search',
                icon: Icon(
                  Icons.search,
                )),
            BottomNavigationBarItem(
                label: 'Add',
                icon: Icon(
                  Icons.add_box_outlined,
                )),
            BottomNavigationBarItem(
                label: 'Favourite',
                icon: Icon(
                  Icons.favorite_outline,
                )),
            BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(
                  Icons.account_circle_outlined,
                )),
          ]),
    );
  }
}
