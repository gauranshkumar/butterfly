import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

class ButterflyUser {
  final String name;
  final String uid;
  final String email;
  final int rewardCoins;
  final bool isDoctor;
  final String profilePictureUrl;

  ButterflyUser({
    this.name = '',
    this.uid = '',
    this.email = '',
    this.rewardCoins = 0,
    this.isDoctor = false,
    this.profilePictureUrl = '',
  });

  ButterflyUser copyWith({
    String name,
    String uid,
    String email,
    int rewardCoins,
    bool isDoctor,
    String profilePictureUrl,
  }) {
    return ButterflyUser(
      name: name ?? this.name,
      uid: uid ?? this.uid,
      email: email ?? this.email,
      rewardCoins: rewardCoins ?? this.rewardCoins,
      isDoctor: isDoctor ?? this.isDoctor,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uid': uid,
      'email': email,
      'rewardCoins': rewardCoins,
      'isDoctor': isDoctor,
      'profilePictureUrl': profilePictureUrl,
    };
  }

  factory ButterflyUser.fromMap(Map<String, dynamic> map) {
    return ButterflyUser(
      name: map['name'],
      uid: map['uid'],
      email: map['email'],
      rewardCoins: map['rewardCoins'],
      isDoctor: map['isDoctor'],
      profilePictureUrl: map['profilePictureUrl'],
    );
  }

  factory ButterflyUser.fromFirebaseUser(User user) {
    return ButterflyUser(
      name: user.displayName,
      uid: user.uid,
      email: user.email,
      rewardCoins: 0,
      isDoctor: false,
      profilePictureUrl: user.photoURL,
    );
  }

  String toJson() => json.encode(toMap());

  factory ButterflyUser.fromJson(String source) =>
      ButterflyUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ButterflyUser(name: $name, uid: $uid, email: $email, rewardCoins: $rewardCoins, isDoctor: $isDoctor, profilePictureUrl: $profilePictureUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ButterflyUser &&
        other.name == name &&
        other.uid == uid &&
        other.email == email &&
        other.rewardCoins == rewardCoins &&
        other.isDoctor == isDoctor &&
        other.profilePictureUrl == profilePictureUrl;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        uid.hashCode ^
        email.hashCode ^
        rewardCoins.hashCode ^
        isDoctor.hashCode ^
        profilePictureUrl.hashCode;
  }
}
