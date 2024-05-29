part of 'theme_cubit.dart';

enum AppTheme {
  dark,
  light,
}

class ThemeState extends Equatable {
  final AppTheme appTheme;
  const ThemeState({
    required this.appTheme,
  });

  factory ThemeState.initial() {
    return const ThemeState(appTheme: AppTheme.light);
  }

  ThemeState copyWith({
    AppTheme? appTheme,
  }) {
    return ThemeState(
      appTheme: appTheme ?? this.appTheme,
    );
  }

  @override
  List<Object> get props => [appTheme];

  @override
  String toString() => 'ThemeState(appTheme: $appTheme)';
}
