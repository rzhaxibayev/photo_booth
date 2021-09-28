import 'package:photo_booth/common/usecases/usecase.dart';
import 'package:photo_booth/modules/domain/photos/entity/photo_entity.dart';
import 'package:photo_booth/modules/domain/photos/repository/photos_repository.dart';

/// save photos in the repository
class SavePhotoUsecase extends UseCase<void, Photo> {
  final PhotosRepository repository;

  SavePhotoUsecase({required this.repository});

  @override
  Future<void> call(Photo photo) async {
    return await repository.savePhoto(photo);
  }
}
