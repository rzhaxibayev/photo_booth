import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_booth/common/cubit/core_state.dart';

/// general cubit for all cubits in the app
abstract class CoreCubit extends Cubit<CoreState> {
  CoreCubit(CoreState initialState) : super(initialState);
}
