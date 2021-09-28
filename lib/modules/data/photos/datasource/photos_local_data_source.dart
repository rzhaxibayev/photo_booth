import 'package:photo_booth/modules/data/photos/model/photo_model.dart';

/// contract for photos data source
abstract class PhotosLocalDataSource {
  /// gets list of saved photos
  Future<List<PhotoModel>> fetchPhotos();

  /// saves photo
  Future<void> savePhoto(PhotoModel photo);
}
