enum SamojectListMoveDirection {
  left,
  right,
  up,
  down;

  bool get horizontal {
    switch (this) {
      case SamojectListMoveDirection.left:
      case SamojectListMoveDirection.right:
        return true;
      default:
        return false;
    }
  }

  bool get vertical {
    switch (this) {
      case SamojectListMoveDirection.up:
      case SamojectListMoveDirection.down:
        return true;
      default:
        return false;
    }
  }

  int get offset {
    switch (this) {
      case SamojectListMoveDirection.left:
      case SamojectListMoveDirection.up:
        return -1;
      case SamojectListMoveDirection.right:
      case SamojectListMoveDirection.down:
        return 1;
      default:
        return 0;
    }
  }

  bool get isLeft {
    return SamojectListMoveDirection.left == this;
  }

  bool get isRight {
    return SamojectListMoveDirection.right == this;
  }

  bool get isUp {
    return SamojectListMoveDirection.up == this;
  }

  bool get isDown {
    return SamojectListMoveDirection.down == this;
  }
}
