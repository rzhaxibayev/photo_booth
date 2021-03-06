import 'package:equatable/equatable.dart';

abstract class UseCase<T, Params> {
  Future<T> call(Params params);
}

class EmptyParams extends Equatable {
  @override
  List<Object> get props => [];
}
