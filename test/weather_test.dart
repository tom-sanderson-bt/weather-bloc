// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_app_is_running.dart';
import './step/i_see_text.dart';
import './step/i_tap_icon.dart';
import './step/i_wait.dart';
import './step/i_enter_into_input_field.dart';
import './step/i_tap_text.dart';

void main() {
  group('''Weather features''', () {
    testWidgets('''Shows pick a city on app load''', (tester) async {
      await theAppIsRunning(tester);
      await iSeeText(tester, "Select a city");
    });
    testWidgets('''Searching for a city displays weather for the city''', (tester) async {
      await theAppIsRunning(tester);
      await iTapIcon(tester, Icons.search);
      await iWait(tester);
      await iEnterIntoInputField(tester, "London", 0);
      await iTapText(tester, "How's the weather?");
      await iWait(tester);
      await iSeeText(tester, "London");
      await iSeeText(tester, "13.22°C");
      await iSeeText(tester, "Overcast clouds");
    });
  });
}
