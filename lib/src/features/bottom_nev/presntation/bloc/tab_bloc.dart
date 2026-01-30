import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/features/train/train_view.dart';
import 'package:pa_sreens/src/features/profile/presentation/view/profile_view.dart';

import '../../../home/home_tab.dart';
import '../../../training_new/presentation/widgets/view/training_layout_view.dart';

part 'tab_event.dart';
part 'tab_state.dart';
part 'tab_bloc.freezed.dart';

@injectable
class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc() : super(TabState.initial(index: 0, screen: pages[0])) {
    on<TabEvent>(
      (event, emit) async {
        await event.when(
          setTab: (int index) => _setTab(
            index,
            emit,
          ),
        );
      },
    );
  }

  Future<void> _setTab(int index, Emitter<TabState> emit) async {
    emit(
      state.copyWith(index: index, screen: pages[index]),
    );
  }

  @override
  Future<void> close() {
    // TODO: implement close
    return super.close();
  }
}

final List<Widget> pages = [

  HomeTabView(),
  HomeTabView(),
  TrainingLayoutView(),
  // const TrainView(),
  Container(
      color: AppColors.white,
      child: const Center(child: Text('Coming Soon..'))),
  _buildTabNavigator(_navigatorKeys[4], const HomeTabView())

];
Widget _buildTabNavigator(GlobalKey<NavigatorState> key, Widget child) {
  return Navigator(
    key: key,
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute(builder: (_) => child);
    },
  );
}

//
final List<GlobalKey<NavigatorState>> _navigatorKeys = List.generate(
  5,
  (_) => GlobalKey<NavigatorState>(),
);
