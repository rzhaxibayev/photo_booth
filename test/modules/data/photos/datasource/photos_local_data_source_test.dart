import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:photo_booth/modules/data/photos/datasource/photos_local_data_source_impl.dart';
import 'package:photo_booth/modules/data/photos/model/photo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  MockSharedPreferences sharedPreferences = MockSharedPreferences();
  PhotosLocalDataSourceImpl dataSource =
      PhotosLocalDataSourceImpl(sharedPreferences: sharedPreferences);

  final mockPhotoModel = PhotoModel(
    id: '1',
    name: 'Test Name',
    date: 'Test Date',
    image: 'Test Image',
  );

  final mockPhotoModelJson = {
    'id': '1',
    'name': 'Test Name',
    'date': 'Test Date',
    'image': 'Test Image',
  };

  List<PhotoModel> mockPhotosList = [mockPhotoModel];

  List<Map<String, dynamic>> mockPhotosListJson = [mockPhotoModelJson];

  group('fetchPhotos', () {
    test('should return valid list of PhotoModel when cache is not empty',
        () async {
      /// set up
      when(sharedPreferences.getString(cachedPhotosList))
          .thenReturn(json.encode(mockPhotosListJson));

      /// result
      final photos = await dataSource.fetchPhotos();

      /// assertion
      verify(sharedPreferences.getString(cachedPhotosList));
      expect(photos, mockPhotosList);
    });

    test('should return empty when cache is empty', () async {
      /// set up
      when(sharedPreferences.getString(cachedPhotosList))
          .thenReturn(json.encode([]));

      /// result
      final photos = await dataSource.fetchPhotos();

      /// assertion
      verify(sharedPreferences.getString(cachedPhotosList));
      expect(photos, []);
    });
  });

  group('savePhoto', () {
    test(
      'should use SharedPreferences to save photo',
      () async {},
    );
  });
}
