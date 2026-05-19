import 'package:drift/drift.dart';
// ignore_for_file: deprecated_member_use
import 'package:drift/web.dart';

QueryExecutor openConnectionImpl() {
  return WebDatabase('app_db');
}
