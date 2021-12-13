import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';



class CheckGivenWidgets
    extends Given3WithWorld<String,String,String,FlutterWorld> {
  @override
  Future<void> executeStep(String input1, String input2, String input3) async {
// TODO: implement executeStep
    final textinput1 = find.byValueKey(input1);
    final textinput2 = find.byValueKey(input2);
    final button = find.byValueKey(input3);
    bool input1Exists = await FlutterDriverUtils.isPresent(world.driver, textinput1);
    bool input2Exists = await FlutterDriverUtils.isPresent(world.driver,textinput2);
    bool buttonExists = await FlutterDriverUtils.isPresent(world.driver, button);
    expect(input1Exists, true);
    expect(input2Exists, true);
    expect(buttonExists, true);
  }

  @override
// TODO: implement pattern
  RegExp get pattern => RegExp(r"I have {string} and {string} and {string}");
}

class InputEmail
    extends When2WithWorld<String, String, FlutterWorld>{
  @override
  Future<void> executeStep(String emailKey, String emailInput) async {
    final email = find.byValueKey(emailKey);

    await FlutterDriverUtils.tap(world.driver, email);  // acquire focus
    await FlutterDriverUtils.enterText(world.driver, email, emailInput);  // enter text
  }

  @override
  // TODO: implement pattern
  Pattern get pattern => RegExp(r"I fill the {string} field with {string}");
  
}

class InputPassword extends And2WithWorld<String, String, FlutterWorld>{
  @override
  Future<void> executeStep(String passKey, String passInput) async {
    final password = find.byValueKey(passKey);

    await FlutterDriverUtils.tap(world.driver, password);  // acquire focus
    await FlutterDriverUtils.enterText(world.driver, password, passInput);  // enter text
  }

  @override
  // TODO: implement pattern
  Pattern get pattern => RegExp(r"I fill the {string} field with {string}");

}

class ClickLoginButton
    extends Then1WithWorld<String, FlutterWorld> {

  @override
  Future<void> executeStep(String loginbtn) async {
// TODO: implement executeStep
    final loginfinder = find.byValueKey(loginbtn);
    await FlutterDriverUtils.tap(world.driver, loginfinder);
  }
  @override
  RegExp get pattern => RegExp(r"I tap the {string} button");
}

class CheckPage extends Then1WithWorld<String, FlutterWorld>{

  @override
  Future<void> executeStep(String input1) async {
    final pageCHecker = find.byValueKey(input1);
    bool PageExist = await FlutterDriverUtils.isPresent(world.driver, pageCHecker);
    expect(PageExist, true);
  }

  @override
  // TODO: implement pattern
  Pattern get pattern => RegExp(r"I have {string} on screen");

}