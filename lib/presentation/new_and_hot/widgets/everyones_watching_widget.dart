import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../home/widgets/custom_button_widgets.dart';
import '../../widgets/video_widget.dart';

class EveryonesWatchingWidgets extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;

  const EveryonesWatchingWidgets({
    Key? key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        VideoWidget(imageUrl: posterPath),
        kheight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ColumTextButton(
              icon: Icons.send,
              title: 'Share',
              iconsize: 25,
              textize: 16,
            ),
            kwidth,
            ColumTextButton(
              icon: Icons.add,
              title: 'My List',
              iconsize: 25,
              textize: 16,
            ),
            kwidth,
            ColumTextButton(
              icon: Icons.play_arrow,
              title: 'Play',
              iconsize: 25,
              textize: 16,
            ),
            kwidth,
          ],
        ),
        Text(
          movieName,
          style: const TextStyle(
            color: kwhiteColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        kheight,
        Text(
          description,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              color: kGreyColor,
              // fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
