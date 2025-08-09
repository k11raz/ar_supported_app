import "package:intl/intl.dart";

class NFormatter {
  static String formatDate(DateTime? date) {

    date ??= DateTime.now();
    return DateFormat("dd-MMM-YYYY").format(date); // customize the date format as needed 
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: "tr_TR",symbol: '₺').format(amount); // currency
  }

  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0,3)}) ${phoneNumber.substring(3,6)} ${phoneNumber.substring(6)}';
    }

    return phoneNumber;
  }


  // test it
  static String internationalFormatNumber(String phoneNumber) {
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    String countryCode = '+${digitsOnly.substring(0,2)}'; // extracting country code
    digitsOnly = digitsOnly.substring(2);

    final formattedNumber = StringBuffer();
    formattedNumber.write('($countryCode) ');

    int i = 0;
    while (i<digitsOnly.length) {
      int groupLength = 2;
      if (i == 0 && countryCode == '+1') {
        groupLength = 3;
      }

      int end = i + groupLength;
      formattedNumber.write(digitsOnly.substring(i, end));

      if (end < digitsOnly.length) {
        formattedNumber.write(' ');
      }

      i = end;
    }

    return formattedNumber.toString();
  }
}