import 'package:equatable/equatable.dart';

/// data model for saved photo
class PhotoModel extends Equatable {
  final String id;
  final String name;
  final String date;
  final String image;
  final String thumbnail;

  PhotoModel({
    required this.id,
    required this.name,
    required this.date,
    required this.image,
    required this.thumbnail,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'],
      name: json['name'],
      date: json['date'],
      image: json['image'],
      thumbnail: json['thumbnail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'date': date,
      'image': image,
      'thumbnail': thumbnail,
    };
  }

  @override
  List<Object> get props => [id, name, date, image, thumbnail];
}
