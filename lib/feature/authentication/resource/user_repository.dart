import 'dart:async';
import 'package:flutter_project_template/common/data/model/models.dart';
import 'package:flutter_project_template/common/data/repository/disposable_repository.dart';
import 'package:rxdart/subjects.dart';

class UserRepository implements DisposableRepository  {
  UserRepository();

  // This is a false positive in the dart linter dart-lang/linter#1381.
  // ignore: close_sinks
  BehaviorSubject<AppUser?> _user = BehaviorSubject.seeded(null);

  Stream<AppUser?> get currentUserStream => _user.stream;

  AppUser? get currentUser => _user.hasValue ? _user.value : null;

  @override
  Future<void> dispose() async {}
}
