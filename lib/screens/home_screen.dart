import 'dart:math';

import 'package:bmi_calculator/constants/strings.dart';
import 'package:bmi_calculator/provider_logic/my_provider.dart';
import 'package:bmi_calculator/shared_widgets/circular_avatar.dart';
import 'package:bmi_calculator/shared_widgets/gender_container.dart';
import 'package:bmi_calculator/shared_widgets/my_custom_text.dart';
import 'package:provider/provider.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
    );
    var valueProvider = Provider.of<MyProvider>(context);
    var methodProvider = Provider.of<MyProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(KHomeScreenTitle),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                        onTap: () {
                          methodProvider.isMaleTrue();
                        },
                        child: GenderContainer(
                            gender: KMale,
                            imageLocation: KMaleImageLocation,
                            isMale: valueProvider.isMale)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        methodProvider.isMaleFalse();
                      },
                      child: GenderContainer(
                          gender: KFemale,
                          imageLocation: KFemaleImageLocation,
                          isMale: valueProvider.isMale),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey[300],
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  KHeight.toUpperCase(),
                  style: textStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.ideographic,
                  children: [
                    MyCustomText(title: '${valueProvider.height.toInt()}'),
                    Text(
                      'CM'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                Slider(
                  value: valueProvider.height,
                  onChanged: (value) {
                    setState(() {
                      valueProvider.height = value;
                    });
                  },
                  min: 120,
                  max: 220,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircularAvatar(
                        onTab: () {
                          return methodProvider.decreesHeight();
                        },
                        icon: Icon(Icons.remove),
                      ),
                      CircularAvatar(
                        onTab: () {
                          return methodProvider.increaseHeight();
                        },
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey[300],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          KWeight.toUpperCase(),
                          style: textStyle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            MyCustomText(
                                title: '${valueProvider.weight}'.toUpperCase()),
                            Text(
                              'KG'.toUpperCase(),
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularAvatar(
                              onTab: () {
                                return methodProvider.decreesWeight();
                              },
                              icon: Icon(Icons.remove),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            CircularAvatar(
                              onTab: () {
                                return methodProvider.increaseWeight();
                              },
                              icon: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .075,
            child: ElevatedButton(
              onPressed: () {
                methodProvider.setResult();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(),
                  ),
                );
              },
              child: Text(
                KButtonValue.toUpperCase(),
                style: textStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
