// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Comment {
  @Id()
  int get oid => throw _privateConstructorUsedError;
  @Id()
  set oid(int value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get chatId => throw _privateConstructorUsedError;
  set chatId(String value) => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  set content(String value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res>;
  $Res call({@Id() int oid, String id, String chatId, String content});
}

/// @nodoc
class _$CommentCopyWithImpl<$Res> implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  final Comment _value;
  // ignore: unused_field
  final $Res Function(Comment) _then;

  @override
  $Res call({
    Object? oid = freezed,
    Object? id = freezed,
    Object? chatId = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      chatId: chatId == freezed
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_CommentCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$$_CommentCopyWith(
          _$_Comment value, $Res Function(_$_Comment) then) =
      __$$_CommentCopyWithImpl<$Res>;
  @override
  $Res call({@Id() int oid, String id, String chatId, String content});
}

/// @nodoc
class __$$_CommentCopyWithImpl<$Res> extends _$CommentCopyWithImpl<$Res>
    implements _$$_CommentCopyWith<$Res> {
  __$$_CommentCopyWithImpl(_$_Comment _value, $Res Function(_$_Comment) _then)
      : super(_value, (v) => _then(v as _$_Comment));

  @override
  _$_Comment get _value => super._value as _$_Comment;

  @override
  $Res call({
    Object? oid = freezed,
    Object? id = freezed,
    Object? chatId = freezed,
    Object? content = freezed,
  }) {
    return _then(_$_Comment(
      oid: oid == freezed
          ? _value.oid
          : oid // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      chatId: chatId == freezed
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@Entity(realClass: Comment)
class _$_Comment extends _Comment {
  _$_Comment(
      {@Id() this.oid = 0,
      required this.id,
      required this.chatId,
      required this.content})
      : super._();

  @override
  @JsonKey()
  @Id()
  int oid;
  @override
  String id;
  @override
  String chatId;
  @override
  String content;

  @override
  String toString() {
    return 'Comment(oid: $oid, id: $id, chatId: $chatId, content: $content)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_CommentCopyWith<_$_Comment> get copyWith =>
      __$$_CommentCopyWithImpl<_$_Comment>(this, _$identity);
}

abstract class _Comment extends Comment {
  factory _Comment(
      {@Id() int oid,
      required String id,
      required String chatId,
      required String content}) = _$_Comment;
  _Comment._() : super._();

  @override
  @Id()
  int get oid;
  @Id()
  set oid(int value);
  @override
  String get id;
  set id(String value);
  @override
  String get chatId;
  set chatId(String value);
  @override
  String get content;
  set content(String value);
  @override
  @JsonKey(ignore: true)
  _$$_CommentCopyWith<_$_Comment> get copyWith =>
      throw _privateConstructorUsedError;
}
