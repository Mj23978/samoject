import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const Comment._();
  const factory Comment({
    required String id,
    required String chatId,
    required String content,
    required String roomId,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
