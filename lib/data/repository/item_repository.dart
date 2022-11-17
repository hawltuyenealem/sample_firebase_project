import 'package:dartz/dartz.dart';
import 'package:sample_firebase_project/data/models/error_response.dart';
import 'package:sample_firebase_project/data/models/items_model.dart';
import 'package:sample_firebase_project/data/services/item_service.dart';
import 'package:sample_firebase_project/presentation/item/blocs/item_bloc.dart';

abstract class ItemRepository {
  Future<Either<ErrorResponse,bool>> AddItem({required ItemModel itemModel});
  Future<Either<ErrorResponse,bool>> UpdateItem({required String name,required ItemModel itemModel});
  Future<Either<ErrorResponse,bool>> DeleteItem({required String name});
  Future<Either<ErrorResponse,List<ItemModel>>> getItems();

}

class ItemRepositoryImpl extends ItemRepository{

  ItemService itemService;
  ItemRepositoryImpl ({required this.itemService});

  @override
  Future<Either<ErrorResponse,bool>> AddItem({required ItemModel itemModel}) async{
    // TODO: implement AddItem
    return await itemService.addItem(itemModel);
  }

  @override
  Future<Either<ErrorResponse,bool>> DeleteItem({required String name}) async{
    // TODO: implement DeleteItem
    return await itemService.deleteItem(name);
  }

  @override
  Future<Either<ErrorResponse,bool>> UpdateItem({required String name, required ItemModel itemModel}) async{
    // TODO: implement UpdateItem
   return await itemService.updateItem(name, itemModel);
  }

  @override
  Future<Either<ErrorResponse,List<ItemModel>>> getItems()async {
    // TODO: implement getItems
    return await itemService.getItems();
  }

}