

import 'package:naruto_app/database/app_database.dart';
import 'package:naruto_app/models/character.dart';

class FavoriteCharacterRepository{
  Future<List<Character>> getFavoriteCharacters() async {
    final db = await AppDatabase().openDb();
    final List maps = await db.query(AppDatabase().tableName);
    final List<Character> characters = maps.map((map) => Character.fromJson(map)).toList();
    return characters;
  }

  Future<bool> isFavorite(int id) async {
    final db = await AppDatabase().openDb();
    final List maps = await db.query(AppDatabase().tableName, where: 'id =?', whereArgs: [id]);
    return maps.isNotEmpty;
  }

  addFavorite(Character character) async {
    final db = await AppDatabase().openDb();
    await db.insert(AppDatabase().tableName, character.toMap());
  }


  removeFavorite(int id) async {
    final db = await AppDatabase().openDb();
    await db.delete(AppDatabase().tableName, where: 'id = ?', whereArgs: [id]);
  }
}