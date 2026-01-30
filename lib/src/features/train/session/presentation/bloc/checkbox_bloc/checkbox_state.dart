class CheckboxState {
  final bool isMainSelected;
  final List<ItemModel> itemsSelected; // List of selected items
  final bool areCheckboxesVisible;

  CheckboxState({
    required this.isMainSelected,
    required this.itemsSelected,
    required this.areCheckboxesVisible,
  });

  CheckboxState copyWith({
    bool? isMainSelected,
    List<ItemModel>? itemsSelected,
    bool? areCheckboxesVisible,
  }) {
    return CheckboxState(
      isMainSelected: isMainSelected ?? this.isMainSelected,
      itemsSelected: itemsSelected ?? this.itemsSelected,
      areCheckboxesVisible: areCheckboxesVisible ?? this.areCheckboxesVisible,
    );
  }

  int get selectedCount => itemsSelected.length;
}

class ItemModel {
  final int index;
  final String title;

  ItemModel(this.index, this.title);
}
