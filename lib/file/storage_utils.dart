

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:yc_flutter_utils/object/object_utils.dart';

/// 存储文件管理类
class StorageUtils {

  /// getTemporaryDirectory
  /// 指向设备上临时目录的路径，该目录没有备份，适合存储下载文件的缓存。
  /// 此目录中的文件可以随时清除。这不会返回一个新的临时目录。
  /// 相反，调用者负责在这个目录中创建(和清理)文件或目录。这个目录的作用域是调用应用程序。
  /// 在iOS上，它使用“NSCachesDirectory”API。
  /// 在Android上，它在上下文中使用“getCacheDir”API。
  static Future<Directory> _initTempDir() {
    return getTemporaryDirectory();
  }

  /// getApplicationSupportDirectory
  /// 应用程序可以放置应用程序支持文件的目录的路径。
  /// 对不希望向用户公开的文件使用此选项。您的应用程序不应将此目录用于用户数据文件。
  /// 在iOS上，它使用“NSApplicationSupportDirectory”API。如果此目录不存在，则自动创建。
  /// 在Android上，此函数抛出一个[UnsupportedError]。
  static Future<Directory> _initSupportDir() {
    return getApplicationSupportDirectory();
  }

  /// getApplicationDocumentsDirectory
  /// 指向应用程序可以放置用户生成的数据或应用程序无法重新创建的数据的目录的路径。
  /// 在iOS上，它使用“NSDocumentDirectory”API。如果数据不是用户生成的，请考虑使用[GetApplicationSupportDirectory]。
  /// 在Android上，这在上下文中使用了“getDataDirectory”API。如果数据对用户可见，请考虑改用getExternalStorageDirectory。
  static Future<Directory> _initAppDocDir() async {
    return getApplicationDocumentsDirectory();
  }

  /// getExternalStorageDirectory
  /// 应用程序可以访问顶层存储的目录的路径。在发出这个函数调用之前，应该确定当前操作系统，因为这个功能只在Android上可用。
  /// 在iOS上，这个函数抛出一个[UnsupportedError]，因为它不可能访问应用程序的沙箱之外。
  /// 在Android上，它使用“getExternalStorageDirectory”API。
  static Future<Directory> _initStorageDir() async {
    return getExternalStorageDirectory();
  }

  /// 同步创建文件夹
  static Directory createDirSync(String path) {
    if (ObjectUtils.isEmpty(path)) {
      return null;
    }
    Directory dir = Directory(path);
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }
    return dir;
  }

  /// 异步创建文件夹
  static Future<Directory> createDir(String path) async {
    if (ObjectUtils.isEmpty(path)) {
      return null;
    }
    Directory dir = Directory(path);
    bool exist = await dir.exists();
    if (!exist) {
      dir = await dir.create(recursive: true);
    }
    return dir;
  }

  /// fileName 文件名
  /// dirName 文件夹名
  /// String path = StorageUtil.getTempPath(fileName: 'demo.png', dirName: 'image');
  /// Android: /data/user/0/com.thl.flustars_example/cache/image/demo.png
  /// iOS: /var/mobile/Containers/Data/Application/xxx/Library/Caches/image/demo.png;
  static Future<String> getTempPath({
    String fileName,
    String dirName,
  }) async {
    Directory _tempDir = await _initTempDir();
    if (_tempDir == null) {
      return null;
    }
    StringBuffer sb = StringBuffer("${_tempDir.path}");
    if (!ObjectUtils.isEmpty(dirName)) {
      sb.write("/$dirName");
      await createDir(sb.toString());
    }
    if (!ObjectUtils.isEmpty(fileName)) sb.write("/$fileName");
    return sb.toString();
  }

  /// fileName 文件名
  /// dirName 文件夹名
  /// String path = StorageUtil.getAppDocPath(fileName: 'demo.mp4', dirName: 'video');
  /// Android: /data/user/0/com.thl.flustars_example/app_flutter/video/demo.mp4
  /// iOS: /var/mobile/Containers/Data/Application/xxx/Documents/video/demo.mp4;
  static Future<String> getAppDocPath({
    String fileName,
    String dirName,
  }) async {
    Directory _appDocDir = await _initAppDocDir();
    if (_appDocDir == null) {
      return null;
    }
    StringBuffer sb = StringBuffer("${_appDocDir.path}");
    if (!ObjectUtils.isEmpty(dirName)) {
      sb.write("/$dirName");
      await createDir(sb.toString());
    }
    if (!ObjectUtils.isEmpty(fileName)) sb.write("/$fileName");
    return sb.toString();
  }

  /// fileName 文件名
  /// dirName 文件夹名
  /// category 分类，例如：video，image等等
  /// String path = StorageUtil.getStoragePath(fileName: 'flutterwanandroid.apk', dirName: 'apk');
  /// Android: /storage/emulated/0/com.thl.flutterwanandroid/apk/flutterwanandroid.apk
  /// iOS: 不存在;
  static Future<String> getStoragePath({
    String fileName,
    String dirName,
  }) async {
    Directory _storageDir = await _initStorageDir();
    if (_storageDir == null) {
      return null;
    }
    StringBuffer sb = StringBuffer("${_storageDir.path}");
    if (!ObjectUtils.isEmpty(dirName)) {
      sb.write("/$dirName");
      await createDir(sb.toString());
    }
    if (!ObjectUtils.isEmpty(fileName)){
      sb.write("/$fileName");
    }
    return sb.toString();
  }

  ///创建临时目录
  /// dirName 文件夹名
  /// String path = StorageUtil.createTempDir( dirName: 'image');
  /// Android: /data/user/0/com.thl.flustars_example/cache/image
  /// iOS: /var/mobile/Containers/Data/Application/xxx/Library/Caches/image
  static Future<Directory> createTempDir({String dirName}) async {
    Directory _tempDir = await _initTempDir();
    if (_tempDir == null) {
      return null;
    }
    StringBuffer sb = StringBuffer("${_tempDir.path}");
    if (!ObjectUtils.isEmpty(dirName)){
      sb.write("/$dirName");
    }
    return createDir(sb.toString());
  }

  /// fileName 文件名
  /// dirName 文件夹名
  /// String path = StorageUtil.getAppDocPath(fileName: 'demo.mp4', dirName: 'video');
  /// Android: /data/user/0/com.thl.flustars_example/app_flutter/video
  /// iOS: /var/mobile/Containers/Data/Application/xxx/Documents/video
  static Future<Directory> createAppDocDir({String dirName}) async {
    Directory _appDocDir = await _initAppDocDir();
    if (_appDocDir == null) {
      return null;
    }
    StringBuffer sb = StringBuffer("${_appDocDir.path}");
    if (!ObjectUtils.isEmpty(dirName)) {
      sb.write("/$dirName");
    }
    return createDir(sb.toString());
  }

  /// dirName 文件夹名
  /// category 分类，例如：video，image等等
  /// String path = StorageUtil.getStoragePath(fileName: 'yc.apk', dirName: 'apk');
  /// Android: /storage/emulated/0/com.thl.yc/apk
  /// iOS: 不存在;
  static Future<Directory> createStorageDir({String dirName}) async {
    Directory _storageDir = await _initStorageDir();
    if (_storageDir == null) {
      return null;
    }
    StringBuffer sb = StringBuffer("${_storageDir.path}");
    if (!ObjectUtils.isEmpty(dirName)) {
      sb.write("/$dirName");
    }
    return createDir(sb.toString());
  }
}