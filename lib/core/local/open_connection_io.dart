import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

QueryExecutor openConnectionImpl() {
  return LazyDatabase(() async {
    final Directory documentsDir = await getApplicationDocumentsDirectory();
    final file = File(p.join(documentsDir.path, 'app.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

