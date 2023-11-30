import 'package:flutter/material.dart';
import 'package:naruto_app/services/character_service.dart';
import 'package:naruto_app/widgets/character_list.dart';

class CharactersNaruto extends StatefulWidget {
  const CharactersNaruto({super.key});

  @override
  State<CharactersNaruto> createState() => _CharactersNarutoState();
}

class _CharactersNarutoState extends State<CharactersNaruto> {
  List characters = [];

  final searchController = TextEditingController();

  initialize() async {
    characters = await CharacterService().getAll('character', 1, 20);
    setState(() {
      characters = characters;
    });
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  void searchCaracters(String text) async {
    characters = await CharacterService().getByName(text, 'character/search');
    setState(() {
      characters = characters;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          decoration: const InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(
              color: Colors.white54,
            ),
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
            ),
            prefixIconColor: Colors.white54,
          ),
          onSubmitted: searchCaracters,
        ),
      ),
      body: CharacterList(characters: characters, endpoint: 'character'),
    );
  }
}
