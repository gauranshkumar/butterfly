// To parse this JSON data, do
//
//     final analysis = analysisFromMap(jsonString);

import 'dart:convert';

Analysis analysisFromMap(String str) => Analysis.fromMap(json.decode(str));

String analysisToMap(Analysis data) => json.encode(data.toMap());

class Analysis {
  Analysis({
    this.score,
    this.comparative,
  });

  final int score;
  final double comparative;

  factory Analysis.fromMap(Map<String, dynamic> json) => Analysis(
        score: json["score"],
        comparative: json["comparative"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "score": score,
        "comparative": comparative,
      };
}
