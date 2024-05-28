part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final bool useCelcius;

  const SettingsState({
    required this.useCelcius,
  });

  factory SettingsState.initial() {
    return const SettingsState(useCelcius: true);
  }

  SettingsState copyWith({
    bool? useCelcius,
  }) {
    return SettingsState(
      useCelcius: useCelcius ?? this.useCelcius,
    );
  }

  @override
  String toString() => 'SettingsState(useCelcius: $useCelcius)';

  @override
  List<Object> get props => [useCelcius];
}
