import 'package:flutter/material.dart';
import 'package:flutter_project_template/domain/domain.dart';

class RepoListItem extends StatelessWidget {
  final Repository repository;

  const RepoListItem({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      key: ValueKey(repository.id),
      child: ListTile(
        title: Text(repository.name),
        subtitle: Text(
          repository.description ?? "",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
