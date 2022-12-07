import 'package:intl/intl.dart';

extension MoneyFormat on double {
  String asCurrency(String symbol) {
    return '$symbol ${NumberFormat.currency(
            customPattern: "##0.00", locale: 'en_US')
        .format(this)}';
  }
}
