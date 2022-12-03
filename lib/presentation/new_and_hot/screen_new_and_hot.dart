
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/coming_soon.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/everyones_watching_widget.dart';

import '../../application/hot_and_new/hot_and_new_bloc.dart';
import '../../core/constants.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: const Text(
              'New & Hot',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            actions: [
              const Icon(
                Icons.cast,
                color: Colors.white,
                size: 30,
              ),
              kwidth,
              Container(
                width: 30,
                height: 20,
                color: Colors.blue,
              ),
              kwidth
            ],
            bottom: TabBar(
                isScrollable: true,
                labelColor: kBlackColor,
                unselectedLabelColor: kwhiteColor,
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                indicator: BoxDecoration(
                  color: kwhiteColor,
                  borderRadius: kRadius30,
                ),
                tabs: const [
                  Tab(
                    text: '🍿Coming Soon',
                  ),
                  Tab(
                    text: "👀 Everyones's watching",
                  )
                ]),
          ),
        ),
        body: const TabBarView(children: [
          ComingSoonList(key: Key('comming_soon')),
          EveryOneIsWatchingList(key: Key('every_one_is_watching')),
        ]),
      ),
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HotAndNewBloc>().add(const LoadDataInComingSoon());
    });
    return RefreshIndicator(
      onRefresh: () async {
        context.read<HotAndNewBloc>().add(const LoadDataInComingSoon());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            );
          } else if (state.hasError) {
            return const Center(
                child: Text('Error while loading coming soon List'));
          } else if (state.comingSoonList.isEmpty) {
            return const Center(child: Text('coming soon List is empty'));
          } else {
            return ListView.builder(
                padding: const EdgeInsets.only(top: 20),
                shrinkWrap: true,
                itemCount: state.comingSoonList.length,
                itemBuilder: (BuildContext context, index) {
                  final movie = state.comingSoonList[index];
                  if (movie.id == null) {
                    return const SizedBox();
                  }
                  // print();
                  final date = DateFormat.yMMMd()
                      .format(DateTime.parse(movie.releaseDate!));
                  // print('date: ${movie.releaseDate!.split('*')}');
                  return ComingSoonWidget(
                    id: movie.id.toString(),
                    month: date.split(' ').first,
                    day: movie.releaseDate!.split('-')[1],
                    posterPath: '$imageAppendUrl${movie.posterPath}',
                    movieName: movie.originalTitle ?? 'No title',
                    description: movie.overview ?? 'No Description',
                  );
                });
          }
        },
      ),
    );
  }
}

class EveryOneIsWatchingList extends StatelessWidget {
  const EveryOneIsWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HotAndNewBloc>().add(const LoadDataInEveryOneIsWatching());
    });
    return RefreshIndicator(
      onRefresh: () async {
        context.read<HotAndNewBloc>().add(const LoadDataInEveryOneIsWatching());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            );
          } else if (state.hasError) {
            return const Center(
                child: Text('Error while loading coming soon List'));
          } else if (state.everyOneIsWatchingList.isEmpty) {
            return const Center(child: Text('coming soon List is empty'));
          } else {
            return ListView.builder(
                padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                itemCount: state.everyOneIsWatchingList.length,
                itemBuilder: (BuildContext context, index) {
                  final tV = state.everyOneIsWatchingList[index];
                  print('name: ${tV.originalName}');
                  // print('title:${tV.originalName}');

                  if (tV.id == null) {
                    return const SizedBox();
                  }
                  return EveryonesWatchingWidgets(
                      posterPath: '$imageAppendUrl${tV.posterPath}',
                      movieName: tV.originalName ?? 'No Name Provided',
                      description: tV.overview ?? 'No Description');
                });
          }
        },
      ),
    );
  }
}
