import 'package:flutter/material.dart';
import 'package:photo_booth/config/routes.dart';
import 'package:photo_booth/modules/presentation/home/ui/widgets/home_action_button.dart';

/// Main screen after the app launch
class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeActionButton(
              title: 'Take a photo',
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.camera);
              },
            ),
            const SizedBox(height: 16),
            HomeActionButton(
              title: 'View photos',
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.photos);
              },
            ),
          ],
        ),
      ),
    );
  }
}
