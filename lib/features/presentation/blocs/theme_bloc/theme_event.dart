import 'package:equatable/equatable.dart';

abstract class ThemeEvent extends Equatable {}

class ThemeChangedEvent extends ThemeEvent {
  final bool isDark;

  ThemeChangedEvent({
    required this.isDark,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [isDark];
}

