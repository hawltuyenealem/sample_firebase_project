part of 'item_bloc.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();
}
class AddItem extends ItemEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class GetItems  extends ItemEvent{
  List<ItemModel> items;
  GetItems({required this.items});
  List<Object?> get props => [items];
}

class DeleteItem extends ItemEvent{
  String id;
  DeleteItem({required this.id});
  List<Object?> get props => [];
}
class updateItem extends ItemEvent{
  String id;
  ItemModel itemModel;

  updateItem({required this.id,required this.itemModel});
  List<Object?> get props => [];
}


