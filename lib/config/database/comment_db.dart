import 'package:hive_flutter/hive_flutter.dart';

import '../../models/comment/comment.dart';
import '../../utils/keys.dart';

class CommentsStore {
  Box box = Hive.box(DBKeys.comments);
  bool _initialized = false;

  bool getInitialized() {
    return box.get('initialized', defaultValue: _initialized);
  }

  Future<bool> initComments() async {
    if (box.get('initialized', defaultValue: false)) {
      _initialized = true;
      box.put('initialzed', true);
    }
    return true;
  }

  Future<bool> addComment(Comment comment) async {
    if (box.get("${comment.chatId}.${comment.id}") == null) {
      // box.put("${comment.chatId}.${comment.id}", jsonEncode(comment.toJson()));
    }
    return true;
  }

  Future<Comment?> getComment(String id) async {
    return box.get(id);
  }

  Future<int> setConfig(Map<String, dynamic> value) {
    return box.add(value);
  }
}
