import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_template/domain/entity/repository.dart';
import 'package:flutter_project_template/ui/home/query_input.dart';

import 'home_cubit.dart';
import 'repo_list_item.dart';

class HomePageContent extends StatelessWidget {
  HomePageContent({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QueryInput(textEditingController: _controller),
        Expanded(
          child: buildContent(context),
        )
      ],
    );
  }

  Widget buildContent(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is HomeErrorState) {
          final error = state.error;
          return Padding(
            padding: EdgeInsets.only(top: 200),
            child: Center(
              child: Text(error.message),
            ),
          );
        } else if (state is HomeSuccessState) {
          final repositories = state.repositories;
          return buildList(repositories);
        }
        return Padding(
            padding: EdgeInsets.only(top: 200),
            child: Container(child: Text("Enter keyword to search on github")));
      },
    );
  }

  Widget buildList(List<Repository> repository) {
    return ListView.builder(
      itemCount: repository.length,
      itemBuilder: (context, index) {
        final repo = repository[index];
        return RepoListItem(repository: repo);
      },
    );
  }
}
