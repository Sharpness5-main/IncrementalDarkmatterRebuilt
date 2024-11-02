// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'achievements_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AchievementRiverpodState {
  double get darkmatter => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AchievementRiverpodStateCopyWith<AchievementRiverpodState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AchievementRiverpodStateCopyWith<$Res> {
  factory $AchievementRiverpodStateCopyWith(AchievementRiverpodState value,
          $Res Function(AchievementRiverpodState) then) =
      _$AchievementRiverpodStateCopyWithImpl<$Res, AchievementRiverpodState>;
  @useResult
  $Res call({double darkmatter});
}

/// @nodoc
class _$AchievementRiverpodStateCopyWithImpl<$Res,
        $Val extends AchievementRiverpodState>
    implements $AchievementRiverpodStateCopyWith<$Res> {
  _$AchievementRiverpodStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? darkmatter = null,
  }) {
    return _then(_value.copyWith(
      darkmatter: null == darkmatter
          ? _value.darkmatter
          : darkmatter // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AchievemetRiverpodStateCopyWith<$Res>
    implements $AchievementRiverpodStateCopyWith<$Res> {
  factory _$$_AchievemetRiverpodStateCopyWith(_$_AchievemetRiverpodState value,
          $Res Function(_$_AchievemetRiverpodState) then) =
      __$$_AchievemetRiverpodStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double darkmatter});
}

/// @nodoc
class __$$_AchievemetRiverpodStateCopyWithImpl<$Res>
    extends _$AchievementRiverpodStateCopyWithImpl<$Res,
        _$_AchievemetRiverpodState>
    implements _$$_AchievemetRiverpodStateCopyWith<$Res> {
  __$$_AchievemetRiverpodStateCopyWithImpl(_$_AchievemetRiverpodState _value,
      $Res Function(_$_AchievemetRiverpodState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? darkmatter = null,
  }) {
    return _then(_$_AchievemetRiverpodState(
      darkmatter: null == darkmatter
          ? _value.darkmatter
          : darkmatter // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_AchievemetRiverpodState
    with DiagnosticableTreeMixin
    implements _AchievemetRiverpodState {
  const _$_AchievemetRiverpodState({required this.darkmatter});

  @override
  final double darkmatter;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AchievementRiverpodState(darkmatter: $darkmatter)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AchievementRiverpodState'))
      ..add(DiagnosticsProperty('darkmatter', darkmatter));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AchievemetRiverpodState &&
            (identical(other.darkmatter, darkmatter) ||
                other.darkmatter == darkmatter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, darkmatter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AchievemetRiverpodStateCopyWith<_$_AchievemetRiverpodState>
      get copyWith =>
          __$$_AchievemetRiverpodStateCopyWithImpl<_$_AchievemetRiverpodState>(
              this, _$identity);
}

abstract class _AchievemetRiverpodState implements AchievementRiverpodState {
  const factory _AchievemetRiverpodState({required final double darkmatter}) =
      _$_AchievemetRiverpodState;

  @override
  double get darkmatter;
  @override
  @JsonKey(ignore: true)
  _$$_AchievemetRiverpodStateCopyWith<_$_AchievemetRiverpodState>
      get copyWith => throw _privateConstructorUsedError;
}