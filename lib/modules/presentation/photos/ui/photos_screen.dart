import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_booth/common/cubit/core_state.dart';
import 'package:photo_booth/di/locator.dart';
import 'package:photo_booth/modules/presentation/photos/cubit/photos_cubit.dart';
import 'package:photo_booth/modules/presentation/photos/cubit/photos_states.dart';
import 'package:photo_booth/modules/presentation/photos/ui/widgets/photo_item_widget.dart';

/// List of saved photos
class PhotosScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  late PhotosCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = sl<PhotosCubit>()..fetchPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photos'),
      ),
      body: BlocConsumer<PhotosCubit, CoreState>(
        bloc: _cubit,
        listener: (_, state) {},
        buildWhen: (prevState, currentState) => currentState is PhotosState,
        builder: (context, state) {
          return (state is PhotosState)
              ? (state.photos?.isNotEmpty ?? false)
                  ? ListView.builder(
                      itemCount: state.photos?.length ?? 0,
                      itemBuilder: (_, index) =>
                          PhotoItemWidget(photo: state.photos?[index]),
                    )
                  : Center(
                      child: Text(
                          'There are no photos yet, please take a photo first'),
                    )
              : const SizedBox();
        },
      ),
    );
  }
}
