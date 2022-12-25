import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ranker.freezed.dart';

@freezed
class Ranker with _$Ranker {
  factory Ranker({
    required String uid,
    required String name,
    required int rank,
    required Image? photo,
    required int wins,
  }) = _Ranker;
}
