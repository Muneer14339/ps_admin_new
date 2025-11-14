import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_sreens/training/presentation/widgets/components/selection_dialog.dart';
import 'package:pa_sreens/training/presentation/bloc/training_bloc.dart';
import 'package:pa_sreens/training/presentation/bloc/training_event.dart';
import 'package:pa_sreens/training/presentation/bloc/training_state.dart';

class RangeDialog extends StatelessWidget {
  const RangeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainingBloc, TrainingState>(
      builder: (context, state) {
        return _RangeDialogContent(state: state);
      },
    );
  }
}

class _RangeDialogContent extends StatelessWidget {
  final TrainingState state;

  const _RangeDialogContent({required this.state});

  @override
  Widget build(BuildContext context) {
    final ranges = [
      'Oak Ridge Range',
      'Precision Shooting Center',
      'Metro Gun Club',
      'Blue Mountain Range',
    ];

    return SelectionDialog<String>(
      title: "Select Range",
      items: ranges,
      icon: Icons.map_outlined,
      initiallySelected: state.session.rangeName,
      titleBuilder: (r) => r,
      onSelect: (selected) {
        _selectRange(context, selected);
      },
    );
  }

  void _selectRange(BuildContext context, String range) {
    // Dispatch event to BLoC
    context.read<TrainingBloc>().add(SelectRangeEvent(range));
    
    // // Close the dialog
    // Navigator.of(context).pop();
    
    // // Optional: Show success feedback
   
  }
}