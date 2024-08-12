import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/util/string_util.dart';

class TypeTileWidget extends StatelessWidget {
  const TypeTileWidget({
    super.key,
    required this.type,
    required this.color,
    this.isSmall = false,
  });

  final String type;
  final Color color;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isSmall ? 60 : 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Text(
          StringUtil.formatName(type),
          style: TextStyle(
            fontSize: isSmall ? 12 : 14,
            fontWeight: FontWeight.bold,
            color: Colors.black.withAlpha(130),
          ),
        ),
      ),
    );
  }
}
