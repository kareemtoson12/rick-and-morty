import 'package:block/constants/strings.dart';
import 'package:dio/dio.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseurrl,
    );
    dio = Dio(options);
  }

  Future<List<Map<String, dynamic>>> getAllCharacters() async {
    try {
      Response response = await dio.get('character');

      // Log response status and data
      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data.toString()}');

      if (response.statusCode == 200 && response.data is Map) {
        // Extract the 'results' list from the response data
        List<dynamic> results = response.data['results'];

        return List<Map<String, dynamic>>.from(results);
      } else {
        print('Unexpected response format or status code');
        return [];
      }
    } on DioError catch (dioError) {
      print('DioError: ${dioError.message}');
      if (dioError.response != null) {
        print('DioError response data: ${dioError.response?.data}');
      }
      return [];
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}
