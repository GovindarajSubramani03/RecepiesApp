// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import './favorite_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Meals'),
            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(
                  Icons.category_outlined,
                ),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.favorite_sharp),
                text: 'Favorites',
              ),
            ]),
          ),
          body: TabBarView(
            children: [
              CategoriesScreen(),
              FavoritesScreen(),
            ],
          )),
    );
  }
}
