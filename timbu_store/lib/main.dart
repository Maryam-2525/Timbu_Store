import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            child: const Column(
              children: [
                CosAppBar(),
                SizedBox(
                  height: 4,
                ),
                SearchBar(),
                SizedBox(
                  height: 4,
                ),
                CategoryFilter(),
                Expanded(child: Placeholder())
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavBars(),
      ),
    );
  }
}

class CosAppBar extends StatelessWidget {
  const CosAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Timbu Store'),
        const SizedBox(width: 10),
        Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
            const SizedBox(width: 3),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notification_add_sharp))
          ],
        )
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Search for products..',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: const Icon(Icons.filter_list),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
      ),
    );
  }
}

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const Text(
        'Categories',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      const Text('Costumes'),
      Row(
        children: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.grid_view_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.list_sharp)),
        ],
      )
    ]);
  }
}

class BottomNavBars extends StatefulWidget {
  const BottomNavBars({super.key});

  @override
  State<BottomNavBars> createState() => _BottomNavBarsState();
}

class _BottomNavBarsState extends State<BottomNavBars> {
  int SelectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: ''),
      BottomNavigationBarItem(icon: Icon(Icons.grid_view_sharp), label: ''),
      BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: '')
    ], selectedItemColor: Colors.black26, unselectedItemColor: Colors.grey);
  }
}
