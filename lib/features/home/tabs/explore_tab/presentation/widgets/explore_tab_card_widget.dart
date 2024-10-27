import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExploreTabCardWidget extends StatelessWidget {
  const ExploreTabCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 14),
            height: 80,
            child: const Card(
              child: Row(
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  Icon(
                    Icons.error,
                    size: 40,
                  ),
                  SizedBox(
                    width: 14.5,
                  ),
                  Text('Language')
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
