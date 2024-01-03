import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:skitters_gallery/models/image_model.dart';
import 'package:skitters_gallery/services/api_service.dart';
import 'package:dio/dio.dart';

class UnsplashImageProvider with ChangeNotifier {
  final ApiService apiService = ApiService();
  final List<ImageModel> _photos = [];

  List<ImageModel> get photos => _photos;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<List<ImageModel>> fetchImages() async {
    try {
      List<ImageModel> images = await apiService.fetchPhotos();
      notifyListeners();
      return images;
    } catch (e) {
      print("Exception: $e");
      return [];
    }
  }

  Future<String> downloadImage(String url, String fileName) async {
    _isLoading = true;
    notifyListeners();
  try {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final directory = await getExternalStorageDirectory();
      final myFolder = Directory('${directory?.path}/MyFolder');
      if (!await myFolder.exists()) {
        await myFolder.create(recursive: true);
      }

      final filePath = '${myFolder.path}/$fileName';
      
      await Dio().download(url, filePath);
      _isLoading = false;
    notifyListeners();
      return 'Downloaded to $filePath';
    } else {
      _isLoading = false;
    notifyListeners();
      return 'Storage permission denied';
    }
  } catch (e) {
    _isLoading = false;
    notifyListeners();
    return 'Failed to download image: $e';
  }
  
}

}
