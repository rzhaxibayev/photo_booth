import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:photo_booth/common/cubit/core_cubit.dart';
import 'package:photo_booth/common/usecases/usecase.dart';
import 'package:photo_booth/modules/domain/photos/entity/photo_entity.dart';
import 'package:photo_booth/modules/domain/photos/usecase/fetch_photos_usecase.dart';
import 'package:photo_booth/modules/presentation/photos/cubit/photos_cubit.dart';

import 'photos_cubit_test.mocks.dart';

@GenerateMocks([FetchPhotosUsecase])
void main() {
  late PhotosCubit cubit;
  late MockFetchPhotosUsecase mockFetchPhotosUsecase;

  List<Photo> mockPhotos = [
    Photo(
      id: '1',
      name: 'Test Name',
      date: 'Test Date',
      image: 'Test Image',
    ),
  ];

  setUp(() {
    mockFetchPhotosUsecase = MockFetchPhotosUsecase();
    cubit = PhotosCubit(fetchPhotosUsecase: mockFetchPhotosUsecase);
  });

  test(
    'should be a subclass of CoreCubit class',
    () {
      // assert
      expect(cubit, isA<CoreCubit>());
    },
  );

  group('fetchPhotos', () {
    test('should call FetchPhotosUsecase to fetch photos', () async {
      when(mockFetchPhotosUsecase.call(EmptyParams()))
          .thenAnswer((_) async => []);

      /// result
      cubit.fetchPhotos();

      /// assertion
      verify(mockFetchPhotosUsecase.call(EmptyParams()));
    });
  });
}
