import 'package:equatable/equatable.dart';
import 'package:photo_booth/modules/data/photos/model/photo_model.dart';

class Photo extends Equatable {
  final String id;
  final String name;
  final String date;
  final String image;

  Photo({
    required this.id,
    required this.name,
    required this.date,
    required this.image,
  });

  String get fullName => name.isNotEmpty ? name : 'No name';

  factory Photo.fromModel(PhotoModel model) {
    return Photo(
      id: model.id,
      name: model.name,
      date: model.date,
      image: model.image,
    );
  }

  PhotoModel toModel() {
    return PhotoModel(
      id: id,
      name: name,
      date: date,
      image: image,
    );
  }

  @override
  List<Object?> get props => [id, name, date, image];
}
