import 'package:bmi_calculator/constants/strings.dart';
import 'package:flutter/material.dart';

class GenderContainer extends StatelessWidget {
  final String imageLocation;
  final String gender;
  final bool isMale;

  const GenderContainer(
      {Key? key,
      required this.gender,
      required this.imageLocation,
      required this.isMale})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isMale
            ? gender == KMale
                ? Colors.blueAccent
                : Colors.grey[300]
            : gender == KFemale
                ? Colors.blueAccent
                : Colors.grey[300],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Image(
              image: AssetImage(
                imageLocation,
              ),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            gender,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
