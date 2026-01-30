import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/enum/session_enum.dart' show SessionPage;
import '../../../../core/routes/locatore.dart';
import '../../../../core/routes/routes_services.dart';
import '../../../../core/services/locator/locator.dart';
import 'training_event.dart';
import 'training_state.dart';

@injectable
class TrainingBloc extends Bloc<TrainingEvent, TrainingState> {
  final RoutesService routesService = locator<RoutesService>();
  
  // Text editing controllers (kept outside state as they're UI controllers)
  final TextEditingController notesCtrl = TextEditingController();
  final TextEditingController titleCtrl = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController parTimeController = TextEditingController();
  final TextEditingController roundsController = TextEditingController();
  final TextEditingController distanceController = TextEditingController();
  final TextEditingController repsController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  TrainingBloc() : super( TrainingState()) {
    on<NavigateToEvent>(_onNavigateTo);
    on<CompleteStepEvent>(_onCompleteStep);
    on<GoToNextStepEvent>(_onGoToNextStep);
    on<ToggleWifiConnectionEvent>(_onToggleWifiConnection);
    on<ToggleBleConnectionEvent>(_onToggleBleConnection);
    on<SelectLoadoutEvent>(_onSelectLoadout);
    on<SelectDrillEvent>(_onSelectDrill);
    on<SelectRangeEvent>(_onSelectRange);
    on<SelectCadenceValuesEvent>(_onSelectCadenceValuesEvent);
    on<SelectIsCadOrRegularEvent>(_onSelectIsCadOrRegularEvent);
    on<StartSessionEvent>(_onStartSession);
    on<RecordShotEvent>(_onRecordShot);
    on<PauseResumeEvent>(_onPauseResume);
    on<EndSessionEvent>(_onEndSession);
    on<SetTimerTypeEvent>(_onSetTimerType);
    on<SetStartSignalEvent>(_onSetStartSignal);
    on<SetScoringEvent>(_onSetScoring);
    on<SaveDrillEvent>(_onSaveDrill);
    

    // Initialize with default data (equivalent to original Rx lists)
    // No initial abstract event dispatched; create and dispatch a concrete Init event if needed.
  }

  // 🎯 ORIGINAL: everAll([isLoadoutSelected, isWifiConnected, isBleConnected], ...)
  // BLOC: This logic is now handled in individual event handlers
  // When any of these conditions change, we check if setup is complete

  void _onNavigateTo(NavigateToEvent event, Emitter<TrainingState> emit) {
    if (state.isAllowed(event.page)) {
      routesService.navigateTo(event.route);
      emit(state.copyWith(currentPage: event.page));
    } else {
      // Show snackbar (you'll need to handle this in UI or use a different approach)
      // Get.snackbar('Step Locked', 'Please complete the previous step first.');
      emit(state.copyWith(error: 'Step Locked: Please complete the previous step first.'));
    }
  }

  void _onCompleteStep(CompleteStepEvent event, Emitter<TrainingState> emit) {
    final newCompletedSteps = Set<SessionPage>.from(state.completedSteps);
    if (!newCompletedSteps.contains(event.page)) {
      newCompletedSteps.add(event.page);
      emit(state.copyWith(completedSteps: newCompletedSteps));
      
      // 🎯 ORIGINAL: Automatic step completion logic
      // Check if setup is complete when relevant steps are completed
      if (state.isLoadoutSelected && state.isWifiConnected && state.isBleConnected) {
        add(CompleteStepEvent(SessionPage.setup));
      }
    }
  }

  void _onGoToNextStep(GoToNextStepEvent event, Emitter<TrainingState> emit) {
    final sections = state.getSections();
    final idx = sections.indexWhere((s) => s['page'] == state.currentPage);
    if (idx >= 0 && idx < sections.length - 1) {
      final next = sections[idx + 1]['page'] as SessionPage;
      if (state.isAllowed(next)) {
        emit(state.copyWith(currentPage: next));
      }
    }
  }
// In training_bloc.dart
void _onSaveAlertPreferences(SaveAlertPreferencesEvent event, Emitter<TrainingState> emit) {
  // Save the alert preferences to state
  emit(state.copyWith(
    audioPreferences: event.audioPreferences,
    safetyPreferences: event.safetyPreferences,
    error: null,
  ));
  
  // You could also persist these settings to local storage here
  // _saveToLocalStorage(event.audioPreferences, event.safetyPreferences);
}
  void _onToggleWifiConnection(ToggleWifiConnectionEvent event, Emitter<TrainingState> emit) {
    if (state.connectedWifiId == event.device.id) {
      // Disconnect
      emit(state.copyWith(
        connectedWifiId: null,
        selectedWifiDevice: null,
        isWifiConnected: false,
      ));
    } else {
      // Connect
      emit(state.copyWith(
        connectedWifiId: event.device.id,
        selectedWifiDevice: event.device,
        isWifiConnected: true,
      ));
    
      
      // 🎯 ORIGINAL: Check if setup step should be completed
      if (state.isLoadoutSelected && state.isBleConnected) {
        add(CompleteStepEvent(SessionPage.setup));
      }
    }
  }

  void _onToggleBleConnection(ToggleBleConnectionEvent event, Emitter<TrainingState> emit) {
    if (state.connectedBleId == event.device.id) {
      // Disconnect
      emit(state.copyWith(
        connectedBleId: null,
        selectedBleDevice: null,
        isBleConnected: false,
      ));
    } else {
      // Connect
      emit(state.copyWith(
        connectedBleId: event.device.id,
        selectedBleDevice: event.device,
        isBleConnected: true,
      ));
    
      
      // 🎯 ORIGINAL: Check if setup step should be completed
      if (state.isLoadoutSelected && state.isWifiConnected) {
        add(CompleteStepEvent(SessionPage.setup));
      }
    }
  }

  void _onSelectLoadout(SelectLoadoutEvent event, Emitter<TrainingState> emit) {
    final updatedSession = state.session.copyWith(loadout: event.loadout);
    emit(state.copyWith(
      session: updatedSession,
      isLoadoutSelected: true,
      selectedLoadout: event.loadout,
    ));
    
    // 🎯 ORIGINAL: Check if setup step should be completed
    if (state.isWifiConnected && state.isBleConnected) {
      add(CompleteStepEvent(SessionPage.setup));
    }
  }

  void _onSelectDrill(SelectDrillEvent event, Emitter<TrainingState> emit) {
    final updatedSession = state.session.copyWith(drill: event.drill);
    emit(state.copyWith(
      session: updatedSession,
      isDrillSelected: true,
      selectedDrill: event.drill,
    ));
  }

  void _onSelectRange(SelectRangeEvent event, Emitter<TrainingState> emit) {
    final updatedSession = state.session.copyWith(rangeName: event.range);
    emit(state.copyWith(session: updatedSession));
  }
  void _onSelectCadenceValuesEvent(SelectCadenceValuesEvent event, Emitter<TrainingState> emit) {
    final updatedSession = state.session.copyWith(cadenceValues: event.cadenceValues);
    emit(state.copyWith(session: updatedSession));
  }
  void _onSelectIsCadOrRegularEvent(SelectIsCadOrRegularEvent event, Emitter<TrainingState> emit) {
    final updatedSession = state.session.copyWith(isCadOrRegular: event.isCadOrRegular);
    emit(state.copyWith(session: updatedSession));
  }

  void _onStartSession(StartSessionEvent event, Emitter<TrainingState> emit) {
    emit(state.copyWith(
      shotCount: 0,
      sessionTimer: 0,
      isRunning: true,
      currentPage: SessionPage.active,
    ));
  }

  void _onRecordShot(RecordShotEvent event, Emitter<TrainingState> emit) {
    emit(state.copyWith(shotCount: state.shotCount + 1));
  }

  void _onPauseResume(PauseResumeEvent event, Emitter<TrainingState> emit) {
    emit(state.copyWith(isRunning: !state.isRunning));
  }

  void _onEndSession(EndSessionEvent event, Emitter<TrainingState> emit) {
    emit( TrainingState().copyWith(
      // Reset to initial state but keep some configurations if needed
      wifiNetworks: state.wifiNetworks,
      bluetoothDevices: state.bluetoothDevices,
    ));
  }

  void _onSetTimerType(SetTimerTypeEvent event, Emitter<TrainingState> emit) {
    emit(state.copyWith(timerType: event.timerType));
  }

  void _onSetStartSignal(SetStartSignalEvent event, Emitter<TrainingState> emit) {
    emit(state.copyWith(startSignal: event.startSignal));
  }

  void _onSetScoring(SetScoringEvent event, Emitter<TrainingState> emit) {
    emit(state.copyWith(scoring: event.scoring));
  }

  void _onSaveDrill(SaveDrillEvent event, Emitter<TrainingState> emit) {
    if (nameController.text.isEmpty) {
     
      return;
    }
    // Implement save logic
  }

  @override
  Future<void> close() {
    // Dispose controllers
    notesCtrl.dispose();
    titleCtrl.dispose();
    nameController.dispose();
    descriptionController.dispose();
    parTimeController.dispose();
    roundsController.dispose();
    distanceController.dispose();
    repsController.dispose();
    notesController.dispose();
    return super.close();
  }
}