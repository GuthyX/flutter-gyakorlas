import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class CustomFormatter {
  static void initializeLocale() {
    // Initialize Hungarian locale data
    initializeDateFormatting('hu_HU', null);
  }

  static String formatMonth(DateTime date) {
    return DateFormat.MMMM('hu_HU').format(date);
  }

  static DateTime changeDateMonth(DateTime date, int newMonth) {
    return DateTime(date.year, newMonth, date.day);
  }

  static String FormatDateTime(DateTime date) {
    return DateFormat.yMEd('hu_HU').format(date);
  }

  static String formatCurrency(int amount, String languageCode) {
    final NumberFormat formatter = NumberFormat.compactCurrency(
      locale: languageCode,
      symbol: 'Ft',
      decimalDigits: 0,
    );

    return formatter.format(amount);
  }
}
