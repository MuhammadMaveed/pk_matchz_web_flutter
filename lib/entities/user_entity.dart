import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity {
  String? userId;
  String? fullName;
  String? email;
  String? coins;

  UserEntity({
    this.userId,
    this.fullName,
    this.email,
    this.coins,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  static CollectionReference<UserEntity> collection() {
    return FirebaseFirestore.instance.collection('users').withConverter(
      fromFirestore: (snapshot, _) =>
          UserEntity.fromJson(snapshot.data()!),
      toFirestore: (user, _) => user.toJson(),
    );
  }

  static DocumentReference<UserEntity> doc({required String userId}) {
    return FirebaseFirestore.instance.doc('users/$userId').withConverter(
      fromFirestore: (snapshot, _) =>
          UserEntity.fromJson(snapshot.data()!),
      toFirestore: (user, _) => user.toJson(),
    );
  }
}
