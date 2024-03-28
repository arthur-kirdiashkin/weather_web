import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum ThemeStatus {
  initial,
  changed,
}

class ThemeState extends Equatable {
  final ThemeData? themeData;
  final ThemeStatus? themeStatus;
  final bool? isDark;

  ThemeState({
    this.isDark = false,
    this.themeData,
    this.themeStatus = ThemeStatus.initial,
  });
  ThemeState copyWith({
    final ThemeData? themeData,
    final ThemeStatus? themeStatus,
    final bool? isDark,
  }) {
    return ThemeState(
      isDark: isDark ?? this.isDark,
      themeData: themeData ?? this.themeData,
      themeStatus: themeStatus ?? this.themeStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        themeData,
        themeStatus,
        isDark,
      ];
}
