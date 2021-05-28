import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Post {
  final String uid;
  final String title;
  final String description;
  final String category;
  final List<String> supportIdArray;
  final List<String> appreciateIdArray;
  final List<String> comments;
  Post({
    this.uid = '',
    this.title = '',
    this.description = '',
    this.category = '',
    this.supportIdArray = const [],
    this.appreciateIdArray = const [],
    this.comments = const [],
  });

  Post copyWith({
    String uid,
    String title,
    String description,
    String category,
    List<String> supportIdArray,
    List<String> appreciateIdArray,
    List<String> comments,
  }) {
    return Post(
      uid: uid ?? this.uid,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      supportIdArray: supportIdArray ?? this.supportIdArray,
      appreciateIdArray: appreciateIdArray ?? this.appreciateIdArray,
      comments: comments ?? this.comments,
    );
  }

  int get supportNumber => supportIdArray.length;

  int get appreciateNumber => appreciateIdArray.length;

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'category': category,
      'supportIdArray': supportIdArray,
      'appreciateIdArray': appreciateIdArray,
      'comments': comments,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      title: map['title'],
      description: map['description'],
      category: map['category'],
      supportIdArray: List<String>.from(map['supportIdArray']),
      appreciateIdArray: List<String>.from(map['appreciateIdArray']),
      comments: List<String>.from(map['comments']),
    );
  }

  factory Post.fromFirebase(QueryDocumentSnapshot document) {
    return Post(
      uid: document.id,
      title: document['title'],
      description: document['description'],
      category: document['category'],
      supportIdArray: List<String>.from(document['supportIdArray']),
      appreciateIdArray: List<String>.from(document['appreciateIdArray']),
      comments: List<String>.from(document['comments']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Post(uid: $uid, title: $title, description: $description, category: $category, supportIdArray: $supportIdArray, appreciateIdArray: $appreciateIdArray, comments: $comments)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Post &&
        other.uid == uid &&
        other.title == title &&
        other.description == description &&
        other.category == category &&
        listEquals(other.supportIdArray, supportIdArray) &&
        listEquals(other.appreciateIdArray, appreciateIdArray) &&
        listEquals(other.comments, comments);
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        title.hashCode ^
        description.hashCode ^
        category.hashCode ^
        supportIdArray.hashCode ^
        appreciateIdArray.hashCode ^
        comments.hashCode;
  }
}
