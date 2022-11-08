import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'comment.freezed.dart';
// part 'comment.g.dart';

@unfreezed
class Comment with _$Comment {
  const Comment._();

  @Entity(realClass: Comment)
  factory Comment({
    @Id() @Default(0) int oid,
    required String id,
    required String chatId,
    required String content,
  }) = _Comment;

  // factory Comment.fromJson(Map<String, dynamic> json) =>
  //     _$CommentFromJson(json);
}
