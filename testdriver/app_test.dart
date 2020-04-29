import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Homebrew App - ', () {
    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    //cexpect to see "What coffer maker ar you using"
      // if true then continues should be deselcted if no selection is made
      //if fress press is selected then continue is activated
      //is drip machine is selected then continue is activated
    test('Given that french press is selceted and i want to make 5 cups then i should see the recommended setting and should be taken back home when done', () async {
      //expect to see HOMEBREW
        final homebrewtextFinder = find.byValueKey('homebrew-text');
        expect(await driver.getText(homebrewtextFinder), "HOMEBREW");

      //expect to see "what coffee maker are you using"
        final coffeeMakerTextFinder = find.byValueKey('coffee-question-test');
        expect(await driver.getText(coffeeMakerTextFinder), "What coffee maker are you using?");

      //tap "french press"
        final frenchPressSelector = find.byValueKey('french-press-selector');
        await driver.tap(frenchPressSelector);
      //tap continue
        final contiueBtnFinder = find.byValueKey('continue-btn');
        await driver.tap(contiueBtnFinder);


      //expect to see "How many cups would you like"
       final cupTextFinder = find.byValueKey('amount-text');
      expect(await driver.getText(cupTextFinder), "How many cups would you like?");
      //tap in the text filed
      //tap 5
      final cupTextField = find.byValueKey("cups-textfield");
      await driver.tap(cupTextField);
      await driver.enterText("5");
      await driver.tap(contiueBtnFinder);

      //expect to see "Recommended"
      final recommendTextFinder = find.byValueKey('recommended-text');
      expect(await driver.getText(recommendTextFinder), "Recommended");
      //expect to see "84 - course ground coffee"
      final coffeeAmountTextFinder = find.byValueKey("coffeeAmount-text");
      expect(await driver.getText(coffeeAmountTextFinder), "84g - coarse ground coffee");
        // expect to see "1183 - water"
      final waterAmountTextFinder = find.byValueKey("waterAmount-text");
      expect(await driver.getText(waterAmountTextFinder), "1183g - coarse ground coffee");

      //tap "Done"
      final doneBtnFinder = find.byValueKey("done-btn");
      await driver.tap(doneBtnFinder);

      //expect to see "What coffee maker are you using?"
      expect(await driver.getText(coffeeMakerTextFinder), "What coffee maker are you using?");
    });
  });
}