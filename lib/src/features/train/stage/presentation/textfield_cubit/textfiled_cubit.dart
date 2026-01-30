import 'package:flutter_bloc/flutter_bloc.dart';

class TextFieldCubit extends Cubit<String?> {
  TextFieldCubit() : super(null);

  void validate(String value) {
    if (value.isEmpty) {
      emit('This field is required');
    } else {
      emit(null); 
    }
  }
}

