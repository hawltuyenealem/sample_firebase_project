
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sample_firebase_project/data/models/items_model.dart';
import 'package:sample_firebase_project/data/models/login_request.dart';

class ItemService {

  final db = FirebaseFirestore.instance;

 Future<void> addItem(ItemModel itemModel)async{
    try{
    db.collection('items').doc().set(itemModel.toJson()) ;

    }catch(e){
      throw Exception();
    }

  }
  Future<List<ItemModel>> getItems()async{
    try{
      var items = db.collection("items").doc().get() as List<ItemModel>;
      return items;
    }catch(e){
      throw Exception();
    }
  }

  Future<void> deleteItem(String name)async{
   try{
     db.collection('items').doc(name).delete();
   }catch(e){
     throw Exception();
   }
  }

  Future<void> updateItem(String name,ItemModel itemModel)async{
    try{
    db.collection('items').doc(name).update(itemModel.toJson());
    }catch(e){
      throw Exception();
    }
  }
}