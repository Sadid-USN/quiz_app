import 'package:flutter/material.dart';

class ContetArea extends StatelessWidget {
  final bool addPadding;
  final Widget child;

  const ContetArea({Key? key, required this.child, this.addPadding = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(top: 50),
      height: MediaQuery.of(context).size.height / 2 * 2,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: addPadding ? Colors.black12 : Colors.white70,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: child,
    );
  }
}
