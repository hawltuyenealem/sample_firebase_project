
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService{

  static FlutterSecureStorage? _secureStorage;
  static LocalStorageService? _service;
  static SharedPreferences? _sharedPreferences;

  static Future<LocalStorageService> getInstance() async{
    _service ??= LocalStorageService();
    _secureStorage = await FlutterSecureStorage();
    _sharedPreferences = await SharedPreferences.getInstance();

    return _service!;
  }
  static Future<bool> isLogin(String key)  async{
    var value =   _sharedPreferences!.getBool(key);
    return value ?? false ;
  }
  read(String key)async{
    var readData=  await _secureStorage!.read(
      key: key,
      aOptions: _getAndroidOptions(),
      iOptions: _iosOptions()
    );

    if(readData == null){
      return readData as Map<String,dynamic> ;
    }
    return   json.decode(readData) as Map<String,dynamic>;
  }
  save(String key,dynamic value)async{
    await _secureStorage!.write(
      key: key,
      aOptions: _getAndroidOptions(),
      iOptions: _iosOptions(),
      value: jsonDecode(value),
    );
  }
  remove(String key)async{
    await _secureStorage!.delete(
      key: key,
      iOptions: _iosOptions(),
      aOptions: _getAndroidOptions(),
    );
    _sharedPreferences!.remove(key);
  }

  clearData()async{
    await _secureStorage!.deleteAll(
        aOptions: _getAndroidOptions(),
        iOptions: _iosOptions()
    );
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );
  IOSOptions _iosOptions() => const IOSOptions(
  );
}