import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'dart:async';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'steps/test_steps.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test_driver/features/**.feature")]
    ..reporters = [TestRunSummaryReporter()]
    ..stepDefinitions = [CheckGivenWidgets(),
      InputEmail(),
      InputPassword(),
      ClickLoginButton(),
      CheckPage()]
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/app.dart"
    ..keepAppRunningAfterTests = false;
  return GherkinRunner().execute(config);
}