import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/local_storage_service/local_storage_service.dart';
import '../../../../core/services/locator/locator.dart';
import '../../../train/session/data/local/service/session_db_helper.dart';
import '../../../train/session/data/model/save_session_model.dart';

part 'session_history_event.dart';
part 'session_history_state.dart';
part 'session_history_bloc.freezed.dart';

@injectable
class SessionHistoryBloc extends Bloc<SessionHistoryEvent, SessionHistoryState> {
  SessionHistoryBloc() : super(const SessionHistoryState.initial()) {
    on<SessionHistoryEvent>((event, emit) async {
      await event.when(
          getAllSessions: () => _getAllSessions(emit),

      );
    });
  }

  Future<void> _getAllSessions(
      Emitter<SessionHistoryState> emit) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    final userId = locator<LocalStorageService>().userId!;
    if(userId != null){
      try {
        // Load all sessions for this user
        final rows = await SessionDbHelper().getSessionsByUid(userId);;

        if (rows.isEmpty) {
          print('No sessions found.');

          emit(
            state.copyWith(
                isLoading: true,
                session: []
            ),
          );
          return;
        }

        List<SaveSessionModel> sessions = [];
        for (int index = 0; index < rows.length; index++) {
          final row = rows[index];
          final session = row['session'] as SaveSessionModel?;

          if (session == null) {
            print('Row $index has no session object — skipping.');
            continue;
          }

          sessions.add(session);
        }
        emit(
          state.copyWith(
              isLoading: true,
              session: sessions
          ),
        );
      } catch (e) {
        print('Error loading sessions: $e');
      }
    }else{
      emit(
        state.copyWith(
            isLoading: true,
            session: []
        ),
      );
    }

  }
}
