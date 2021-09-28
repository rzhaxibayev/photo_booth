import 'package:photo_booth/common/cubit/core_state.dart';
import 'package:photo_booth/modules/domain/photos/entity/photo_entity.dart';

/// state for photos screen
class PhotosState extends CoreState {
  final List<Photo>? photos;

  PhotosState({this.photos});
}
