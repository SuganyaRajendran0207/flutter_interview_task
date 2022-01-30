import 'package:flutter/material.dart';
import 'package:flutter_interview_task/domain/data/models/home_swipe.model.dart';
import 'package:flutter_interview_task/infrastructure/abstracts/blockable.viewmodel.dart';
import 'package:provider/provider.dart';

///
/// [HighlightDetailViewModel]
///
class HighlightDetailViewModel extends BlockableViewModel {
  ///
  /// Constructor
  ///
  HighlightDetailViewModel(this.highlight);

  ///
  /// highlight
  ///
  Highlight? highlight;

  ///
  /// Build this ViewModel
  ///
  static ChangeNotifierProvider<HighlightDetailViewModel> buildWithProvider(
      {required Widget Function(BuildContext context, Widget? child)? builder,
      Widget? child, Highlight? highlight}) {
    return ChangeNotifierProvider<HighlightDetailViewModel>(
      create: (BuildContext context) => HighlightDetailViewModel(highlight)..initialize(),
      builder: builder,
      lazy: false,
      child: child,
    );
  }

  ///
  /// Provide a built ViewModel
  ///
  static HighlightDetailViewModel provide(BuildContext context, {bool listen = true}) {
    return Provider.of<HighlightDetailViewModel>(context, listen: listen);
  }

  initialize() {
  }

}
