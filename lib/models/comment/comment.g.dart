// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Comment _$$_CommentFromJson(Map<String, dynamic> json) => _$_Comment(
      id: json['id'] as String,
      chatId: json['chatId'] as String,
      content: json['content'] as String,
      roomId: json['roomId'] as String,
    );

Map<String, dynamic> _$$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chatId': instance.chatId,
      'content': instance.content,
      'roomId': instance.roomId,
    };
