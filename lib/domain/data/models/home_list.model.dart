import 'package:flutter_interview_task/domain/data/models/country.model.dart';
import 'package:flutter_interview_task/infrastructure/enums/home_type.enum.dart';

class Training {
  ///
  /// id
  ///
  int? id;

  ///
  /// title
  ///
  String? title;

  ///
  /// avatar
  ///
  String? avatar;

  ///
  /// address
  ///
  String? address;

  ///
  /// country
  ///
  Country? country;

  ///
  /// category
  ///
  Category? category;

  ///
  /// startDate
  ///
  DateTime? startDate;

  ///
  /// endDate
  ///
  DateTime? endDate;

  ///
  /// startTime
  ///
  DateTime? startTime;

  ///
  /// endTime
  ///
  DateTime? endTime;

  ///
  /// actualPrice
  ///
  double? actualPrice;

  ///
  /// price
  ///
  double? price;

  ///
  /// rating
  ///
  double? rating;

  ///
  /// description
  ///
  String? description;

  ///
  /// speaker
  ///
  Speaker? speaker;

  ///
  /// Constructor
  ///
  Training(
      {this.id,
      this.title,
      this.speaker,
      this.avatar,
      this.address,
      this.country,
      this.startDate,
      this.endDate,
      this.startTime,
      this.endTime,
      this.category,
      this.actualPrice,
      this.price,
      this.rating,
      this.description});
}

class Speaker {
  ///
  /// id
  ///
  int? id;

  ///
  /// name
  ///
  String? name;

  ///
  /// avatar
  ///
  String? avatar;

  ///
  /// logo
  ///
  String? logo;

  ///
  /// address
  ///
  String? address;

  ///
  /// type
  ///
  String? type;

  ///
  /// Constructor
  ///
  Speaker(
      {this.id, this.name, this.address, this.type, this.avatar, this.logo});
}
