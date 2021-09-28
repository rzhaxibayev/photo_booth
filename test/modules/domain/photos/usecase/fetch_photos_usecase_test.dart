import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:photo_booth/common/usecases/usecase.dart';
import 'package:photo_booth/modules/domain/photos/entity/photo_entity.dart';
import 'package:photo_booth/modules/domain/photos/repository/photos_repository.dart';
import 'package:photo_booth/modules/domain/photos/usecase/fetch_photos_usecase.dart';

import 'fetch_photos_usecase_test.mocks.dart';

@GenerateMocks([PhotosRepository])
void main() {
  late MockPhotosRepository mockPhotosRepository;
  late FetchPhotosUsecase usecase;

  List<Photo> mockPhotos = [
    Photo(
      id: '1',
      name: 'Test Name',
      date: 'Test Date',
      image: 'Test Image',
    ),
  ];

  setUp(() {
    mockPhotosRepository = MockPhotosRepository();
    usecase = FetchPhotosUsecase(repository: mockPhotosRepository);
  });

  test('should return list of photos from repository only once', () async {
    /// set up
    when(mockPhotosRepository.fetchPhotos())
        .thenAnswer((_) async => mockPhotos);

    /// result
    final photos = await usecase.call(EmptyParams());

    /// assertion
    verify(mockPhotosRepository.fetchPhotos());
    expect(photos, mockPhotos);
    verifyNoMoreInteractions(mockPhotosRepository);
  });
}
