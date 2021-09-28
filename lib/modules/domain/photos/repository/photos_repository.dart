import 'package:photo_booth/modules/domain/photos/entity/photo_entity.dart';

/// contract for photos repository
abstract class PhotosRepository {
  /// fetches list of saved photos
  Future<List<Photo>> fetchPhotos();

  /// saves photo
  Future<void> savePhoto(Photo photo);
}
