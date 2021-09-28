import 'dart:convert';

import 'package:photo_booth/modules/data/photos/datasource/photos_local_data_source.dart';
import 'package:photo_booth/modules/data/photos/model/photo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const cachedPhotosList = 'cachedPhotosList';

class PhotosLocalDataSourceImpl implements PhotosLocalDataSource {
  final SharedPreferences sharedPreferences;

  PhotosLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<PhotoModel>> fetchPhotos() {
    final jsonString = sharedPreferences.getString(cachedPhotosList);
    if (jsonString != null) {
      List<PhotoModel> photos = (json.decode(jsonString) as List)
          .map((e) => PhotoModel.fromJson(e))
          .toList();
      return Future.value(photos);
    } else {
      return Future.value([]);
    }
  }

  @override
  Future<bool> savePhoto(PhotoModel photo) async {
    List<PhotoModel> photos = await fetchPhotos();
    photos.insert(0, photo);
    var jsonEncodedPhotos = json.encode(photos.map((e) => e.toJson()).toList());
    return sharedPreferences.setString(cachedPhotosList, jsonEncodedPhotos);
  }
}
