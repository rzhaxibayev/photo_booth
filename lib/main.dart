import 'package:flutter/material.dart';
import 'package:photo_booth/config/routes.dart';
import 'package:photo_booth/modules/presentation/home/ui/home_screen.dart';
import 'package:photo_booth/modules/presentation/photos/ui/photos_screen.dart';
import 'di/locator.dart' as service_locator;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  /// DI initialization
  service_locator.init();

  runApp(PhotoBoothApp());
}

/// This widget is the root of the application.
class PhotoBoothApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Booth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: _registerRoutes(),
    );
  }

  /// Registration of all routes in the app
  Map<String, WidgetBuilder> _registerRoutes() => {
        AppRoutes.home: (context) => HomeScreen(),
        AppRoutes.photos: (context) => PhotosScreen(),
      };
}
