import 'package:naruto_app/models/character.dart';

String getUrl(String posterPath) {
  return 'https://image.tmdb.org/t/p/original$posterPath';
}

String getImage(Character data) {
  if (data.images == null || data.images?.isEmpty == true) {
    return 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c9/Naruto_logo.svg/2560px-Naruto_logo.svg.png';
  }
  return 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c9/Naruto_logo.svg/2560px-Naruto_logo.svg.png';
}