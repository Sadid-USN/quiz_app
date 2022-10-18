import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthButton extends StatelessWidget {
  final double height;
  final double width;
  final void Function()? onPressed;
  final String? title;
  final SvgPicture? image;
  const AuthButton({
    Key? key,
    this.onPressed,
    this.title,
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
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            color: Theme.of(context).cardColor,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(1.0, 1.0),
                  blurRadius: 2.0),
            ]),
        child: Text(
          title!,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.w600,
              fontSize: 18.0),
        ),
      ),
    );
  }
}
