import 'package:flutter/cupertino.dart';

abstract class Resource<S, F> {
  const Resource();

  factory Resource.success(S value) = Success<S, F>;

  factory Resource.failure(F exception) = Failure<S, F>;

  bool get isSuccess => this is Success<S, F>;

  bool get isFailure => this is Failure<S, F>;

  T when<T>({
    required T Function(S value) onSuccess,
    required T Function(F failure) onFailure,
  });
}

@immutable
class Success<S, F> extends Resource<S, F> {
  const Success(this.value);

  final S value;

  @override
  T when<T>({
    required T Function(S value) onSuccess,
    required T Function(F failure) onFailure,
  }) {
    return onSuccess(value);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Success &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}

@immutable
class Failure<S, F> extends Resource<S, F> {
  const Failure(this.exception);

  final F exception;

  @override
  T when<T>({
    required T Function(S value) onSuccess,
    required T Function(F failure) onFailure,
  }) {
    return onFailure(exception);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Failure &&
          runtimeType == other.runtimeType &&
          exception == other.exception;

  @override
  int get hashCode => exception.hashCode;
}
