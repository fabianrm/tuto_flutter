import 'package:intl/intl.dart';

class HumanFormats {
 //Para mostrar con formato 1k, 1M
  static String number(double number, int numDecimal) {
    final formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: numDecimal,
      symbol: '',
      locale: 'en',
    ).format(number);

    return formattedNumber;
  }


}
