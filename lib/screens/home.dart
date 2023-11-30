import 'package:flutter/material.dart';
import 'package:naruto_app/screens/characters_naruto.dart';
import 'package:naruto_app/screens/view_main.dart';
import 'package:naruto_app/widgets/favorite_character_list.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _tabs = [
    const ViewMain(),
    const CharactersNaruto(),
    const FavoriteCharacterList()
  ];
  
  _changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => _changeTab(index),
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Characters'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          ],
        ),
        body: _tabs[_currentIndex],
    );
  }
}
