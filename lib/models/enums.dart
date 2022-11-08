
enum SpaceType {

  box("box"),
  list("list"),
  board("board"),
  none("none");

  final String type;

  const SpaceType(this.type);

}

extension SpaceTypeEnum on String {
  SpaceType toSpaceType() {
    switch (this) {
      case "box":
        return SpaceType.box;
      case "list":
        return SpaceType.list;
      case "board":
        return SpaceType.board;
      default:
        return SpaceType.none;
    }
  }
}