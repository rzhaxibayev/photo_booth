import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:photo_booth/common/cubit/core_cubit.dart';
import 'package:photo_booth/modules/domain/photos/usecase/save_photo_usecase.dart';
import 'package:photo_booth/modules/presentation/home/cubit/home_cubit.dart';

import 'home_cubit_test.mocks.dart';

@GenerateMocks([SavePhotoUsecase])
void main() {
  late HomeCubit cubit;
  late MockSavePhotoUsecase mockSavePhotoUsecase;

  setUp(() {
    mockSavePhotoUsecase = MockSavePhotoUsecase();
    cubit = HomeCubit(savePhotoUsecase: mockSavePhotoUsecase);
  });

  test(
    'should be a subclass of CoreCubit class',
    () {
      // assert
      expect(cubit, isA<CoreCubit>());
    },
  );

  group('savePhoto', () {
    test('should call SavePhotoUsecase with Photo', () {
      /// set up
      final mockName = 'Test name';
      final mockImage = 'Test image';
      final mockThumbnail = 'Test thumbnail';

      /// result
      cubit.savePhoto(mockName, mockImage, mockThumbnail);

      /// assertion
      verify(mockSavePhotoUsecase.call(any));
    });
  });
}
