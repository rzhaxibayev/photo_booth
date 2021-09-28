import 'package:photo_booth/modules/data/photos/datasource/photos_local_data_source.dart';
import 'package:photo_booth/modules/domain/photos/entity/photo_entity.dart';
import 'package:photo_booth/modules/domain/photos/repository/photos_repository.dart';

class PhotosRepositoryImpl implements PhotosRepository {
  final PhotosLocalDataSource dataSource;

  PhotosRepositoryImpl({required this.dataSource});

  @override
  Future<List<Photo>> fetchPhotos() async {
    final photoModelList = await dataSource.fetchPhotos();
    return photoModelList.map((e) => Photo.fromModel(e)).toList();
  }

  @override
  Future<void> savePhoto(Photo photo) {
    return dataSource.savePhoto(photo.toModel());
  }
}
