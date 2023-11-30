import 'package:flutter/material.dart';
import 'package:naruto_app/models/character.dart';
import 'package:naruto_app/repositories/favorite_character_repository.dart';
import 'package:naruto_app/screens/character_detail.dart';
import 'package:naruto_app/utils/functions.dart';

class CharacterList extends StatefulWidget {
  const CharacterList(
      {super.key, required this.characters, required this.endpoint});
  final List characters;
  final String endpoint;

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: widget.characters.length,
      itemBuilder: (context, index) {
        return CharacterItem(character: widget.characters[index]);
      },
    );
  }
}

class CharacterItem extends StatefulWidget {
  const CharacterItem({super.key, required this.character});

  final Character character;

  @override
  State<CharacterItem> createState() => _CharacterItemState();
}

class _CharacterItemState extends State<CharacterItem> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final image = getImage(widget.character);
    return Column(
      children: [
        SizedBox(
            height: 150,
            child: Stack(
              children: [
                Image.network(image, width: width, fit: BoxFit.cover),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Row(children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CharacterDetail(character: widget.character),
                          ),
                        );
                      },
                      icon: const Icon(Icons.info),
                    ),
                    IconButton(
                      onPressed: () {
                        FavoriteCharacterRepository()
                            .addFavorite(widget.character);
                      },
                      icon: const Icon(Icons.favorite_border),
                    ),
                  ]),
                )
              ],
            )
          ),
          Text(
            widget.character.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
      ],
    );
  }
}
