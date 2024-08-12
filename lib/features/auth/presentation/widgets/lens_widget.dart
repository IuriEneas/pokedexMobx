import 'package:flutter/material.dart';

class LensWidget extends StatelessWidget {
  const LensWidget({super.key, required this.percent, this.onTap});

  final int percent;
  final double size = 130;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(130),
            color: _color(percent),
          ),
          height: size,
          width: size,
          child: Stack(
            children: [
              Container(
                color: Colors.grey[200],
                height: size - (size * (percent / 100)),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: onTap,
                child: Container(
                  height: size,
                  width: size,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.transparent,
                    border: Border.all(
                      width: 10,
                      color: const Color.fromARGB(255, 193, 193, 193),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 35,
          left: 35,
          child: Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(10, 10),
                topLeft: Radius.elliptical(40, 40),
                bottomRight: Radius.elliptical(40, 40),
                topRight: Radius.elliptical(10, 10),
              ),
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Color _color(int value) {
    if (value <= 16) {
      return Colors.red;
    } else if (value <= 32) {
      return Colors.orange;
    } else if (value <= 48) {
      return Colors.amber;
    } else if (value <= 64) {
      return Colors.lightGreen;
    } else if (value <= 80) {
      return Colors.green;
    } else {
      return Colors.blue as Color;
    }
  }
}
