import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:naruto_app/models/character.dart';

class CharacterService {
  final _baseUrl = 'https://narutodb.xyz/api/';
  //final String _page = '?page=';
  //final String _limit = '&limit=';
  //final String _apiKey = '&api_key=';

  Future<List<Character>> getAll(String endpoint, int page, int limit) async {
    http.Response response = await http.get(Uri.parse('$_baseUrl$endpoint'));
    if (response.statusCode == HttpStatus.ok) {
      final dynamic jsonResponse = json.decode(response.body);

      if (jsonResponse is Map && jsonResponse.containsKey('characters')) {
        final List<dynamic> charactersList = jsonResponse['characters'];
        return charactersList
            .map((map) => Character.fromJson(map))
            .toList();
      } else {
        // Handle other cases or return an empty list
        return [];
      }
    }
    return [];
  }

  Future<List<Character>> getByName(String name, String endpoint) async {
    http.Response response =
        await http.get(Uri.parse('$_baseUrl$endpoint?name=$name'));
    if (response.statusCode == HttpStatus.ok) {
      final dynamic jsonResponse = json.decode(response.body);
      if (jsonResponse is Map && jsonResponse.containsKey('characters')) {
        final List<dynamic> charactersList = jsonResponse['characters'];
        return charactersList
            .map((map) => Character.fromJson(map))
            .toList();
      } else {
        // Handle other cases or return an empty list
        return [];
      }
    }
    return [];
  }

  Future<List<Character>> getByDebut(String debut) async {
    http.Response response =
        await http.get(Uri.parse('$_baseUrl?debut_like=$debut'));
    if (response.statusCode == HttpStatus.ok) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse
          .map<Character>((map) => Character.fromJson(map))
          .toList();
    }
    return [];
  }
}
