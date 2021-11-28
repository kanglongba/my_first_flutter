import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:my_first_flutter/official/official_guide_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// 获取图片的宽高比：https://stackoverflow.com/questions/44665955/how-do-i-determine-the-width-and-height-of-an-image-in-flutter
Future<Size> _calculateImageDimension(String imgSrc) {
  Completer<Size> completer = Completer();
  Image image = Image.asset(imgSrc);
  image.image.resolve(const ImageConfiguration()).addListener(
    ImageStreamListener(
      (ImageInfo image, bool synchronousCall) {
        var myImage = image.image;
        Size size = Size(myImage.width.toDouble(), myImage.height.toDouble());
        completer.complete(size);
      },
    ),
  );
  return completer.future;
}

/// 使用数据库：https://flutter.cn/docs/cookbook/persistence/sqlite
Future<Database> openMyDatabase() async {
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    // 设置数据库的路径。注意：使用 `path` 包中的 `join` 方法是
    // 确保在多平台上路径都正确的最佳实践。
    join(await getDatabasesPath(), 'tencent_database.db'),
    // When the database is first created, create a table to store dogs.
    // 当数据库第一次被创建的时候，创建一个数据表，用以存储狗狗们的数据。
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE GirlGallery(id INTEGER PRIMARY KEY, name TEXT, desc TEXT, rateScore INTEGER, isFavor INTEGER, imgSrc TEXT, reviewers INTEGER)',
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    // 设置版本。它将执行 onCreate 方法，同时提供数据库升级和降级的路径。
    version: 1,
  );
  return database;
}

Future<void> insertGirl(GirlGalleryItem girl) async {
  // Get a reference to the database
  final db = await openMyDatabase();

  // Insert the Dog into the correct table. You might also specify the
  // `conflictAlgorithm` to use in case the same dog is inserted twice.
  //
  // In this case, replace any previous data.
  await db.insert(
    'GirlGallery',
    girl.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<GirlGalleryItem>> queryGirls() async {
  // Get a reference to the database.
  final db = await openMyDatabase();

  // Query the table for all The Dogs.
  final List<Map<String, dynamic>> list = await db.query('GirlGallery');
  // Convert the List<Map<String, dynamic> into a List<Dog> (将 List<Map<String, dynamic> 转换成 List<Dog> 数据类型)
  return List.generate(list.length, (i) {
    return GirlGalleryItem.fromJson(list[i]);
  });
}

Future<void> updateGirl(GirlGalleryItem girl) async {
  // Get a reference to the database (获得数据库引用)
  final db = await openMyDatabase();
  // Update the given Dog (修改给定的狗狗的数据)
  await db.update(
    'GirlGallery',
    girl.toMap(),
    // Ensure that the Dog has a matching id.
    where: 'id = ?',
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [girl.id],
  );
}

Future<void> deleteGirl(GirlGalleryItem girl) async {
  // Get a reference to the database (获得数据库引用)
  final db = await openMyDatabase();
  // Remove the Dog from the database (将狗狗从数据库移除)
  await db.delete(
    'GirlGallery',
    // Use a `where` clause to delete a specific dog.
    where: 'id = ?',
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [girl.id],
  );
}
