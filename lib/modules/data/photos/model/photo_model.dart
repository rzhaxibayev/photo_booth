import 'package:equatable/equatable.dart';

/// data model for saved photo
class PhotoModel extends Equatable {
  final String id;
  final String name;
  final String date;
  final String image;

  PhotoModel({
    required this.id,
    required this.name,
    required this.date,
    required this.image,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'],
      name: json['name'],
      date: json['date'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'date': date,
      'image': image,
    };
  }

  @override
  List<Object> get props => [id, name, date, image];
}
