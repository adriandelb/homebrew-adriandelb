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
////////////////////////////////////////////////////////////////////////////////////////////////////////
/// Acceptance test for the french press
/// It test that the app fully works
///
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
       final cupTextFinder = find.byValueKey('amountTitle-text');
        expect(await driver.getText(cupTextFinder), "How many cups would you like?");
    
      //tap in the text field
        final cupTextField = find.byValueKey("cups-textfield");
        await driver.tap(cupTextField);
     
      //Enter 5 into text field
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

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// Acceptance test for the Drip Press
/// It test that the app fully works under drip press
///
    test('Given that drip machine is selceted and i want to make 5 cups then i should see the recommended setting and should be taken back home when done', () async {
        //expect to see HOMEBREW
        final homebrewtextFinder = find.byValueKey('homebrew-text');
        expect(await driver.getText(homebrewtextFinder), "HOMEBREW");

      //expect to see "what coffee maker are you using"
        final coffeeMakerTextFinder = find.byValueKey('coffee-question-test');
        expect(await driver.getText(coffeeMakerTextFinder), "What coffee maker are you using?");

      //tap "french press"
        final dripPressSelector = find.byValueKey('drip-press-selector');
        await driver.tap(dripPressSelector);
      //tap continue
        final contiueBtnFinder = find.byValueKey('continue-btn');
        await driver.tap(contiueBtnFinder);


      //expect to see "How many cups would you like"
        final cupTextFinder = find.byValueKey('amountTitle-text');
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
      expect(await driver.getText(coffeeAmountTextFinder), "70g - coarse ground coffee");
        // expect to see "1183 - water"
      final waterAmountTextFinder = find.byValueKey("waterAmount-text");
      expect(await driver.getText(waterAmountTextFinder), "1183g - coarse ground coffee");

      //tap "Done"
      final doneBtnFinder = find.byValueKey("done-btn");
      await driver.tap(doneBtnFinder);

      //expect to see "What coffee maker are you using?"
      expect(await driver.getText(coffeeMakerTextFinder), "What coffee maker are you using?");

    });

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///Tests for drip press that test:
///     -back button 
///     -continue button
/// 
    test('Checks that continue button on coffee selector for drip press works ', () async {
        final homebrewtextFinder = find.byValueKey('homebrew-text');
        expect(await driver.getText(homebrewtextFinder), "HOMEBREW");

      //expect to see "what coffee maker are you using"
        final coffeeMakerTextFinder = find.byValueKey('coffee-question-test');
        expect(await driver.getText(coffeeMakerTextFinder), "What coffee maker are you using?");

      //tap the button and check if still on the same screen
        final contiueBtnFinder = find.byValueKey('continue-btn');
        await driver.tap(contiueBtnFinder);
        expect(await driver.getText(coffeeMakerTextFinder), "What coffee maker are you using?");

        final dripPressSelector = find.byValueKey('drip-press-selector');
        await driver.tap(dripPressSelector);
        await driver.tap(contiueBtnFinder);
        final cupTextFinder = find.byValueKey('amountTitle-text');
        expect(await driver.getText(cupTextFinder), "How many cups would you like?");
      });

    test('Checks that continue button on ammount screen works for drip press ', () async {
        //expect to see HOMEBREW
        final homebrewtextFinder = find.byValueKey('homebrew-text');
        expect(await driver.getText(homebrewtextFinder), "HOMEBREW");

      //expect to see "what coffee maker are you using"
        final coffeeMakerTextFinder = find.byValueKey('coffee-question-test');
        expect(await driver.getText(coffeeMakerTextFinder), "What coffee maker are you using?");

      //tap "french press"
        final dripPressSelector = find.byValueKey('drip-press-selector');
        await driver.tap(dripPressSelector);
      //tap continue
        final contiueBtnFinder = find.byValueKey('continue-btn');
        await driver.tap(contiueBtnFinder);
      //checks if in the amount screen
        final cupTextFinder = find.byValueKey('amountTitle-text');
        expect(await driver.getText(cupTextFinder), "How many cups would you like?");

        //tap button in cup amount when text field is empty
        await driver.tap(contiueBtnFinder);
        expect(await driver.getText(coffeeMakerTextFinder), "How many cups would you like?");

        //tap button in cup amount when there is an item in the text field
        final cupTextField = find.byValueKey("cups-textfield");
        await driver.tap(cupTextField);
        await driver.enterText("5");
        await driver.tap(contiueBtnFinder);

        //check if in the next screen
        final recommendTextFinder = find.byValueKey('recommended-text');
        expect(await driver.getText(recommendTextFinder), "Recommended");
      });

      test('Checks that back button on amount screen works for drip press', () async {
        final homebrewtextFinder = find.byValueKey('homebrew-text');
        expect(await driver.getText(homebrewtextFinder), "HOMEBREW");

      //expect to see "what coffee maker are you using"
        final coffeeMakerTextFinder = find.byValueKey('coffee-question-test');
        expect(await driver.getText(coffeeMakerTextFinder), "What coffee maker are you using?");

      //tap "drip press"
        final dripPressSelector = find.byValueKey('drip-press-selector');
        await driver.tap(dripPressSelector);

      //tap continue
        final contiueBtnFinder = find.byValueKey('continue-btn');
        await driver.tap(contiueBtnFinder);

      //expect to be on the coffee amount screen and see "How many cups would you like"
        final cupTextFinder = find.byValueKey('amountTitle-text');
        expect(await driver.getText(cupTextFinder), "How many cups would you like?");

      //tap on back button
        final backBtnFinder = find.byValueKey('back-btn');
        await driver.tap(backBtnFinder);

      //expect to be on the coffee selection screen and see "What coffee maker are you using"
        expect(await driver.getText(coffeeMakerTextFinder), "What coffee maker are you using?");
      });

      test('Checks that back button on recommend screen works for drip press', () async {
          final homebrewtextFinder = find.byValueKey('homebrew-text');
          expect(await driver.getText(homebrewtextFinder), "HOMEBREW");

        //expect to see "what coffee maker are you using"
          final coffeeMakerTextFinder = find.byValueKey('coffee-question-test');
          expect(await driver.getText(coffeeMakerTextFinder), "What coffee maker are you using?");

        //tap "drip press"
          final dripPressSelector = find.byValueKey('drip-press-selector');
          await driver.tap(dripPressSelector);

        //tap continue
          final contiueBtnFinder = find.byValueKey('continue-btn');
          await driver.tap(contiueBtnFinder);

        //expect to be on the coffee amount screen and see "How many cups would you like"
          final cupTextFinder = find.byValueKey('amountTitle-text');
          expect(await driver.getText(cupTextFinder), "How many cups would you like?");
      
        //tap button in cup amount when there is an item in the text field
          final cupTextField = find.byValueKey("cups-textfield");
          await driver.tap(cupTextField);
          //enter amount and tap continue
          await driver.enterText("5");
          await driver.tap(contiueBtnFinder);

          //check if in the next screen
          final recommendTextFinder = find.byValueKey('recommended-text');
          expect(await driver.getText(recommendTextFinder), "Recommended");

          //tap on the back button in the recomment page
          final backBtnFinder = find.byValueKey('back-btn');
          await driver.tap(backBtnFinder);

          //expect to be on the amount coffee page
          expect(await driver.getText(cupTextFinder), "How many cups would you like?");

          //tap the back button
          await driver.tap(backBtnFinder);

          //expect to be in the coffee selector page
          expect(await driver.getText(coffeeMakerTextFinder), "What coffee maker are you using?");
      });


      test('Checks for improper inputs works for Drip press', () async {
          final homebrewtextFinder = find.byValueKey('homebrew-text');
          expect(await driver.getText(homebrewtextFinder), "HOMEBREW");

        //expect to see "what coffee maker are you using"
          final coffeeMakerTextFinder = find.byValueKey('coffee-question-test');
          expect(await driver.getText(coffeeMakerTextFinder), "What coffee maker are you using?");

        //tap "drip press"
          final dripPressSelector = find.byValueKey('drip-press-selector');
          await driver.tap(dripPressSelector);

        //tap continue
          final contiueBtnFinder = find.byValueKey('continue-btn');
          await driver.tap(contiueBtnFinder);

        //expect to be on the coffee amount screen and see "How many cups would you like"
          final cupTextFinder = find.byValueKey('amountTitle-text');
          expect(await driver.getText(cupTextFinder), "How many cups would you like?");
      
        //tap button in cup amount when there is an item in the text field
        final cupTextField = find.byValueKey("cups-textfield");
         List<String> input = ['@', '-2', 'A', 'ras', '9.3', '%'];
         for (int i = 0; i < input.length; i++) {
            await driver.tap(cupTextField);
            await driver.enterText(input[i]);
            await driver.tap(contiueBtnFinder);
            expect(await driver.getText(cupTextFinder), "How many cups would you like?");
         }
      });

  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///Tests for french press that test:
  ///     -back button 
  ///     -continue button
  /// 

      test('Checks that the continue button on coffee selector for french press works ', () async {
        //expect HOMEBREW Screen
        final homebrewtextFinder = find.byValueKey('homebrew-text');
        expect(await driver.getText(homebrewtextFinder), "HOMEBREW");

      //expect to see "what coffee maker are you using"
        final coffeeMakerTextFinder = find.byValueKey('coffee-question-test');
        expect(await driver.getText(coffeeMakerTextFinder), "What coffee maker are you using?");

      //tap the button and check if still on the same screen
        final contiueBtnFinder = find.byValueKey('continue-btn');
        await driver.tap(contiueBtnFinder);
        expect(await driver.getText(coffeeMakerTextFinder), "What coffee maker are you using?");

        //select french press and tap continue
        final frenchPressSelector = find.byValueKey('french-press-selector');
        await driver.tap(frenchPressSelector);
        await driver.tap(contiueBtnFinder);

        //expect to be on amount of cups screen
        final cupTextFinder = find.byValueKey('amountTitle-text');
        expect(await driver.getText(cupTextFinder), "How many cups would you like?");
      });

      test('Checks that continue button on ammount screen works for French Press ', () async {
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
      //checks if in the amount screen
        final cupTextFinder = find.byValueKey('amountTitle-text');
        expect(await driver.getText(cupTextFinder), "How many cups would you like?");

        //tap button in cup amount when text field is empty
        await driver.tap(contiueBtnFinder);
        expect(await driver.getText(coffeeMakerTextFinder), "How many cups would you like?");

        //tap button in cup amount when there is an item in the text field
        final cupTextField = find.byValueKey("cups-textfield");
        await driver.tap(cupTextField);
        await driver.enterText("5");
        await driver.tap(contiueBtnFinder);

        //check if in the next screen
        final recommendTextFinder = find.byValueKey('recommended-text');
        expect(await driver.getText(recommendTextFinder), "Recommended");
      });

      test('Checks that back button on amount screen works for french press', () async {
        final homebrewtextFinder = find.byValueKey('homebrew-text');
        expect(await driver.getText(homebrewtextFinder), "HOMEBREW");

      //expect to see "what coffee maker are you using"
        final coffeeMakerTextFinder = find.byValueKey('coffee-question-test');
        expect(await driver.getText(coffeeMakerTextFinder), "What coffee maker are you using?");

      //tap "drip press"
        final frenchPressSelector = find.byValueKey('french-press-selector');
        await driver.tap(frenchPressSelector);

      //tap continue
        final contiueBtnFinder = find.byValueKey('continue-btn');
        await driver.tap(contiueBtnFinder);

      //expect to be on the coffee amount screen and see "How many cups would you like"
        final cupTextFinder = find.byValueKey('amountTitle-text');
        expect(await driver.getText(cupTextFinder), "How many cups would you like?");

      //tap on back button
        final backBtnFinder = find.byValueKey('back-btn');
        await driver.tap(backBtnFinder);

      //expect to be on the coffee selection screen and see "What coffee maker are you using"
        expect(await driver.getText(coffeeMakerTextFinder), "What coffee maker are you using?");
      });

      test('Checks that back button on recommend screen works for french press', () async {
          final homebrewtextFinder = find.byValueKey('homebrew-text');
          expect(await driver.getText(homebrewtextFinder), "HOMEBREW");

        //expect to see "what coffee maker are you using"
          final coffeeMakerTextFinder = find.byValueKey('coffee-question-test');
          expect(await driver.getText(coffeeMakerTextFinder), "What coffee maker are you using?");

        //tap "drip press"
          final frenchPressSelector = find.byValueKey('french-press-selector');
          await driver.tap(frenchPressSelector);

        //tap continue
          final contiueBtnFinder = find.byValueKey('continue-btn');
          await driver.tap(contiueBtnFinder);

        //expect to be on the coffee amount screen and see "How many cups would you like"
          final cupTextFinder = find.byValueKey('amountTitle-text');
          expect(await driver.getText(cupTextFinder), "How many cups would you like?");
      
        //tap button in cup amount when there is an item in the text field
          final cupTextField = find.byValueKey("cups-textfield");
          await driver.tap(cupTextField);
          //enter amount and tap continue
          await driver.enterText("5");
          await driver.tap(contiueBtnFinder);

          //check if in the next screen
          final recommendTextFinder = find.byValueKey('recommended-text');
          expect(await driver.getText(recommendTextFinder), "Recommended");

          //tap on the back button in the recomment page
          final backBtnFinder = find.byValueKey('back-btn');
          await driver.tap(backBtnFinder);

          //expect to be on the amount coffee page
          expect(await driver.getText(cupTextFinder), "How many cups would you like?");

          //tap the back button
          await driver.tap(backBtnFinder);

          //expect to be in the coffee selector page
          expect(await driver.getText(coffeeMakerTextFinder), "What coffee maker are you using?");
      });

    test('Checks for improper inputs works for french press', () async {
          final homebrewtextFinder = find.byValueKey('homebrew-text');
          expect(await driver.getText(homebrewtextFinder), "HOMEBREW");

        //expect to see "what coffee maker are you using"
          final coffeeMakerTextFinder = find.byValueKey('coffee-question-test');
          expect(await driver.getText(coffeeMakerTextFinder), "What coffee maker are you using?");

        //tap "drip press"
          final frenchPressSelector = find.byValueKey('french-press-selector');
          await driver.tap(frenchPressSelector);

        //tap continue
          final contiueBtnFinder = find.byValueKey('continue-btn');
          await driver.tap(contiueBtnFinder);

        //expect to be on the coffee amount screen and see "How many cups would you like"
          final cupTextFinder = find.byValueKey('amountTitle-text');
          expect(await driver.getText(cupTextFinder), "How many cups would you like?");
      
        //tap button in cup amount when there is an item in the text field
        final cupTextField = find.byValueKey("cups-textfield");
         List<String> input = ['@', '-2', 'A', 'r', '9.3', '%'];
         for (int i = 0; i < input.length; i++) {
            await driver.tap(cupTextField);
            await driver.enterText(input[i]);
            await driver.tap(contiueBtnFinder);
            expect(await driver.getText(cupTextFinder), "How many cups would you like?");
         }
      });





  });
}

