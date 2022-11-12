import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_template/domain/entity/repository.dart';

import 'home_cubit.dart';

class HomePageContent extends StatelessWidget {
  HomePageContent({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(
              labelText: 'Enter Query',
              suffixIcon: IconButton(
                onPressed: () {
                  final bloc = BlocProvider.of<HomeCubit>(context);
                  bloc.search(_controller.text);
                },
                icon: Icon(Icons.search),
              ),
              border: OutlineInputBorder()),
        ),
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
        return Card(
          child: ListTile(
            title: Text(repo.name),
            subtitle: Text(
              repo.description ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }
}
