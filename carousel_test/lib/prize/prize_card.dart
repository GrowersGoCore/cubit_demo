import 'package:carousel_test/prize/prize.dart';
import 'package:flutter/material.dart';

class PrizeCard extends StatelessWidget {
  const PrizeCard({super.key, required this.prize});

  final Prize prize;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        title: Text(prize.name),
        subtitle: Text(prize.getCategoryName(prize.category)),
      ),
    );
  }
}
