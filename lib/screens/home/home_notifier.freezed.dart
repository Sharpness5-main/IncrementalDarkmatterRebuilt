// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeRiverpodState {
  int get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeRiverpodStateCopyWith<HomeRiverpodState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeRiverpodStateCopyWith<$Res> {
  factory $HomeRiverpodStateCopyWith(
          HomeRiverpodState value, $Res Function(HomeRiverpodState) then) =
      _$HomeRiverpodStateCopyWithImpl<$Res, HomeRiverpodState>;
  @useResult
  $Res call({int count});
}

/// @nodoc
class _$HomeRiverpodStateCopyWithImpl<$Res, $Val extends HomeRiverpodState>
    implements $HomeRiverpodStateCopyWith<$Res> {
  _$HomeRiverpodStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeRiverpodStateCopyWith<$Res>
    implements $HomeRiverpodStateCopyWith<$Res> {
  factory _$$_HomeRiverpodStateCopyWith(_$_HomeRiverpodState value,
          $Res Function(_$_HomeRiverpodState) then) =
      __$$_HomeRiverpodStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count});
}

/// @nodoc
class __$$_HomeRiverpodStateCopyWithImpl<$Res>
    extends _$HomeRiverpodStateCopyWithImpl<$Res, _$_HomeRiverpodState>
    implements _$$_HomeRiverpodStateCopyWith<$Res> {
  __$$_HomeRiverpodStateCopyWithImpl(
      _$_HomeRiverpodState _value, $Res Function(_$_HomeRiverpodState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
  }) {
    return _then(_$_HomeRiverpodState(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_HomeRiverpodState implements _HomeRiverpodState {
  const _$_HomeRiverpodState({required this.count});

  @override
  final int count;

  @override
  String toString() {
    return 'HomeRiverpodState(count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeRiverpodState &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeRiverpodStateCopyWith<_$_HomeRiverpodState> get copyWith =>
      __$$_HomeRiverpodStateCopyWithImpl<_$_HomeRiverpodState>(
          this, _$identity);
}

abstract class _HomeRiverpodState implements HomeRiverpodState {
  const factory _HomeRiverpodState({required final int count}) =
      _$_HomeRiverpodState;

  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_HomeRiverpodStateCopyWith<_$_HomeRiverpodState> get copyWith =>
      throw _privateConstructorUsedError;
}
