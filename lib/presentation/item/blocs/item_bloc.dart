import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_firebase_project/data/models/error_response.dart';
import 'package:sample_firebase_project/data/models/items_model.dart';
import 'package:sample_firebase_project/data/repository/item_repository.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemRepository itemRepository;
  ItemBloc({required this.itemRepository}) : super(ItemInitial()) {
    on<ItemEvent>((event, emit)async {
      // TODO: implement event handler
      if(event is AddItem){
        var response = await itemRepository.AddItem(itemModel: event.item);
        response.fold((l) => emit(ItemError(errorResponse: l)), (r) => emit(ItemSuccessfullOperation(state: r)));
      }if(event is GetItems){
        var response = await itemRepository.getItems();
        response.fold((l) => emit(ItemError(errorResponse: l)), (r) => emit(ItemsLoaded(items:r)));
      }
      if(event is updateItem){
        var response = await itemRepository.UpdateItem(name: event.name, itemModel: event.itemModel);
        response.fold((l) => emit(ItemError(errorResponse: l)), (r) => emit(ItemSuccessfullOperation(state: r)));
      }if(event is DeleteItem){
        var response = await itemRepository.DeleteItem(name: event.name);
        response.fold((l) => emit(ItemError(errorResponse: l)), (r) => emit(ItemSuccessfullOperation(state: r)));
      }
    });
  }
}
