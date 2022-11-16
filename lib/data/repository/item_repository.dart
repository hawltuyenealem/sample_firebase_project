import 'package:sample_firebase_project/data/models/items_model.dart';
import 'package:sample_firebase_project/data/services/item_service.dart';
import 'package:sample_firebase_project/presentation/item/blocs/item_bloc.dart';

abstract class ItemRepository {
  Future<void> AddItem({required ItemModel itemModel});
  Future<void> UpdateItem({required String name,required ItemModel itemModel});
  Future<void> DeleteItem({required String name});
  Future<List<ItemModel>> getItems();

}

class ItemRepositoryImpl extends ItemRepository{

  ItemService itemService;
  ItemRepositoryImpl ({required this.itemService});

  @override
  Future<void> AddItem({required ItemModel itemModel}) async{
    // TODO: implement AddItem
    await itemService.addItem(itemModel);
  }

  @override
  Future<void> DeleteItem({required String name}) async{
    // TODO: implement DeleteItem
    await itemService.deleteItem(name);
  }

  @override
  Future<void> UpdateItem({required String name, required ItemModel itemModel}) async{
    // TODO: implement UpdateItem
    await itemService.updateItem(name, itemModel);
  }

  @override
  Future<List<ItemModel>> getItems()async {
    // TODO: implement getItems
    return await itemService.getItems();
  }

}