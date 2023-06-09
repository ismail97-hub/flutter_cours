// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ClientDAO? _clientDaoInstance;

  ProduitDAO? _produitDAOInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Client` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `username` TEXT NOT NULL, `password` TEXT NOT NULL, `telephone` TEXT NOT NULL, `role` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Produit` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `designation` TEXT NOT NULL, `image` TEXT, `pu` REAL NOT NULL, `qte` INTEGER NOT NULL, `clientId` INTEGER NOT NULL, `date` TEXT NOT NULL, `heure` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ClientDAO get clientDao {
    return _clientDaoInstance ??= _$ClientDAO(database, changeListener);
  }

  @override
  ProduitDAO get produitDAO {
    return _produitDAOInstance ??= _$ProduitDAO(database, changeListener);
  }
}

class _$ClientDAO extends ClientDAO {
  _$ClientDAO(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _clientInsertionAdapter = InsertionAdapter(
            database,
            'Client',
            (Client item) => <String, Object?>{
                  'id': item.id,
                  'username': item.username,
                  'password': item.password,
                  'telephone': item.telephone,
                  'role': item.role
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Client> _clientInsertionAdapter;

  @override
  Future<List<Client>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM Client',
        mapper: (Map<String, Object?> row) => Client(
            row['id'] as int?,
            row['username'] as String,
            row['password'] as String,
            row['telephone'] as String,
            row['role'] as String));
  }

  @override
  Future<Client?> findByUsernameAndPassword(
    String username,
    String password,
  ) async {
    return _queryAdapter.query(
        'SELECT * FROM Client WHERE username = ?1 AND password = ?2',
        mapper: (Map<String, Object?> row) => Client(
            row['id'] as int?,
            row['username'] as String,
            row['password'] as String,
            row['telephone'] as String,
            row['role'] as String),
        arguments: [username, password]);
  }

  @override
  Future<void> insertClient(Client client) async {
    await _clientInsertionAdapter.insert(client, OnConflictStrategy.abort);
  }
}

class _$ProduitDAO extends ProduitDAO {
  _$ProduitDAO(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _produitInsertionAdapter = InsertionAdapter(
            database,
            'Produit',
            (Produit item) => <String, Object?>{
                  'id': item.id,
                  'designation': item.designation,
                  'image': item.image,
                  'pu': item.pu,
                  'qte': item.qte,
                  'clientId': item.clientId,
                  'date': item.date,
                  'heure': item.heure
                }),
        _produitUpdateAdapter = UpdateAdapter(
            database,
            'Produit',
            ['id'],
            (Produit item) => <String, Object?>{
                  'id': item.id,
                  'designation': item.designation,
                  'image': item.image,
                  'pu': item.pu,
                  'qte': item.qte,
                  'clientId': item.clientId,
                  'date': item.date,
                  'heure': item.heure
                }),
        _produitDeletionAdapter = DeletionAdapter(
            database,
            'Produit',
            ['id'],
            (Produit item) => <String, Object?>{
                  'id': item.id,
                  'designation': item.designation,
                  'image': item.image,
                  'pu': item.pu,
                  'qte': item.qte,
                  'clientId': item.clientId,
                  'date': item.date,
                  'heure': item.heure
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Produit> _produitInsertionAdapter;

  final UpdateAdapter<Produit> _produitUpdateAdapter;

  final DeletionAdapter<Produit> _produitDeletionAdapter;

  @override
  Future<List<Produit>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM Produit',
        mapper: (Map<String, Object?> row) => Produit(
            row['id'] as int?,
            row['designation'] as String,
            row['image'] as String?,
            row['pu'] as double,
            row['qte'] as int,
            row['clientId'] as int,
            row['date'] as String,
            row['heure'] as String));
  }

  @override
  Future<int> insertProduit(Produit produit) {
    return _produitInsertionAdapter.insertAndReturnId(
        produit, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateProduit(Produit produit) async {
    await _produitUpdateAdapter.update(produit, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteProduit(Produit produit) async {
    await _produitDeletionAdapter.delete(produit);
  }
}
