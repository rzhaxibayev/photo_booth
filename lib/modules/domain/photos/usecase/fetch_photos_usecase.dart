import 'package:photo_booth/common/usecases/usecase.dart';
import 'package:photo_booth/modules/domain/photos/entity/photo_entity.dart';
import 'package:photo_booth/modules/domain/photos/repository/photos_repository.dart';

/// fetches saved photos list from repository
class FetchPhotosUsecase extends UseCase<List<Photo>, EmptyParams> {
  final PhotosRepository repository;

  FetchPhotosUsecase({required this.repository});

  @override
  Future<List<Photo>> call(EmptyParams params) async {
    return await repository.fetchPhotos();
  }
}
