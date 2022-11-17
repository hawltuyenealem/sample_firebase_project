part of 'item_bloc.dart';

abstract class ItemState extends Equatable {
  const ItemState();
}

class ItemInitial extends ItemState {
  @override
  List<Object> get props => [];
}
class ItemLoaing extends ItemState{
  @override
  List<Object> get props => [];
}
class ItemsLoaded extends ItemState{
  List<ItemModel> items;
  ItemsLoaded({required this.items});
  @override
  List<Object> get props => [];
}
class ItemSuccessfullOperation extends ItemState{
  bool state;
  ItemSuccessfullOperation({required this.state});
  List<Object> get props => [];
}
class ItemError extends ItemState{
  ErrorResponse errorResponse;

  ItemError({
    required this.errorResponse
});
  @override
  List<Object> get props => [];
}