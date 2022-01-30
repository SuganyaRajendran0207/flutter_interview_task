import 'package:flutter/material.dart';
import 'package:flutter_interview_task/domain/data/models/home_list.model.dart';
import 'package:flutter_interview_task/infrastructure/abstracts/blockable.viewmodel.dart';
import 'package:provider/provider.dart';

///
/// [TrainingDetailViewModel]
///
class TrainingDetailViewModel extends BlockableViewModel {
  ///
  /// Constructor
  ///
  TrainingDetailViewModel(this.training);

  ///
  /// Training
  ///
  Training? training;

  ///
  /// Build this ViewModel
  ///
  static ChangeNotifierProvider<TrainingDetailViewModel> buildWithProvider(
      {required Widget Function(BuildContext context, Widget? child)? builder,
      Widget? child, Training? training}) {
    return ChangeNotifierProvider<TrainingDetailViewModel>(
      create: (BuildContext context) => TrainingDetailViewModel(training)..initialize(),
      builder: builder,
      lazy: false,
      child: child,
    );
  }

  ///
  /// Provide a built ViewModel
  ///
  static TrainingDetailViewModel provide(BuildContext context, {bool listen = true}) {
    return Provider.of<TrainingDetailViewModel>(context, listen: listen);
  }

  initialize() {
  }

}
