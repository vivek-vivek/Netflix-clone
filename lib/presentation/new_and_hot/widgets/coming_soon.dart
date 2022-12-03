import 'package:flutter/cupertino.dart';

import 'package:netflix_clone/presentation/widgets/video_widget.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../home/widgets/custom_button_widgets.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingSoonWidget({
    Key? key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                month,
                style: const TextStyle(color: kGreyColor, fontSize: 16),
              ),
              Text(
                day,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(imageUrl: posterPath),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ColumTextButton(
                    icon: CupertinoIcons.bell,
                    title: "Remind me",
                    iconsize: 20,
                    textize: 12,
                  ),
                  kwidth,
                  ColumTextButton(
                    icon: CupertinoIcons.info,
                    title: "Info",
                    iconsize: 20,
                    textize: 12,
                  ),
                  kwidth,
                ],
              ),
              Text('Coming on $day $month'),
              kheight,
              Text(
                movieName,
                style: const TextStyle(
                  color: kwhiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
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
              )
            ],
          ),
        ),
      ],
    );
  }
}
