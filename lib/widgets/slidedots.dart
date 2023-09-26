
import 'package:flutter/material.dart';

class SlideDots extends StatelessWidget {
  final bool isActive;
  const SlideDots(this.isActive, {super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(duration: const Duration(milliseconds: 150),
    margin: const EdgeInsets.symmetric(horizontal: 10),
    height: isActive? 12 : 8,
    width: isActive? 12 : 8,
    decoration: BoxDecoration(
      color: isActive? Theme.of(context).primaryColor : Colors.grey,
      borderRadius: const BorderRadius.all(Radius.circular(12))
    ),
    );
  }
}
