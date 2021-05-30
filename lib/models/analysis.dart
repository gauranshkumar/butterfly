import 'dart:convert';

import 'package:sentiment_dart/sentiment_dart.dart';

Analysis analysisFromMap(String str) => Analysis.fromMap(json.decode(str));

String analysisToMap(Analysis data) => json.encode(data.toMap());

class Analysis {
  Analysis({
    this.score,
    this.comparative,
  });

  static final _sentiment = Sentiment();

  final int score;
  final double comparative;

  factory Analysis.fromMap(Map<String, dynamic> json) => Analysis(
        score: (json["score"] as int) + 5,
        comparative: json["comparative"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "score": score,
        "comparative": comparative,
      };

  factory Analysis.fromText(String text) {
    final data = _sentiment.analysis(text, emoji: true);
    return Analysis.fromMap(data);
  }
}
