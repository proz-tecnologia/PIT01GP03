import 'package:mobx/mobx.dart';
import 'package:projeto_flutter/data/dummy_movement.dart';
import 'package:projeto_flutter/models/movement.dart';

part 'movement_controller.g.dart';

class MovementController = MovementControllerBase with _$MovementController;

abstract class MovementControllerBase with Store {
  
  @observable
  var movementListMobx = <MovementModel>[...dummyMovement].asObservable();

  @observable
  MovementModel? movementModelController;

  @action
  void addMovement() {}

  @action
  void removeMovement(MovementModel data) {
    movementListMobx.removeWhere((element) => data == element);
  }
}
