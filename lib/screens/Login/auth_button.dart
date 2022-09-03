import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthButton extends StatelessWidget {
  final double height;
  final double width;
  final void Function()? onPressed;
  final String? text;
  final SvgPicture? image;
  const AuthButton({
    Key? key,
    this.onPressed,
    this.text,
    this.image,
    required this.height,
    required this.width,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            color: Colors.cyan[500],
            boxShadow: const [
              BoxShadow(
                  color: Colors.black45,
                  offset: Offset(0.0, 2.0),
                  blurRadius: 6.0),
            ]),
        child: Text(
          text!,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18.0),
        ),
      ),
    );
  }
}
