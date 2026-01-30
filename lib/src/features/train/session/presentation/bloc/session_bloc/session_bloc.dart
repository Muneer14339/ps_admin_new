import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:pa_sreens/src/core/utils/utils.dart';
import 'package:pa_sreens/src/features/train/session/data/model/session_model.dart';

part 'session_event.dart';
part 'session_state.dart';

@injectable
class SessionBloc extends Bloc<SessionEvent, SessionState> {
  SessionBloc() : super(SessionInitial()) {
    on<SessionEvent>((event, emit) {});

    on<ResetSession>((event, emit) {
      emit(SessionInitial());
    });
    //

    on<ShootEvent>((event, emit) {
      SessionModel model = event.sessionModel;

      log("ShootEvent received with isSessionStart: ${model.isSessionStart}");
      log("ShootEvent received with makeScoreVisible: ${model.makeScoreVisible}");

      if (model.isSessionStart != true) {

        final splitTimes = (event.sessionModel.listShots ?? [])
            .skip(1)
            .where((shot) => shot.splitTime != null)
            .map((shot) => shot.splitTime!)
            .toList();

        final splitTimesFirstSkipped = (event.sessionModel.listShots ?? [])
            .skip(1)
            .where((shot) => shot.splitTimeInt != null)
            .map((shot) => shot.splitTimeInt!)
            .toList();

        if (splitTimes.isNotEmpty) {
          final totalTime = addTimesAsFractions(splitTimes);
          model.totalTime = totalTime;
          model.averageSplitTime = (totalTime / splitTimes.length);

          log('splitTimesFirstSkipped: $splitTimesFirstSkipped');

          int? maxSplitTimeInt = splitTimesFirstSkipped.isNotEmpty
              ? splitTimesFirstSkipped.reduce((a, b) => a > b ? a : b)
              : null;

          int? minSplitTimeInt = splitTimesFirstSkipped.isNotEmpty
              ? splitTimesFirstSkipped.reduce((a, b) => a < b ? a : b)
              : null;

          final scores = (event.sessionModel.listShots ?? [])
              .where((shot) => shot.shootScore != null)
              .map((shot) => shot.shootScore!)
              .toList();

          int totalScore = scores.reduce((a, b) => a + b);
          double averageScore = totalScore / scores.length;
          int maxScore =
              scores.isNotEmpty ? scores.reduce((a, b) => a > b ? a : b) : 0;
          int minScore =
              scores.isNotEmpty ? scores.reduce((a, b) => a < b ? a : 0) : 0;

          model.lowestSplitTimeString = minSplitTimeInt != null
              ? ShootModel().parseExactTimeString(minSplitTimeInt)
              : '0.0';

          model.highestSplitTime =
              miliSecondsToSecsSplitTime(maxSplitTimeInt ?? 0);
          model.lowestSplitTime =
              miliSecondsToSecsSplitTime(minSplitTimeInt ?? 0);

          model.highestScore = maxScore;
          model.lowestScore = minScore;
          model.averageScore = averageScore;

          log('------------------------------------------------');
          log('maxSplitTimeInt: $maxSplitTimeInt');
          log('minSplitTimeInt: $minSplitTimeInt');
          log('minSplitTimeString: ${model.lowestSplitTimeString}');
          log('maxSplitTime: ${model.highestSplitTime}');
          log('minSplitTime: ${model.lowestSplitTime}');
        }
      }
      else {
        log('Session has not ended yet.');
      }
      emit(ShootState(model));
    });

    //
    //

    on<CountDownEvent>((event, emit) {
      emit(CountDownState(event.sessionModel));
    });
  }

  double addTimesAsFractions(List<String> timeStrings) {
    List<double> timesAsDoubles = timeStrings.map((time) {
      return double.parse(time.replaceAll(":", "."));
    }).toList();
    double totalTime = timesAsDoubles.reduce((a, b) => a + b);

    return totalTime;
  }
}
