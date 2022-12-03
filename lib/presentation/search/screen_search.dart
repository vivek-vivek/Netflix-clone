import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widget/search_idle.dart';
import 'package:netflix_clone/presentation/search/widget/search_result.dart';

import '../../application/search/search_bloc.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SearchBloc>().add(const Initialize());
    });
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          CupertinoSearchTextField(
            backgroundColor: Colors.grey.withOpacity(0.4),
            style: const TextStyle(color: Colors.white),
            prefixIcon: const Icon(
              CupertinoIcons.search,
              color: Colors.grey,
            ),
            suffixIcon: const Icon(
              CupertinoIcons.xmark_circle_fill,
              color: Colors.grey,
            ),
            onChanged: (value) {
              context.read<SearchBloc>().add(
                    SearchMovie(movieQuery: value),
                  );
            },
          ),
          kheight,
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.searchResultLis.isEmpty) {
                return const Expanded(child: SearchIdleWidget());
              } else {
                return const Expanded(child: SearchResultWidget());
              }
            },
          )
          // Expanded(child: SearchResultWidget())
        ],
      ),
    )));
  }
}
