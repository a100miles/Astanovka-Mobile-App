import 'package:drift/drift.dart';
import 'open_connection.dart';

part 'app_database.g.dart';

class FavoritePlaces extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text()();
  TextColumn get placeId => text()();
  TextColumn get name => text()();
  TextColumn get address => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column<Object>>>? get uniqueKeys => [
        {userId, placeId},
      ];
}

@DriftDatabase(tables: [FavoritePlaces])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  @override
  int get schemaVersion => 1;

  Stream<List<FavoritePlace>> watchFavoritesForUser(String userIdValue) {
    return (select(favoritePlaces)
          ..where((t) => t.userId.equals(userIdValue))
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .watch();
  }

  Future<void> addOrUpdateFavorite({
    required String userIdValue,
    required String placeIdValue,
    required String nameValue,
    String? addressValue,
  }) async {
    await into(favoritePlaces).insert(
      FavoritePlacesCompanion.insert(
        userId: userIdValue,
        placeId: placeIdValue,
        name: nameValue,
        address: Value(addressValue),
      ),
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<int> removeFavorite({
    required String userIdValue,
    required String placeIdValue,
  }) {
    return (delete(favoritePlaces)
          ..where((t) => t.userId.equals(userIdValue) & t.placeId.equals(placeIdValue)))
        .go();
  }
}
