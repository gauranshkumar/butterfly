import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  final String uid;
  final String postId;
  final String commentId;
  final String text;
  final String name;
  final DateTime time;
  Comment({
    this.uid = '',
    this.postId = '',
    this.commentId = '',
    this.text = '',
    this.name = '',
    this.time,
  });

  Comment copyWith({
    String uid,
    String postId,
    String commentId,
    String text,
    String name,
    DateTime time,
  }) {
    return Comment(
      uid: uid ?? this.uid,
      postId: postId ?? this.postId,
      commentId: commentId ?? this.commentId,
      text: text ?? this.text,
      name: name ?? this.name,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'postId': postId,
      'commentId': commentId,
      'text': text,
      'name': name,
      'time': time.millisecondsSinceEpoch,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      uid: map['uid'],
      postId: map['postId'],
      commentId: map['commentId'],
      text: map['text'],
      name: map['name'],
      time: DateTime.fromMillisecondsSinceEpoch(map['time']),
    );
  }

  factory Comment.fromFirebase(QueryDocumentSnapshot document) {
    return Comment(
      uid: document['uid'],
      postId: document['postId'],
      commentId: document['commentId'],
      text: document['text'],
      name: document['name'],
      time: DateTime.fromMillisecondsSinceEpoch(document['time']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Comment(uid: $uid, postId: $postId, commentId: $commentId, text: $text, name: $name, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Comment &&
        other.uid == uid &&
        other.postId == postId &&
        other.commentId == commentId &&
        other.text == text &&
        other.name == name &&
        other.time == time;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        postId.hashCode ^
        commentId.hashCode ^
        text.hashCode ^
        name.hashCode ^
        time.hashCode;
  }
}
