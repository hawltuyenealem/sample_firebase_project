import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_firebase_project/data/models/error_response.dart';
import 'package:sample_firebase_project/data/models/items_model.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc() : super(ItemInitial()) {
    on<ItemEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
