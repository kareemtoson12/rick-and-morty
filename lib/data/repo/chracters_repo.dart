import 'package:block/data/models/chracters.dart';
import 'package:block/data/web_services/chracters_webServices.dart';

class CharactersRepo {
  final CharactersWebServices webServices;

  CharactersRepo({required this.webServices});

  Future<List<Result>> getAllCharacters() async {
    try {
      final characters = await webServices.getAllCharacters();
      return characters.map((character) => Result.fromJson(character)).toList();
    } catch (e) {
      print('Error in CharactersRepo: $e');
      return [];
    }
  }
}
