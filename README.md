# photo_booth

A simplified PhotoBooth application.

## Getting Started

This Flutter application allows user to take a photo from default camera of the device,
store them and view later. There are two screens in the app HomeScreen, PhotosScreen.

The code is written in Dart using [BLoc](https://pub.dev/packages/flutter_bloc) pattern and Clean Architecture.

This project is followed Test Driven Development approach, but still needs more test cases including
widget and bloc tests.
flutter_test library is used for Unit testing and [mockito](https://pub.dev/packages/mockito) for
mocking objects.

To run the application use the latest versions of Dart and Flutter SDK, plug in the device and run next command on the terminal:

flutter run

Notes: If you want to run on iOS real device, you should add your Signing certificates and profiles in XCode.


