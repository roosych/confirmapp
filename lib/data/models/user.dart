import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(defaultValue: 0)
  final int UserId;
  @JsonKey(defaultValue: '')
  final String Name;
  @JsonKey(defaultValue: '')
  final String Surname;
  @JsonKey(defaultValue: '')
  final String Position;
  @JsonKey(defaultValue: '')
  final String MailAddress;
  @JsonKey(defaultValue: '')
  final String TransactionId;
  @JsonKey(defaultValue: '')
  final String TransactionDt;
  @JsonKey(defaultValue: 0)
  final int TransactionMinute;

  const User({
    required this.UserId,
    required this.Name,
    required this.Surname,
    required this.Position,
    required this.MailAddress,
    required this.TransactionId,
    required this.TransactionDt,
    required this.TransactionMinute,
  });

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    int? UserId,
    String? Name,
    String? Surname,
    String? Position,
    String? MailAddress,
    String? TransactionId,
    String? TransactionDt,
    int? TransactionMinute,
  }) {
    return User(
      UserId: UserId ?? this.UserId,
      Name: Name ?? this.Name,
      Surname: Surname ?? this.Surname,
      Position: Position ?? this.Position,
      MailAddress: MailAddress ?? this.MailAddress,
      TransactionId: TransactionId ?? this.TransactionId,
      TransactionDt: TransactionDt ?? this.TransactionDt,
      TransactionMinute: TransactionMinute ?? this.TransactionMinute,
    );
  }
}
