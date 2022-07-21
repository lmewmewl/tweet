// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweet_vm.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TweetVM on _TweetVM, Store {
  late final _$currentReactionAtom =
      Atom(name: '_TweetVM.currentReaction', context: context);

  @override
  Reactions get currentReaction {
    _$currentReactionAtom.reportRead();
    return super.currentReaction;
  }

  @override
  set currentReaction(Reactions value) {
    _$currentReactionAtom.reportWrite(value, super.currentReaction, () {
      super.currentReaction = value;
    });
  }

  late final _$changeReactionStatusAsyncAction =
      AsyncAction('_TweetVM.changeReactionStatus', context: context);

  @override
  Future<void> changeReactionStatus(Reactions current, bool reacted,
      TweetModel model, String newReaction, int globalCount) {
    return _$changeReactionStatusAsyncAction.run(() => super
        .changeReactionStatus(
            current, reacted, model, newReaction, globalCount));
  }

  late final _$_updateReactionAsyncAction =
      AsyncAction('_TweetVM._updateReaction', context: context);

  @override
  Future<void> _updateReaction(TweetModel model) {
    return _$_updateReactionAsyncAction.run(() => super._updateReaction(model));
  }

  late final _$_TweetVMActionController =
      ActionController(name: '_TweetVM', context: context);

  @override
  int _countUpdate() {
    final _$actionInfo =
        _$_TweetVMActionController.startAction(name: '_TweetVM._countUpdate');
    try {
      return super._countUpdate();
    } finally {
      _$_TweetVMActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reactionCompare(String reaction) {
    final _$actionInfo = _$_TweetVMActionController.startAction(
        name: '_TweetVM.reactionCompare');
    try {
      return super.reactionCompare(reaction);
    } finally {
      _$_TweetVMActionController.endAction(_$actionInfo);
    }
  }

  @override
  Widget widgetReactionChange(Reactions reacts) {
    final _$actionInfo = _$_TweetVMActionController.startAction(
        name: '_TweetVM.widgetReactionChange');
    try {
      return super.widgetReactionChange(reacts);
    } finally {
      _$_TweetVMActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentReaction: ${currentReaction}
    ''';
  }
}
