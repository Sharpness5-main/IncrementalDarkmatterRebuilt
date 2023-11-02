import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// import 'dart:math';
// import '../../variable_provider.dart';

part 'achievements_notifier.freezed.dart';

@freezed
class AchievementRiverpodState with _$AchievementRiverpodState {
  const factory AchievementRiverpodState({
    required double darkmatter,
  }) = _AchievemetRiverpodState;
}

final achievementRiverpodState = StateNotifierProvider<
        AchievementPiverpodNotifier, AchievementRiverpodState>(
    (ref) => AchievementPiverpodNotifier(ref)..initState());

class AchievementPiverpodNotifier
    extends StateNotifier<AchievementRiverpodState> {
  AchievementPiverpodNotifier(this.ref)
      : super(const AchievementRiverpodState(
          darkmatter: 0,
        )) {
    initState();
  }
  final Ref ref;

  void initState() {}
}
