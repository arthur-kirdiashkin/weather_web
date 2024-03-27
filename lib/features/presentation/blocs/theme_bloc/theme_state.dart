import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_web/common/themes/app_themes.dart';

enum ThemeStatus {
  initial,
  changed,
}

class ThemeState extends Equatable {
  final ThemeData? themeData;
  final ThemeStatus themeStatus;

  ThemeState({
    this.themeData,
    this.themeStatus = ThemeStatus.initial,
  });
  ThemeState copyWith({
    final ThemeData? themeData,
    final ThemeStatus? themeStatus,
  }) {
    return ThemeState(
      themeData: themeData ?? this.themeData,
      themeStatus: themeStatus ?? this.themeStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [themeData, themeStatus];
}
