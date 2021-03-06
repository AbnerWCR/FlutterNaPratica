// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Controller on ControllerBase, Store {
  late final _$countAtom = Atom(name: 'ControllerBase.count', context: context);

  @override
  int get count {
    _$countAtom.reportRead();
    return super.count;
  }

  @override
  set count(int value) {
    _$countAtom.reportWrite(value, super.count, () {
      super.count = value;
    });
  }

  late final _$count2Atom =
      Atom(name: 'ControllerBase.count2', context: context);

  @override
  int get count2 {
    _$count2Atom.reportRead();
    return super.count2;
  }

  @override
  set count2(int value) {
    _$count2Atom.reportWrite(value, super.count2, () {
      super.count2 = value;
    });
  }

  late final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase', context: context);

  @override
  void increment() {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void plus() {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.plus');
    try {
      return super.plus();
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
count: ${count},
count2: ${count2}
    ''';
  }
}
