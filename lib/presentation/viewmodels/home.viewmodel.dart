import 'package:flutter/material.dart';
import 'package:flutter_interview_task/domain/data/models/home_list.model.dart';
import 'package:flutter_interview_task/domain/data/models/home_swipe.model.dart';
import 'package:flutter_interview_task/domain/services/helpers/ui.helper.dart';
import 'package:flutter_interview_task/infrastructure/abstracts/blockable.viewmodel.dart';
import 'package:flutter_interview_task/presentation/viewmodels/home_filter.viewmodel.dart';
import 'package:flutter_interview_task/presentation/views/screens/details/highlight_detail.screen.dart';
import 'package:flutter_interview_task/presentation/views/screens/details/training_detail.screen.dart';
import 'package:flutter_interview_task/presentation/views/screens/home_filter.screen.dart';
import 'package:provider/provider.dart';

///
/// [HomeMainViewModel]
///
class HomeMainViewModel extends BlockableViewModel {
  ///
  /// Constructor
  ///
  HomeMainViewModel();

  ///
  /// Build this ViewModel
  ///
  static ChangeNotifierProvider<HomeMainViewModel> buildWithProvider(
      {required Widget Function(BuildContext context, Widget? child)? builder,
      Widget? child}) {
    return ChangeNotifierProvider<HomeMainViewModel>(
      create: (BuildContext context) => HomeMainViewModel()..initialize(),
      builder: builder,
      lazy: false,
      child: child,
    );
  }

  ///
  /// Provide a built ViewModel
  ///
  static HomeMainViewModel provide(BuildContext context, {bool listen = true}) {
    return Provider.of<HomeMainViewModel>(context, listen: listen);
  }

  PageController? controller =
      PageController(keepPage: true, viewportFraction: 0.8);
  int currentIndex = 0;
  List<Highlight>? highlights = [];
  List<Training>? trainings = [];
  FilterObj? filterObj;

  initialize() {
    highlights = UiHelper().getHighlights();
    trainings = UiHelper().getTrainings();
  }

  updateCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  navigateToFilter(BuildContext context) async {
    filterObj = await showModalBottomSheet<FilterObj>(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return HomeFilterPage(
            filterObj: filterObj,
          );
        },
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.80,
            minHeight: MediaQuery.of(context).size.height * 0.60));
    applyFilter();
  }

  applyFilter() {
    List<Training>? list = UiHelper().getTrainings();
    if (filterObj != null) {
      trainings = list!
          .where((element) =>
              (filterObj!.location != null &&
                  filterObj!.location!
                      .where((country) => element.country!.id == country.id)
                      .isNotEmpty) ||
              (filterObj!.titles != null &&
                  filterObj!.titles!
                      .where((title) => element.title! == title)
                      .isNotEmpty) ||
              (filterObj!.trainer != null &&
                  filterObj!.trainer!
                      .where((trainer) => element.speaker!.id == trainer.id)
                      .isNotEmpty))
          .toList();
    } else {
      trainings = list;
    }
    notifyListeners();
  }

  navigateToHighlight(BuildContext context, Highlight highlight) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                HighLightDetailPage(highlight: highlight)));
  }

  navigateToTraining(BuildContext context, Training training) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                TrainingDetailPage(training: training)));
  }
}
