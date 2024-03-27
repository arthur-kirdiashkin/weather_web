import 'package:equatable/equatable.dart';
import 'package:weather_web/common/themes/app_themes.dart';

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
