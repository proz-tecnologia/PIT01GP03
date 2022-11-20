// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movement_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovementController on MovementControllerBase, Store {
  late final _$movementListMobxAtom =
      Atom(name: 'MovementControllerBase.movementListMobx', context: context);

  @override
  ObservableList<MovementModel> get movementListMobx {
    _$movementListMobxAtom.reportRead();
    return super.movementListMobx;
  }

  @override
  set movementListMobx(ObservableList<MovementModel> value) {
    _$movementListMobxAtom.reportWrite(value, super.movementListMobx, () {
      super.movementListMobx = value;
    });
  }

  late final _$movementModelControllerAtom = Atom(
      name: 'MovementControllerBase.movementModelController', context: context);

  @override
  MovementModel? get movementModelController {
    _$movementModelControllerAtom.reportRead();
    return super.movementModelController;
  }

  @override
  set movementModelController(MovementModel? value) {
    _$movementModelControllerAtom
        .reportWrite(value, super.movementModelController, () {
      super.movementModelController = value;
    });
  }

  late final _$MovementControllerBaseActionController =
      ActionController(name: 'MovementControllerBase', context: context);

  @override
  void addMovement() {
    final _$actionInfo = _$MovementControllerBaseActionController.startAction(
        name: 'MovementControllerBase.addMovement');
    try {
      return super.addMovement();
    } finally {
      _$MovementControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeMovement(MovementModel data) {
    final _$actionInfo = _$MovementControllerBaseActionController.startAction(
        name: 'MovementControllerBase.removeMovement');
    try {
      return super.removeMovement(data);
    } finally {
      _$MovementControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movementListMobx: ${movementListMobx},
movementModelController: ${movementModelController}
    ''';
  }
}
