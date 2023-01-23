import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exception.f.freezed.dart';

@freezed
class AppException with _$AppException {
  const factory AppException.requestTimeOut() = RequestTimeOut;
  const factory AppException.generic() = Generic;

}
