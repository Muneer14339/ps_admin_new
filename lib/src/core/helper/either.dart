import 'package:freezed_annotation/freezed_annotation.dart';
part 'either.freezed.dart';


@freezed
class Either<L, R> with _$Either<L, R> {
  const factory Either.left(L l)  = Left<L, R>;
  const factory Either.right(R r) = Right<L, R>;
}

extension EitherX<L, R> on Either<L, R> {

  B fold<B>({
    required B Function(L) ifLeft,
    required B Function(R) ifRight,
  }) => when(left: ifLeft, right: ifRight);

  Either<L, U> map<U>(U Function(R) f) =>
      fold(
        ifLeft: (l) => Either.left(l),
        ifRight: (r) => Either.right(f(r)),
      );

  Either<L, U> flatMap<U>(Either<L, U> Function(R) f) =>
      fold(
        ifLeft: (l) => Either.left(l),
        ifRight: f,
      );

}

