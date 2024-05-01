import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static const String _boxName = "receiptDataBox";

  // Initialize Hive
  static Future<void> init() async {
    await Hive.initFlutter();
  }

  // Open a box
  static Future<Box> _openBox() async {
    return await Hive.openBox(_boxName);
  }

  // Add receipt data
  static Future<void> addReceipt(List<dynamic> receiptData) async {
    var box = await _openBox();
    box.add(
        receiptData); // Using add() to let Hive manage the key automatically
  }

  // Retrieve all receipts
  static Future<List<dynamic>> getAllReceipts() async {
    var box = await _openBox();
    return box.values.toList(); // Convert Hive Iterable to List<dynamic>
  }

  // Update a receipt data based on key
  static Future<void> updateReceipt(int key, List<dynamic> receiptData) async {
    var box = await _openBox();
    await box.put(
        key, receiptData); // Updating the receipt data at the specified key
  }

  // Delete a receipt data based on key
  static Future<void> deleteReceipt(int key) async {
    var box = await _openBox();
    await box.delete(key);
    await reindexHiveBox(box);
  }

  // Clear all receipts from the box
  static Future<void> clearAllReceipts() async {
    var box = await _openBox();
    await box.clear(); // Clearing all data in the box
  }

  // Print all receipts with their keys
  static Future<void> printAllReceipts() async {
    var box = await _openBox();
    var receipts = box.toMap().entries;
    for (var entry in receipts) {
      print('Key: ${entry.key}, Receipt: ${entry.value}');
    }
  }

  static Future<void> reindexHiveBox(Box box) async {
    var receipts = box.values.toList(); // Store all remaining receipts
    await box.clear(); // Clear the box to reset indices

    for (var receipt in receipts) {
      await box.add(
          receipt); // Reinsert each receipt; Hive will automatically assign new keys
    }
  }
}
