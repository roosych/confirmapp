// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      UserId: json['UserId'] as int? ?? 0,
      Name: json['Name'] as String? ?? '',
      Surname: json['Surname'] as String? ?? '',
      Position: json['Position'] as String? ?? '',
      MailAddress: json['MailAddress'] as String? ?? '',
      TransactionId: json['TransactionId'] as String? ?? '',
      TransactionDt: json['TransactionDt'] as String? ?? '',
      TransactionMinute: json['TransactionMinute'] as int? ?? 0,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'UserId': instance.UserId,
      'Name': instance.Name,
      'Surname': instance.Surname,
      'Position': instance.Position,
      'MailAddress': instance.MailAddress,
      'TransactionId': instance.TransactionId,
      'TransactionDt': instance.TransactionDt,
      'TransactionMinute': instance.TransactionMinute,
    };
