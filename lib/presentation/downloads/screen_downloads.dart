import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/downloads/downloads_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/widgets/app_bar_widget.dart';

class ScreenDownload extends StatelessWidget {
  ScreenDownload({super.key});

  final _widgetList = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
              title: 'Downloads',
            )),
        body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) => _widgetList[index],
            separatorBuilder: (context, index) => const SizedBox(
                  height: 25,
                ),
            itemCount: _widgetList.length));
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownlodsImage());
    });
    // BlocProvider.of<DownloadsBloc>(context)
    //     .add(const DownloadsEvent.getDownlodsImage());
    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kwhiteColor,
            fontSize: 23.9,
            fontWeight: FontWeight.w900,
          ),
        ),
        kheight,
        const Text(
          textAlign: TextAlign.center,
          'we will download a personalized selection of\nmovies and shows for you, so there\nalways something to watch on your\ndevice',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        kheight,
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              // width: size.width,
              // height: size.width,
              child: state.isloading
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(alignment: Alignment.center, children: [
                      CircleAvatar(
                        radius: size.width * 0.3,
                        backgroundColor: Colors.grey.withOpacity(0.5),
                      ),
                      DownloadsImageWidgets(
                        imageList:
                            '$imageAppendUrl${state.downloads![0].posterPath}',
                        margin: const EdgeInsets.only(left: 170, top: 50),
                        angle: 25,
                        size: Size(size.width * 0.3, size.width * 0.4),
                      ),
                      DownloadsImageWidgets(
                        imageList:
                            '$imageAppendUrl${state.downloads![1].posterPath}',
                        margin: const EdgeInsets.only(right: 170, top: 50),
                        angle: -25,
                        size: Size(size.width * 0.3, size.width * 0.4),
                      ),
                      DownloadsImageWidgets(
                        imageList:
                            '$imageAppendUrl${state.downloads![2].posterPath}',
                        margin: const EdgeInsets.only(bottom: 35, top: 50),
                        size: Size(size.width * 0.35, size.width * 0.45),
                        radius: 8,
                      )
                    ]),
            );
          },
        ),
        kheight,
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kButtonColor,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text('Setup',
                  style: TextStyle(
                      color: kwhiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ),
        kheight,
        MaterialButton(
          color: kButtonwhiteColor,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text('See what you can download',
                style: TextStyle(
                    color: kBlackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
        )
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kwidth,
        Icon(
          Icons.settings,
          color: kwhiteColor,
        ),
        kwidth,
        Text(
          'Smart Downloads',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ],
    );
  }
}

class DownloadsImageWidgets extends StatelessWidget {
  const DownloadsImageWidgets({
    Key? key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
    this.radius = 10,
  }) : super(key: key);

  final double angle;
  final String imageList;
  final EdgeInsets margin;
  final Size size;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imageList),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
