import 'package:flutter/material.dart';

class RowDetailsClient extends StatelessWidget {
  final String textFirst;
  final String textSecond;

  const RowDetailsClient({
    super.key,
    required this.textFirst,
    required this.textSecond,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 25,
      ),
      child: Row(
        children: [
          Text(
            '$textFirst: ',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            textSecond,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
