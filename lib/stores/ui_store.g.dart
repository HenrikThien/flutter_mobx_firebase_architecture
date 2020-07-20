// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ui_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UIStore on UIStoreBase, Store {
  Computed<String> _$userDisplayNameComputed;

  @override
  String get userDisplayName => (_$userDisplayNameComputed ??= Computed<String>(
          () => super.userDisplayName,
          name: 'UIStoreBase.userDisplayName'))
      .value;

  final _$userAtom = Atom(name: 'UIStoreBase.user');

  @override
  FirebaseUser get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(FirebaseUser value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$initializeAsyncAction = AsyncAction('UIStoreBase.initialize');

  @override
  Future<void> initialize() {
    return _$initializeAsyncAction.run(() => super.initialize());
  }

  @override
  String toString() {
    return '''
user: ${user},
userDisplayName: ${userDisplayName}
    ''';
  }
}
