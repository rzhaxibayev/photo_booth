import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:photo_booth/modules/data/photos/datasource/photos_local_data_source.dart';
import 'package:photo_booth/modules/data/photos/model/photo_model.dart';
import 'package:photo_booth/modules/data/photos/repository/photos_repository_impl.dart';
import 'package:photo_booth/modules/domain/photos/entity/photo_entity.dart';

import 'photos_repository_test.mocks.dart';

@GenerateMocks([PhotosLocalDataSource])
void main() {
  late MockPhotosLocalDataSource mockLocalDataSource;
  late PhotosRepositoryImpl repository;

  final mockPhoto = Photo(
    id: '1',
    name: 'Test Name',
    date: 'Test Date',
    image: 'Test Image',
  );

  final mockPhotoModel = PhotoModel(
    id: '1',
    name: 'Test Name',
    date: 'Test Date',
    image: 'Test Image',
  );

  List<Photo> mockPhotos = [mockPhoto];

  List<PhotoModel> mockPhotoModels = [mockPhotoModel];

  setUp(() {
    mockLocalDataSource = MockPhotosLocalDataSource();
    repository = PhotosRepositoryImpl(dataSource: mockLocalDataSource);
  });

  group('fetchPhotos', () {
    test('should return list of photos when saved photos are not empty',
        () async {
      /// set up
      when(mockLocalDataSource.fetchPhotos())
          .thenAnswer((_) async => mockPhotoModels);

      /// result
      final photos = await repository.fetchPhotos();

      /// assertion
      verify(mockLocalDataSource.fetchPhotos());
      expect(photos, mockPhotos);
    });

    test('should return list of photos when there is no saved photo', () async {
      /// set up
      when(mockLocalDataSource.fetchPhotos()).thenAnswer((_) async => []);

      /// result
      final photos = await repository.fetchPhotos();

      /// assertion
      verify(mockLocalDataSource.fetchPhotos());
      expect(photos, []);
    });
  });
}
