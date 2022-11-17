part of 'item_bloc.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();
}
class AddItem extends ItemEvent{
  ItemModel item;
  AddItem({required this.item});
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class GetItems  extends ItemEvent{
  GetItems();
  List<Object?> get props => [];
}

class DeleteItem extends ItemEvent{
  String name;
  DeleteItem({required this.name});
  List<Object?> get props => [];
}
class updateItem extends ItemEvent{
  String name;
  ItemModel itemModel;

  updateItem({required this.name,required this.itemModel});
  List<Object?> get props => [];
}


