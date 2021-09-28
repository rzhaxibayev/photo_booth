import 'package:photo_booth/common/cubit/core_cubit.dart';
import 'package:photo_booth/modules/domain/photos/entity/photo_entity.dart';
import 'package:photo_booth/modules/domain/photos/usecase/save_photo_usecase.dart';
import 'package:photo_booth/modules/presentation/home/cubit/home_states.dart';

/// BLoC for home screen
class HomeCubit extends CoreCubit {
  final SavePhotoUsecase savePhotoUsecase;

  HomeCubit({required this.savePhotoUsecase}) : super(HomeState());

  /// saves photo in local storage
  void savePhoto(
      String? name, String base64Image, String base64Thumbnail) async {
    final now = DateTime.now();
    final photo = Photo(
      id: now.toString(),
      name: name ?? '',
      date: now.toString(),
      image: base64Image,
      thumbnail: base64Thumbnail,
    );

    await savePhotoUsecase.call(photo);
  }
}
