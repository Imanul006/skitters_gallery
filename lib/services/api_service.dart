import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:skitters_gallery/constants/strings.dart';
import 'package:skitters_gallery/models/image_model.dart';

class ApiService {
  final String apiKey = AppStrings.API_KEY;
  final String baseUrl = 'https://api.unsplash.com/photos/';

  Future<List<ImageModel>> fetchPhotos() async {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {'Authorization': 'Client-ID $apiKey'},
    );

    if (response.statusCode == 200) {
      List<dynamic> photosJson = json.decode(response.body);
      return photosJson.map((json) => ImageModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
