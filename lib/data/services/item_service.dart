
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sample_firebase_project/data/models/error_response.dart';
import 'package:sample_firebase_project/data/models/items_model.dart';
import 'package:sample_firebase_project/data/models/login_request.dart';

class ItemService {

  final db = FirebaseFirestore.instance;

 Future<Either<ErrorResponse,bool>> addItem(ItemModel itemModel)async{
    try{
    var response = db.collection('items').doc().set(itemModel.toJson()) ;
    return Right(true);
    }catch(e){
      return Left(ErrorResponse(message: e.toString(),code: 404));
    }

  }
  Future<Either<ErrorResponse,List<ItemModel>>> getItems()async{
    try{
      var items = db.collection("items").doc().get() as List<ItemModel>;
      return Right(items);
    }catch(e){
      return Left(ErrorResponse(message: e.toString(),code: 404));
    }
  }

  Future<Either<ErrorResponse,bool>> deleteItem(String name)async{
   try{
     db.collection('items').doc(name).delete();
     return Right(true);
   }catch(e){
     return Left(ErrorResponse(message: e.toString(),code: 404));
   }
  }

  Future<Either<ErrorResponse,bool>> updateItem(String name,ItemModel itemModel)async{
    try{
    db.collection('items').doc(name).update(itemModel.toJson());
    return Right(true);
    }catch(e){
      return Left(ErrorResponse(message: e.toString(),code: 404));
    }
  }
}