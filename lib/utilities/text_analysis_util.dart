import 'dart:math';

import 'package:flutter/material.dart';

// Finds dates in the given text
List<String> findDates(String text) {
  final RegExp datePattern = RegExp(
    r'\b\d{1,2}[-/.](?:\d{1,2}|Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)[-/.]\d{2,4}\b',
    caseSensitive: false,
  );
  final matches = datePattern.allMatches(text);
  return matches.map((match) => match.group(0)!).toList();
}

String standardizeDate(String date) {
  // its not formats the dates with text like '04-Nov-2024'
  debugPrint('Date: $date');
  final RegExp dateRegex = RegExp(r'(\d{1,2})/(\d{1,2})/(\d{2,4})');
  final match = dateRegex.firstMatch(date);

  if (match != null) {
    int day = int.parse(match.group(1)!);
    int month = int.parse(match.group(2)!);
    String year = match.group(3)!;

    if (month > 12) {
      int temp = day;
      day = month;
      month = temp;
    }

    String formattedDay = day.toString().padLeft(2, '0');
    String formattedMonth = month.toString().padLeft(2, '0');

    if (year.length == 2) {
      year = '20$year';
    } else if (year.length < 4) {
      year = year.padLeft(4,
          '2'); // Adjust this logic as it's not typical to encounter 3-digit years.
    }

    return '$formattedDay/$formattedMonth/$year';
  }

  return date.replaceAll('.', '/');
}

// Finds the highest price in the given text
String findTotalPrice(String text) {
  // Match prices with dots or commas as decimal separators
  final RegExp pricePattern = RegExp(r'\d+[.,]\d+(?![.,]?\d)');
  final Iterable<RegExpMatch> matches = pricePattern.allMatches(text);

  // Convert matches to doubles, taking into account the decimal separator
  final List<double> prices = matches.map((m) {
    // Replace commas with dots if necessary, to parse correctly
    String priceString = m.group(0)!.replaceAll('*', '').replaceAll(',', '.');
    return double.tryParse(priceString) ?? 0.0;
  }).toList();

  // Find the highest price
  if (prices.isEmpty) {
    return 'Price not found.';
  } else {
    final double highestPrice = prices.reduce(max);
    // Format the highest price with a dot as the decimal separator
    return highestPrice.toStringAsFixed(2);
  }
}
