// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $FavoritePlacesTable extends FavoritePlaces
    with TableInfo<$FavoritePlacesTable, FavoritePlace> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoritePlacesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _placeIdMeta = const VerificationMeta(
    'placeId',
  );
  @override
  late final GeneratedColumn<String> placeId = GeneratedColumn<String>(
    'place_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    placeId,
    name,
    address,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_places';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoritePlace> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('place_id')) {
      context.handle(
        _placeIdMeta,
        placeId.isAcceptableOrUnknown(data['place_id']!, _placeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_placeIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {userId, placeId},
  ];
  @override
  FavoritePlace map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoritePlace(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      placeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}place_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $FavoritePlacesTable createAlias(String alias) {
    return $FavoritePlacesTable(attachedDatabase, alias);
  }
}

class FavoritePlace extends DataClass implements Insertable<FavoritePlace> {
  final int id;
  final String userId;
  final String placeId;
  final String name;
  final String? address;
  final DateTime createdAt;
  const FavoritePlace({
    required this.id,
    required this.userId,
    required this.placeId,
    required this.name,
    this.address,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['place_id'] = Variable<String>(placeId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  FavoritePlacesCompanion toCompanion(bool nullToAbsent) {
    return FavoritePlacesCompanion(
      id: Value(id),
      userId: Value(userId),
      placeId: Value(placeId),
      name: Value(name),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      createdAt: Value(createdAt),
    );
  }

  factory FavoritePlace.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoritePlace(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      placeId: serializer.fromJson<String>(json['placeId']),
      name: serializer.fromJson<String>(json['name']),
      address: serializer.fromJson<String?>(json['address']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'placeId': serializer.toJson<String>(placeId),
      'name': serializer.toJson<String>(name),
      'address': serializer.toJson<String?>(address),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  FavoritePlace copyWith({
    int? id,
    String? userId,
    String? placeId,
    String? name,
    Value<String?> address = const Value.absent(),
    DateTime? createdAt,
  }) => FavoritePlace(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    placeId: placeId ?? this.placeId,
    name: name ?? this.name,
    address: address.present ? address.value : this.address,
    createdAt: createdAt ?? this.createdAt,
  );
  FavoritePlace copyWithCompanion(FavoritePlacesCompanion data) {
    return FavoritePlace(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      placeId: data.placeId.present ? data.placeId.value : this.placeId,
      name: data.name.present ? data.name.value : this.name,
      address: data.address.present ? data.address.value : this.address,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoritePlace(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('placeId: $placeId, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, placeId, name, address, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoritePlace &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.placeId == this.placeId &&
          other.name == this.name &&
          other.address == this.address &&
          other.createdAt == this.createdAt);
}

class FavoritePlacesCompanion extends UpdateCompanion<FavoritePlace> {
  final Value<int> id;
  final Value<String> userId;
  final Value<String> placeId;
  final Value<String> name;
  final Value<String?> address;
  final Value<DateTime> createdAt;
  const FavoritePlacesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.placeId = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  FavoritePlacesCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String placeId,
    required String name,
    this.address = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : userId = Value(userId),
       placeId = Value(placeId),
       name = Value(name);
  static Insertable<FavoritePlace> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<String>? placeId,
    Expression<String>? name,
    Expression<String>? address,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (placeId != null) 'place_id': placeId,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  FavoritePlacesCompanion copyWith({
    Value<int>? id,
    Value<String>? userId,
    Value<String>? placeId,
    Value<String>? name,
    Value<String?>? address,
    Value<DateTime>? createdAt,
  }) {
    return FavoritePlacesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      placeId: placeId ?? this.placeId,
      name: name ?? this.name,
      address: address ?? this.address,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (placeId.present) {
      map['place_id'] = Variable<String>(placeId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritePlacesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('placeId: $placeId, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FavoritePlacesTable favoritePlaces = $FavoritePlacesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favoritePlaces];
}

typedef $$FavoritePlacesTableCreateCompanionBuilder =
    FavoritePlacesCompanion Function({
      Value<int> id,
      required String userId,
      required String placeId,
      required String name,
      Value<String?> address,
      Value<DateTime> createdAt,
    });
typedef $$FavoritePlacesTableUpdateCompanionBuilder =
    FavoritePlacesCompanion Function({
      Value<int> id,
      Value<String> userId,
      Value<String> placeId,
      Value<String> name,
      Value<String?> address,
      Value<DateTime> createdAt,
    });

class $$FavoritePlacesTableFilterComposer
    extends Composer<_$AppDatabase, $FavoritePlacesTable> {
  $$FavoritePlacesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get placeId => $composableBuilder(
    column: $table.placeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FavoritePlacesTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoritePlacesTable> {
  $$FavoritePlacesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get placeId => $composableBuilder(
    column: $table.placeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavoritePlacesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoritePlacesTable> {
  $$FavoritePlacesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get placeId =>
      $composableBuilder(column: $table.placeId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$FavoritePlacesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoritePlacesTable,
          FavoritePlace,
          $$FavoritePlacesTableFilterComposer,
          $$FavoritePlacesTableOrderingComposer,
          $$FavoritePlacesTableAnnotationComposer,
          $$FavoritePlacesTableCreateCompanionBuilder,
          $$FavoritePlacesTableUpdateCompanionBuilder,
          (
            FavoritePlace,
            BaseReferences<_$AppDatabase, $FavoritePlacesTable, FavoritePlace>,
          ),
          FavoritePlace,
          PrefetchHooks Function()
        > {
  $$FavoritePlacesTableTableManager(
    _$AppDatabase db,
    $FavoritePlacesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoritePlacesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoritePlacesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoritePlacesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> placeId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => FavoritePlacesCompanion(
                id: id,
                userId: userId,
                placeId: placeId,
                name: name,
                address: address,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String userId,
                required String placeId,
                required String name,
                Value<String?> address = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => FavoritePlacesCompanion.insert(
                id: id,
                userId: userId,
                placeId: placeId,
                name: name,
                address: address,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavoritePlacesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoritePlacesTable,
      FavoritePlace,
      $$FavoritePlacesTableFilterComposer,
      $$FavoritePlacesTableOrderingComposer,
      $$FavoritePlacesTableAnnotationComposer,
      $$FavoritePlacesTableCreateCompanionBuilder,
      $$FavoritePlacesTableUpdateCompanionBuilder,
      (
        FavoritePlace,
        BaseReferences<_$AppDatabase, $FavoritePlacesTable, FavoritePlace>,
      ),
      FavoritePlace,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FavoritePlacesTableTableManager get favoritePlaces =>
      $$FavoritePlacesTableTableManager(_db, _db.favoritePlaces);
}
