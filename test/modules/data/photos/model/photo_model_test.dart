import 'package:flutter_test/flutter_test.dart';
import 'package:photo_booth/modules/data/photos/model/photo_model.dart';

void main() {
  final mockPhotoModel = PhotoModel(
    id: '1',
    name: 'Test Name',
    date: 'Test Date',
    image: 'Test Image',
    thumbnail: 'Test Thumbnail',
  );

  final mockPhotoModelJson = {
    'id': '1',
    'name': 'Test Name',
    'date': 'Test Date',
    'image': 'Test Image',
    'thumbnail': 'Test Thumbnail',
  };

  group('fromJson', () {
    test('should return valid model', () {
      final model = PhotoModel.fromJson(mockPhotoModelJson);
      expect(model, mockPhotoModel);
    });
  });

  group('toJson', () {
    test('should return valid json containing proper data', () {
      final jsonMap = mockPhotoModel.toJson();
      expect(jsonMap, mockPhotoModelJson);
    });
  });
}
