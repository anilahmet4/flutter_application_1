import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static String _boxName = "receiptDataBox";

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
    await box.delete(key); // Deleting the receipt data at the specified key
  }

  // Clear all receipts from the box
  static Future<void> clearAllReceipts() async {
    var box = await _openBox();
    await box.clear(); // Clearing all data in the box
  }
}
