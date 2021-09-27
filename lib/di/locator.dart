import 'package:get_it/get_it.dart';

/// service locator
final sl = GetIt.instance;

/// di init
void init() {
  _commonModule();
}

/// di initialization for common module
void _commonModule() {}
