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
  debugPrint('Date: $date');
  final RegExp dateRegex = RegExp(r'(\d{1,2})/(\d{1,2})/(\d{2,4})');
  final match = dateRegex.firstMatch(date);

  if (match != null) {
    int day = int.parse(match.group(1)!);
    int month = int.parse(match.group(2)!);
    String year = match.group(3)!;

    // If the month part is greater than 12, it's likely a US date format
    // Swap day and month in that case
    if (month > 12) {
      int temp = day;
      day = month;
      month = temp;
    }

    // Format day and month to two digits
    String formattedDay = day.toString().padLeft(2, '0');
    String formattedMonth = month.toString().padLeft(2, '0');

    // Adjust year format
    if (year.length == 2) {
      year = '20$year';
    } else if (year.length < 4) {
      // Just in case there's a 3-digit year
      year = year.padLeft(
          4, '2'); // This is a simplistic approach; adjust as needed
    }

    return '$formattedDay/$formattedMonth/$year';
  }

  // Return the original date if it doesn't match the expected format

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
