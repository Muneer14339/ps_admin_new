// CheckboxBloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'checkbox_event.dart';
import 'checkbox_state.dart';

class CheckboxBloc extends Bloc<CheckboxEvent, CheckboxState> {
  final int itemCount;
  final List<String> items; // List of item titles

  CheckboxBloc(this.itemCount, this.items)
      : super(CheckboxState(
          isMainSelected: false,
          itemsSelected: [],
          areCheckboxesVisible: false,
        )) {
    on<ToggleMainCheckbox>(_onToggleMainCheckbox);
    on<ToggleItemCheckbox>(_onToggleItemCheckbox);
    on<LongPressItem>(_onLongPressItem);
  }

  void _onToggleMainCheckbox(
      ToggleMainCheckbox event, Emitter<CheckboxState> emit) {
    final List<ItemModel> newItemsSelected = event.isSelected
        ? List.generate(itemCount,
            (index) => ItemModel(index, items[index])) // Use dynamic title
        : [];

    emit(state.copyWith(
      isMainSelected: event.isSelected,
      itemsSelected: newItemsSelected,
      areCheckboxesVisible: event.isSelected,
    ));
  }

  void _onToggleItemCheckbox(
      ToggleItemCheckbox event, Emitter<CheckboxState> emit) {
    final newItemsSelected = List<ItemModel>.from(state.itemsSelected);
    final item = ItemModel(event.index, event.title);

    if (newItemsSelected.any((i) => i.index == event.index)) {
      newItemsSelected.removeWhere((i) => i.index == event.index);
    } else {
      newItemsSelected.add(item);
    }

    final allSelected = newItemsSelected.length == itemCount;
    final anySelected = newItemsSelected.isNotEmpty;

    emit(state.copyWith(
      isMainSelected: allSelected,
      itemsSelected: newItemsSelected,
      areCheckboxesVisible: anySelected || state.isMainSelected,
    ));
  }

  void _onLongPressItem(LongPressItem event, Emitter<CheckboxState> emit) {
    emit(state.copyWith(
      areCheckboxesVisible: true,
      itemsSelected: [ItemModel(event.index, event.title)],
    ));
  }
}
