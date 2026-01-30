abstract class CheckboxEvent {}

class ToggleMainCheckbox extends CheckboxEvent {
  final bool isSelected;
  ToggleMainCheckbox(this.isSelected);
}

class ToggleItemCheckbox extends CheckboxEvent {
  final int index;
  final String title;
  ToggleItemCheckbox(this.index, this.title);
}

class LongPressItem extends CheckboxEvent {
  final int index;
  final String title;
  LongPressItem(this.index, this.title);
}
