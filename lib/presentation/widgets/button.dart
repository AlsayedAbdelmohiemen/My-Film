import 'package:flutter/material.dart';
import 'package:movie/common/constants/size_constants.dart';
import 'package:movie/presentation/themes/app_color.dart';


class Button extends StatelessWidget {
  final String text;
  final Function onPressed;

  const Button({
    required this.text,
    required this.onPressed, TextStyle? style,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.royalBlue,
            AppColor.violet,
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(Sizes.dimen_20),
        ),
      ),
      padding: EdgeInsets.symmetric(
          horizontal:
              Sizes.dimen_20), // Corrected the missing closing parenthesis
      margin: EdgeInsets.symmetric(
          vertical: Sizes.dimen_12), // Added the missing margin property
      height: Sizes.dimen_24,
      child: ElevatedButton(
        // Use ElevatedButton instead of FlatButton
        onPressed: () => onPressed(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
