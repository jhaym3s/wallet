// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyModel _$CurrencyModelFromJson(Map<String, dynamic> json) =>
    CurrencyModel(
      amountOwned: (json['amountOwned'] as num).toDouble() ,
      currencyWorth: (json['currencyWorth'] as num).toDouble(),
      coinGeko: CoinGeko.fromJson(json['coinGeko'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrencyModelToJson(CurrencyModel instance) =>
    <String, dynamic>{
      'amountOwned': instance.amountOwned,
      'currencyWorth': instance.currencyWorth,
      'coinGeko': instance.coinGeko,
    };
