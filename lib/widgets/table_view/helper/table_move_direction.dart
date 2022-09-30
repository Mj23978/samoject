enum TableMoveDirection {
  left,
  right,
  up,
  down;

  bool get horizontal {
    switch (this) {
      case TableMoveDirection.left:
      case TableMoveDirection.right:
        return true;
      default:
        return false;
    }
  }

  bool get vertical {
    switch (this) {
      case TableMoveDirection.up:
      case TableMoveDirection.down:
        return true;
      default:
        return false;
    }
  }

  int get offset {
    switch (this) {
      case TableMoveDirection.left:
      case TableMoveDirection.up:
        return -1;
      case TableMoveDirection.right:
      case TableMoveDirection.down:
        return 1;
      default:
        return 0;
    }
  }

  bool get isLeft {
    return TableMoveDirection.left == this;
  }

  bool get isRight {
    return TableMoveDirection.right == this;
  }

  bool get isUp {
    return TableMoveDirection.up == this;
  }

  bool get isDown {
    return TableMoveDirection.down == this;
  }
}
