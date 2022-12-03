import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/home/home_bloc.dart';

import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/background_card.dart';
import 'package:netflix_clone/presentation/home/widgets/number_card.dart';

import '../widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBloc>().add(const GetHomeScreenData());
    });
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (context, value, child) =>
            NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final direction = notification.direction;
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },
          child: Stack(children: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  );
                } else if (state.isError) {
                  return const Center(
                      child: Text(
                    'Error while loading coming soon List',
                    style: TextStyle(color: Colors.white),
                  ));
                }
// released past year
                final _releasePastYear = state.pastYearMovieList.map((m) {
                  return '$imageAppendUrl${m.posterPath}';
                }).toList();

// trending
                final _trending = state.trendingMovieList.map((m) {
                  return '$imageAppendUrl${m.posterPath}';
                }).toList();

// tense dramas
                final _tenseDramas = state.tenseDramasMovieLis.map((m) {
                  return '$imageAppendUrl${m.posterPath}';
                }).toList();

// south Indian Cinema
                final _southIndianCinema = state.southIndianMovieList.map((m) {
                  return '$imageAppendUrl${m.posterPath}';
                }).toList();
                // south Indian Cinema
                final _trendingTVList = state.trendingTVList.map((m) {
                  return '$imageAppendUrl${m.posterPath}';
                }).toList();

                _releasePastYear.shuffle();
                _southIndianCinema.shuffle();
                _tenseDramas.shuffle();
                _trending.shuffle();
                _trendingTVList.shuffle();

                return ListView(
                  children: [
                    const BackgroundCard(),
                    MainTitleCard(
                        title: 'Released in the past year',
                        posterList: _releasePastYear.sublist(0, 10)),
                    MainTitleCard(
                        title: 'Trending Now',
                        posterList: _trending.sublist(0, 10)),
                    NumberCard(postersList: _trendingTVList.sublist(0, 10)),
                    MainTitleCard(
                        title: 'Tense Dramas',
                        posterList: _tenseDramas.sublist(0, 10)),
                    MainTitleCard(
                        title: 'South Indian Cinema',
                        posterList: _southIndianCinema.sublist(0, 10)),
                  ],
                );
              },
            ),
            scrollNotifier.value == true
                ? AnimatedContainer(
                    duration: const Duration(microseconds: 1000),
                    child: Container(
                      width: double.infinity,
                      height: 90,
                      color: Colors.black.withOpacity(0.35),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/netflix.png",
                                  fit: BoxFit.cover,
                                  height: 40,
                                  width: 50,
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.cast,
                                  color: Colors.white,
                                ),
                                kwidth,
                                Container(
                                  width: 20,
                                  height: 20,
                                  color: Colors.blue,
                                ),
                                kwidth
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('TV Shows', style: kHomeTitleText),
                              Text('Movies', style: kHomeTitleText),
                              Text('Categories', style: kHomeTitleText),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : kheight
          ]),
        ),
      ),
    );
  }
}
