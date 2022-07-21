// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweets_count.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TweetsCount on _TweetsCount, Store {
  late final _$reactionsCountAtom =
      Atom(name: '_TweetsCount.reactionsCount', context: context);

  @override
  int get reactionsCount {
    _$reactionsCountAtom.reportRead();
    return super.reactionsCount;
  }

  @override
  set reactionsCount(int value) {
    _$reactionsCountAtom.reportWrite(value, super.reactionsCount, () {
      super.reactionsCount = value;
    });
  }

  @override
  String toString() {
    return '''
reactionsCount: ${reactionsCount}
    ''';
  }
}
