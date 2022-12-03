import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/presentation/search/widget/title.dart';

import '../../../application/search/search_bloc.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Top Searches'),
        kheight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.isError) {
                return const Center(
                  child: Text('Error While getting data '),
                );
              } else if (state.idleList.isEmpty) {
                return const Center(child: Text('List is empty '));
              } else {
                return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => TopSearchItemTile(
                      title: state.idleList[index].title ?? 'No title provided',
                      imageUrl:
                          "$imageAppendUrl${state.idleList[index].posterPath}"),
                  separatorBuilder: (context, index) => kheight20,
                  itemCount: state.idleList.length,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearchItemTile(
      {super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        SizedBox(
          width: 3,
        ),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: kwhiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const CircleAvatar(
          backgroundColor: kwhiteColor,
          radius: 22,
          child: CircleAvatar(
            backgroundColor: kBlackColor,
            radius: 20,
            child: Padding(
              padding: EdgeInsets.only(left: 5),
              child: Icon(CupertinoIcons.play_fill),
            ),
          ),
        ),
      ],
    );
  }
}
