enum SamojectTableMoveDirection {
  left,
  right,
  up,
  down;

  bool get horizontal {
    switch (this) {
      case SamojectTableMoveDirection.left:
      case SamojectTableMoveDirection.right:
        return true;
      default:
        return false;
    }
  }

  bool get vertical {
    switch (this) {
      case SamojectTableMoveDirection.up:
      case SamojectTableMoveDirection.down:
        return true;
      default:
        return false;
    }
  }

  int get offset {
    switch (this) {
      case SamojectTableMoveDirection.left:
      case SamojectTableMoveDirection.up:
        return -1;
      case SamojectTableMoveDirection.right:
      case SamojectTableMoveDirection.down:
        return 1;
      default:
        return 0;
    }
  }

  bool get isLeft {
    return SamojectTableMoveDirection.left == this;
  }

  bool get isRight {
    return SamojectTableMoveDirection.right == this;
  }

  bool get isUp {
    return SamojectTableMoveDirection.up == this;
  }

  bool get isDown {
    return SamojectTableMoveDirection.down == this;
  }
}
