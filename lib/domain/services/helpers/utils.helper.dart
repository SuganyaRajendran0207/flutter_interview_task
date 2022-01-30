import 'dart:math';

import 'package:flutter/material.dart' show Color, Colors;
import 'package:flutter_interview_task/infrastructure/enums/home_type.enum.dart';
import 'package:intl/intl.dart';

///
/// Here you must have all helpers function
/// NOT depending of the context (BuildContext)
///
class UtilsHelper {
  ///
  /// Get random [Color]
  ///
  static Color get randomColor =>
      Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  ///
  /// Convert [hexColorStr] to `Color`
  ///
  static Color colorFromHex(String? hexColorStr,
      {String alpha = 'FF', Color defaultColor = Colors.white}) {
    if (hexColorStr == null) return defaultColor;
    String hexColor = hexColorStr;
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = alpha + hexColor;
    }

    return Color(int.parse(hexColor, radix: 16));
  }

  ///
  /// Join array
  ///
  static String joinArray(List<dynamic> array, {String glue = ' '}) {
    return array
        .where((dynamic element) =>
            element != null && element.toString().isNotEmpty)
        .join(glue);
  }

  ///
  /// Format [size] to readdable size
  ///
  static String readdableSize(int? size) {
    if (size == null) return 'N/A';
    if (size >= 1000000) {
      return (size / 1000000).toStringAsFixed(2) + 'Mb';
    } else if (size >= 1000) {
      return (size / 1000).toStringAsFixed(2) + 'Kb';
    }

    return size.toString() + 'b';
  }

  ///
  /// Capitalize
  ///
  static String capitalize(String str) {
    if (str.isEmpty) return '';
    final String endStr = str.length > 1 ? str.substring(1) : '';
    return str.substring(0, 1).toUpperCase() + endStr;
  }

  ///
  /// month
  ///
  static String getMonth(DateTime date) {
    return DateFormat.MMM().format(date);
  }

  ///
  /// date
  ///
  static String getDate(DateTime date) {
    return DateFormat('dd').format(date);
  }

  ///
  /// date month
  ///
  static String getMonthDate(DateTime date) {
    return DateFormat('MMM dd').format(date);
  }

  ///
  /// date month year
  ///
  static String getMonthDateYear(DateTime date) {
    return DateFormat('MMM dd yyyy').format(date);
  }

  ///
  /// Get Training Date
  ///
  static String getTrainingDate(DateTime? startDate, DateTime? endDate) {
    if (startDate != null && endDate != null) {
      if (startDate.year == endDate.year) {
        if (startDate.month == endDate.month) {
          return '${getMonth(startDate)} ${getDate(startDate)} - ${getDate(endDate)}, ${startDate.year}';
        } else {
          return '${getMonthDate(startDate)} - ${getMonthDate(endDate)}, ${startDate.year}';
        }
      } else {
        return '${getMonthDateYear(startDate)} - ${getMonthDateYear(endDate)}';
      }
    } else {
      return '';
    }
  }

  ///
  /// Get Training time
  ///
  static String getTrainingTime(DateTime? startTime, DateTime? endTime) {
    if (startTime != null && endTime != null) {
      return '${DateFormat('hh:mm a').format(startTime)} - ${DateFormat('hh:mm a').format(endTime)}';
    } else {
      return '';
    }
  }

  ///
  /// Get Category Text
  ///
  static String getCategoryText(Category? category) {
    String value = '';
    switch (category!) {
      case Category.fast:
        value = 'Filling Fast!';
        break;
      case Category.slow:
        value = 'Early Bird!';
        break;
      case Category.moderate:
        value = 'Be First!';
        break;
      case Category.unknown:
        value = 'Not Yet Opened!';
        break;
    }
    return value;
  }
}
