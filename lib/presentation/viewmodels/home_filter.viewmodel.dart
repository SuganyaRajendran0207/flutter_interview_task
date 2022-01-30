import 'package:flutter/material.dart';
import 'package:flutter_interview_task/domain/data/models/country.model.dart';
import 'package:flutter_interview_task/domain/data/models/home_list.model.dart';
import 'package:flutter_interview_task/domain/services/helpers/ui.helper.dart';
import 'package:flutter_interview_task/infrastructure/abstracts/blockable.viewmodel.dart';
import 'package:flutter_interview_task/presentation/views/screens/home_filter.screen.dart';
import 'package:provider/provider.dart';

///
/// [HomeFilterViewModel]
///
class HomeFilterViewModel extends BlockableViewModel
    with WidgetsBindingObserver {
  ///
  /// Constructor
  ///
  HomeFilterViewModel(this.filterObj);

  ///
  /// filter
  ///
  FilterObj? filterObj;

  ///
  /// Build this ViewModel
  ///
  static ChangeNotifierProvider<HomeFilterViewModel> buildWithProvider(
      {required Widget Function(BuildContext context, Widget? child)? builder,
      Widget? child,
      FilterObj? filter}) {
    return ChangeNotifierProvider<HomeFilterViewModel>(
      create: (BuildContext context) =>
          HomeFilterViewModel(filter)..initialize(),
      builder: builder,
      lazy: false,
      child: child,
    );
  }

  ///
  /// Provide a built ViewModel
  ///
  static HomeFilterViewModel provide(BuildContext context,
      {bool listen = true}) {
    return Provider.of<HomeFilterViewModel>(context, listen: listen);
  }

  List<String> filters = [];
  List<Country> countries = [];
  List<String> trainingTitles = [];
  List<Speaker> trainer = [];

  int selectedFilter = 1;
  TextEditingController searchController = TextEditingController();
  List<Country> filterCountry = [];
  List<String> filterTrainingTitles = [];
  List<Speaker> filterTrainer = [];

  initialize() {
    filters = UiHelper().getFilters();
    countries = UiHelper().getCountries();
    trainingTitles = UiHelper().getTrainingName();
    trainer = UiHelper().getTrainer();

    fillFilterData();
  }

  fillFilterData() {
    if (filterObj != null) {
      if (filterObj!.location != null) {
        filterCountry = filterObj!.location!;
      }
      if (filterObj!.titles != null) {
        filterTrainingTitles = filterObj!.titles!;
      }
      if (filterObj!.trainer != null) {
        filterTrainer = filterObj!.trainer!;
      }
    }
  }

  updateFilter(int index) {
    selectedFilter = index;
    notifyListeners();
  }

  Widget? getFilterViewDisplay() {
    Widget? filter;
    switch (selectedFilter) {
      case 1:
        filter = const Location();
        break;
      case 2:
        filter = const TrainingTitle();
        break;
      case 3:
        filter = const Trainer();
        break;
      default:
        filter = const SizedBox();
        break;
    }
    return filter;
  }

  clearSearch() {
    searchController.clear();
    notifyListeners();
  }

  onSearch(String query) {
    switch (selectedFilter) {
      case 1:
        onLocationSearch(query);
        break;
      case 2:
        onTrainingNameSearch(query);
        break;
      case 3:
        onTrainerSearch(query);
        break;
      default:
        break;
    }
  }

  onLocationSearch(String query) {
    List<Country> country = UiHelper().getCountries();
    countries = query.isNotEmpty
        ? country
            .where((element) =>
                element.name!.toLowerCase().contains(query.toLowerCase()))
            .toList()
        : country;
    notifyListeners();
  }

  onTrainingNameSearch(String query) {
    List<String> name = UiHelper().getTrainingName();
    trainingTitles = query.isNotEmpty
        ? name
            .where((element) =>
                element.toLowerCase().contains(query.toLowerCase()))
            .toList()
        : name;
    notifyListeners();
  }

  onTrainerSearch(String query) {
    List<Speaker> name = UiHelper().getTrainer();
    trainer = query.isNotEmpty
        ? name
            .where((element) =>
                element.name!.toLowerCase().contains(query.toLowerCase()))
            .toList()
        : name;
    notifyListeners();
  }

  updateLocation(bool value, Country country) {
    if (value) {
      filterCountry.add(country);
    } else {
      filterCountry.removeWhere((element) => element.id == country.id);
    }
    notifyListeners();
  }

  updateTrainingTitle(bool value, String title) {
    if (value) {
      filterTrainingTitles.add(title);
    } else {
      filterTrainingTitles.remove(title);
    }
    notifyListeners();
  }

  updateTrainer(bool value, Speaker trainer) {
    if (value) {
      filterTrainer.add(trainer);
    } else {
      filterTrainer.removeWhere((element) => element.id == trainer.id);
    }
    notifyListeners();
  }

  applyFilter(BuildContext context) {
    FilterObj filter = FilterObj();
    if (filterCountry.isNotEmpty) {
      filter.location = filterCountry;
    }
    if (filterTrainingTitles.isNotEmpty) {
      filter.titles = filterTrainingTitles;
    }
    if (filterTrainer.isNotEmpty) {
      filter.trainer = filterTrainer;
    }

    Navigator.of(context).pop<FilterObj>(filter);
  }

  onClose(BuildContext context) {
    Navigator.of(context).pop();
  }
}

class FilterObj {
  /// location
  List<Country>? location;

  /// training titles
  List<String>? titles;

  /// trainer
  List<Speaker>? trainer;

  /// constructor
  FilterObj({this.location, this.titles, this.trainer});
}
