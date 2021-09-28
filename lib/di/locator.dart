import 'package:get_it/get_it.dart';
import 'package:photo_booth/modules/data/photos/datasource/photos_local_data_source.dart';
import 'package:photo_booth/modules/data/photos/datasource/photos_local_data_source_impl.dart';
import 'package:photo_booth/modules/data/photos/repository/photos_repository_impl.dart';
import 'package:photo_booth/modules/domain/photos/repository/photos_repository.dart';
import 'package:photo_booth/modules/domain/photos/usecase/fetch_photos_usecase.dart';
import 'package:photo_booth/modules/domain/photos/usecase/save_photo_usecase.dart';
import 'package:photo_booth/modules/presentation/home/cubit/home_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// service locator
final sl = GetIt.instance;

/// di init
Future<void> init() async {
  /// Shared preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  /// Data sources
  sl.registerLazySingleton<PhotosLocalDataSource>(
    () => PhotosLocalDataSourceImpl(sharedPreferences: sl()),
  );

  /// Repositories
  sl.registerLazySingleton<PhotosRepository>(
    () => PhotosRepositoryImpl(dataSource: sl()),
  );

  /// Usecases
  sl.registerFactory(() => FetchPhotosUsecase(repository: sl()));
  sl.registerFactory(() => SavePhotoUsecase(repository: sl()));

  /// Blocs
  sl.registerFactory(() => HomeCubit(savePhotoUsecase: sl()));
}
