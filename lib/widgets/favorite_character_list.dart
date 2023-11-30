import 'package:flutter/material.dart';
import 'package:naruto_app/repositories/favorite_character_repository.dart';

class FavoriteCharacterList extends StatefulWidget {
  const FavoriteCharacterList({super.key});

  @override
  State<FavoriteCharacterList> createState() => _FavoriteCharacterListState();
}

class _FavoriteCharacterListState extends State<FavoriteCharacterList> {

  FavoriteCharacterRepository? _favoriteCharacterRepository;
  List? _favoriteCharacters;

  initialize() async {
    _favoriteCharacters = await _favoriteCharacterRepository!.getFavoriteCharacters();
    if(mounted) {
      setState(() {
        _favoriteCharacters = _favoriteCharacters;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _favoriteCharacterRepository = FavoriteCharacterRepository();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: (_favoriteCharacters == null)? 0 : _favoriteCharacters!.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(_favoriteCharacters![index].name),
            leading: Image.network(_favoriteCharacters![index].image),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                await _favoriteCharacterRepository!.removeFavorite(_favoriteCharacters![index].id);
                initialize();
              },
            ),
          ),
        );
      });
  }
}