import 'package:photo_booth/common/cubit/core_cubit.dart';
import 'package:photo_booth/common/usecases/usecase.dart';
import 'package:photo_booth/modules/domain/photos/usecase/fetch_photos_usecase.dart';
import 'package:photo_booth/modules/presentation/photos/cubit/photos_states.dart';

/// BLoC for home screen
class PhotosCubit extends CoreCubit {
  final FetchPhotosUsecase fetchPhotosUsecase;

  PhotosCubit({required this.fetchPhotosUsecase}) : super(PhotosState());

  /// fetches all saved photos
  void fetchPhotos() async {
    final photos = await fetchPhotosUsecase.call(EmptyParams());
    emit(PhotosState(photos: photos));
  }
}
