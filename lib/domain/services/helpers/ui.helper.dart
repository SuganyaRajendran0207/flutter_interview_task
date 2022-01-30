import 'package:flutter/material.dart' show AppBar, Colors, Material;
import 'package:flutter/widgets.dart';
import 'package:flutter_interview_task/domain/data/models/country.model.dart';
import 'package:flutter_interview_task/domain/data/models/home_list.model.dart';
import 'package:flutter_interview_task/domain/data/models/home_swipe.model.dart';
import 'package:flutter_interview_task/infrastructure/enums/home_type.enum.dart';
import 'package:flutter_interview_task/presentation/styles/text_styles.dart';

///
/// Here you must have all helpers function
/// depending of the context (BuildContext)
///
class UiHelper {
  ///
  /// Get default [AppBar]
  ///
  static AppBar appBar(BuildContext context,
      {String? title, List<Widget>? actions}) {
    return AppBar(
      actions: actions ?? <Widget>[],
      backgroundColor: Colors.transparent,
      title: title == null
          ? null
          : Text(
              title,
              style: TextStyles.appBarTitleStyle(context: context),
            ),
      flexibleSpace: const Material(
        elevation: 8,
        child: Image(
          image: AssetImage('assets/images/bg_header.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  List<Highlight>? getHighlights() {
    List<Highlight> swipe = [];
    swipe.add(Highlight(
        id: 1,
        title: 'Safe Scrum Master',
        avatar: 'https://picsum.photos/536/354',
        address: 'West Des Moines, IA',
        startDate: DateTime(2021, 10, 30, 17, 30),
        endDate: DateTime(2021, 10, 31, 17, 30),
        actualPrice: 975,
        price: 825,
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'));
    swipe.add(Highlight(
        id: 2,
        title: 'Scrum Master',
        avatar: 'https://picsum.photos/536/354',
        address: 'West Des Moines, IA',
        startDate: DateTime(2021, 10, 27, 17, 30),
        endDate: DateTime(2021, 10, 28, 17, 30),
        actualPrice: 1025,
        price: 900,
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'));
    swipe.add(Highlight(
        id: 3,
        title: 'Safe Scrum Master',
        avatar: 'https://picsum.photos/536/354',
        address: 'West Des Moines, IA',
        startDate: DateTime(2021, 9, 30, 17, 30),
        endDate: DateTime(2021, 9, 31, 17, 30),
        actualPrice: 975,
        price: 825,
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'));
    swipe.add(Highlight(
        id: 4,
        title: 'Scrum Master',
        avatar: 'https://picsum.photos/536/354',
        address: 'West Des Moines, IA',
        startDate: DateTime(2021, 10, 27, 17, 30),
        endDate: DateTime(2021, 10, 28, 17, 30),
        actualPrice: 1025,
        price: 900,
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'));
    return swipe;
  }

  List<Training>? getTrainings() {
    List<Training> trainings = [];
    trainings.add(Training(
        id: 1,
        title: 'Safe Scrum Master',
        address: 'Convention Hall',
        country: Country(id: 1, name: 'West Des Moines', code: 'WM'),
        startDate: DateTime(2021, 9, 30),
        endDate: DateTime(2021, 9, 31),
        startTime: DateTime(2021, 9, 30, 8, 30),
        endTime: DateTime(2021, 9, 31, 17, 30),
        actualPrice: 975,
        price: 825,
        rating: 4.6,
        avatar: 'https://picsum.photos/536/354',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        category: Category.fast,
        speaker: Speaker(
            id: 1,
            name: 'Helen Gribble',
            type: 'Keynote',
            avatar:
                'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50.jpg',
            logo: 'https://picsum.photos/200',
            address: 'Moines')));
    trainings.add(Training(
        id: 2,
        title: 'Flutter Development',
        address: 'Convention Hall',
        country: Country(id: 2, name: 'Greater Des Moines', code: 'GM'),
        startDate: DateTime(2021, 9, 30),
        endDate: DateTime(2021, 9, 31),
        startTime: DateTime(2021, 9, 30, 8, 30),
        endTime: DateTime(2021, 9, 31, 17, 30),
        actualPrice: 975,
        price: 825,
        rating: 4.0,
        avatar: 'https://picsum.photos/536/354',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        category: Category.slow,
        speaker: Speaker(
            id: 2,
            name: 'David Goggins',
            type: 'Keynote',
            avatar:
                'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50.jpg',
            logo: 'https://picsum.photos/200',
            address: 'Moines')));
    trainings.add(Training(
        id: 3,
        title: 'Android App Development',
        address: 'Convention Hall',
        country: Country(id: 3, name: 'Chicago', code: 'IL'),
        startDate: DateTime(2021, 9, 30),
        endDate: DateTime(2021, 9, 31),
        startTime: DateTime(2021, 9, 30, 8, 30),
        endTime: DateTime(2021, 9, 31, 17, 30),
        actualPrice: 975,
        price: 825,
        rating: 4.3,
        avatar: 'https://picsum.photos/536/354',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        category: Category.moderate,
        speaker: Speaker(
            id: 3,
            name: 'Robin Sharma',
            type: 'Keynote',
            avatar:
                'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50.jpg',
            logo: 'https://picsum.photos/200',
            address: 'Moines')));
    return trainings;
  }

  ///
  /// Locations for filter
  ///
  List<Country> getCountries() {
    List<Country> countries = [];
    countries.add(Country(id: 1, name: 'West Des Moines', code: 'WM'));
    countries.add(Country(id: 2, name: 'Greater Des Moines', code: 'GM'));
    countries.add(Country(id: 3, name: 'Chicago', code: 'IL'));
    countries.add(Country(id: 4, name: 'Phoenix', code: 'AZ'));
    countries.add(Country(id: 5, name: 'Dallas', code: 'TX'));
    countries.add(Country(id: 6, name: 'San Diego', code: 'CA'));
    return countries;
  }

  ///
  /// Training name for filter
  ///
  List<String> getTrainingName() {
    List<String> name = [];
    for (var element in getTrainings()!) {
      name.add(element.title!);
    }
    return name;
  }

  ///
  /// Trainer for filter
  ///
  List<Speaker> getTrainer() {
    List<Speaker> name = [];
    for (var element in getTrainings()!) {
      name.add(element.speaker!);
    }
    return name;
  }

  ///
  /// filter items
  ///
  List<String> getFilters() {
    List<String> name = [];
    name.add('Sort by');
    name.add('Location');
    name.add('Training name');
    name.add('Trainer');
    return name;
  }
}
