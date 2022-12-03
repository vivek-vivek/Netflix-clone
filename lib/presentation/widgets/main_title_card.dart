import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../search/widget/search_result.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    Key? key,
    required this.title, required this.posterList,
  }) : super(key: key);

  final String title;
  final List<String> posterList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              posterList.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: kRadius10,
                  image:  DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(posterList[index]),
                  ),
                ),
              ),
            ),
          ),
        ),
        kheight,
      ],
    );
  }
}
