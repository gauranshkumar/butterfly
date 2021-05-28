import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:butterfly/models/comment.dart';

class Post {
  final String uid;
  final String title;
  final String description;
  final String category;
  final int support;
  final int appreciate;
  final List<Comment> comments;
  Post({
    this.uid = '',
    this.title = '',
    this.description = '',
    this.category = '',
    this.support = 0,
    this.appreciate = 0,
    this.comments = const [],
  });

  Post copyWith({
    String uid,
    String title,
    String description,
    String category,
    int support,
    int appreciate,
    List<Comment> comments,
  }) {
    return Post(
      uid: uid ?? this.uid,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      support: support ?? this.support,
      appreciate: appreciate ?? this.appreciate,
      comments: comments ?? this.comments,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'title': title,
      'description': description,
      'category': category,
      'support': support,
      'appreciate': appreciate,
      'comments': comments?.map((x) => x.toMap())?.toList(),
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      uid: map['uid'],
      title: map['title'],
      description: map['description'],
      category: map['category'],
      support: map['support'],
      appreciate: map['appreciate'],
      comments:
          List<Comment>.from(map['comments']?.map((x) => Comment.fromMap(x))),
    );
  }

  factory Post.fromFirebase(QueryDocumentSnapshot document) {
    return Post(
      uid: document['uid'],
      title: document['title'],
      description: document['description'],
      category: document['category'],
      support: document['support'],
      appreciate: document['appreciate'],
      // comments: List<Comment>.from(
      //     document['comments']?.map((x) => Comment.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Post(uid: $uid, title: $title, description: $description, category: $category, support: $support, appreciate: $appreciate, comments: $comments)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Post &&
        other.uid == uid &&
        other.title == title &&
        other.description == description &&
        other.category == category &&
        other.support == support &&
        other.appreciate == appreciate &&
        listEquals(other.comments, comments);
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        title.hashCode ^
        description.hashCode ^
        category.hashCode ^
        support.hashCode ^
        appreciate.hashCode ^
        comments.hashCode;
  }
}
