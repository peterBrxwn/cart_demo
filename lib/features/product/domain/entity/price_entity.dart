// Package imports:
import 'package:equatable/equatable.dart';

class Price extends Equatable {
  final int amount;
  final String currency;
  final String formatted;

  const Price({
    required this.amount,
    required this.currency,
    required this.formatted,
  });

  Price copyWith({int? amount, String? currency, String? formatted}) {
    return Price(
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      formatted: formatted ?? this.formatted,
    );
  }

  @override
  List<Object?> get props => [amount, currency, formatted];
}
