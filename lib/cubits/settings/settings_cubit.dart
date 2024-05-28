import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsState.initial());

  toggleUseCelcius() {
    emit(state.copyWith(useCelcius: !state.useCelcius));
  }
}
