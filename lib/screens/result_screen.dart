import 'package:bmi_calculator/shared_widgets/my_custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/strings.dart';
import '../provider_logic/my_provider.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle=TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
    );
    var valueProvider = Provider.of<MyProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(KResultScreenTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$KGender: ${valueProvider.isMale ? "Male" : "Female"}',
                style: textStyle),
            SizedBox(height: 10),
            Text('$KHeight: ${valueProvider.height.round()}', style: textStyle),
            SizedBox(height: 10),
            Text('$KWeight: ${valueProvider.weight}', style: textStyle),
            SizedBox(height: 10),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 120,
              color: Colors.grey[300],
              alignment: Alignment.center,
              child: finalResult(valueProvider.result),
            ),
          ],
        ),
      ),
    );
  }

  Widget finalResult(result) {
    if (result < 18.5) {
      return MyCustomText(title: KThinResult);
    } else if (result < 24.9) {
      return MyCustomText(title: KNormalResult);
    } else if (result < 29.9) {
      return MyCustomText(title: KOverWeightResult);
    } else {
      return MyCustomText(title: KObeseResult);
    }
  }
}
