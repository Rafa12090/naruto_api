import 'package:flutter/material.dart';
import 'package:naruto_app/models/character.dart';
import 'package:naruto_app/repositories/favorite_character_repository.dart';
import 'package:naruto_app/utils/functions.dart';

class CharacterDetail extends StatefulWidget {
  const CharacterDetail({super.key, required this.character});

  final Character character;

  @override
  State<CharacterDetail> createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  bool _favorite = false;

  initiliaze() async {
    _favorite =
        await FavoriteCharacterRepository().isFavorite(widget.character.id);
    if (mounted) {
      setState(() {
        _favorite = _favorite;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initiliaze();
  }

  @override
  Widget build(BuildContext context) {
    final icon =
        Icon(Icons.favorite, color: _favorite ? Colors.red : Colors.grey);

    final image = getImage(widget.character);

    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text(widget.character.name),
                      background: Image.network(
                        image,
                        fit: BoxFit.cover,
                      )),
                )
              ];
            },
            body: Column(
              children: [
                IconButton(
                    onPressed: () {
                      if (mounted) {
                        setState(() {
                          _favorite = !_favorite;
                        });
                      }

                      _favorite
                          ? FavoriteCharacterRepository()
                              .addFavorite(widget.character)
                          : FavoriteCharacterRepository()
                              .removeFavorite(widget.character.id);
                    },
                    icon: icon),
                Card(
                    child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.character.name,
                          style: const TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold))),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      widget.character.id.toString(),
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold))),
                ])),
              ],
            )));
  }
}
