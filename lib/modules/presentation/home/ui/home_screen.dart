import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_booth/config/routes.dart';
import 'package:photo_booth/modules/presentation/home/ui/widgets/home_action_button.dart';
import 'package:photo_booth/utils/image_utils.dart';

/// Main screen after the app launch
class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ImagePicker _imagePicker = ImagePicker();
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HomeActionButton(
                title: 'Take a photo',
                onPressed: () {
                  taketPhoto(context, _imagePicker, onCaptured: (base64Image) {
                    _showNameSettingBottomSheet();
                  });
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
      ),
    );
  }

  void _showNameSettingBottomSheet() {
    _textController.clear();
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => Theme(
        data: ThemeData(canvasColor: Colors.transparent),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          bottomSheet: Container(
            width: MediaQuery.of(context).size.width,
            constraints: BoxConstraints(maxHeight: 300),
            padding:
                const EdgeInsets.only(left: 24, top: 40, right: 24, bottom: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Column(
              children: [
                TextField(
                  controller: _textController,
                  autofocus: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.7), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.4), width: 1),
                    ),
                    labelText: 'Name',
                  ),
                  onChanged: (value) {},
                  onSubmitted: (text) {
                    Navigator.of(context).pop();
                  },
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 16),
                HomeActionButton(
                  title: 'Save',
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(height: 16),
                HomeActionButton(
                  title: 'Cancel',
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
