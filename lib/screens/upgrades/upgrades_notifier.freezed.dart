// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upgrades_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UpgradeRiverpodState {
  double get darkmatter => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpgradeRiverpodStateCopyWith<UpgradeRiverpodState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpgradeRiverpodStateCopyWith<$Res> {
  factory $UpgradeRiverpodStateCopyWith(UpgradeRiverpodState value,
          $Res Function(UpgradeRiverpodState) then) =
      _$UpgradeRiverpodStateCopyWithImpl<$Res, UpgradeRiverpodState>;
  @useResult
  $Res call({double darkmatter});
}

/// @nodoc
class _$UpgradeRiverpodStateCopyWithImpl<$Res,
        $Val extends UpgradeRiverpodState>
    implements $UpgradeRiverpodStateCopyWith<$Res> {
  _$UpgradeRiverpodStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_UpgradeRiverpodStateCopyWith<$Res>
    implements $UpgradeRiverpodStateCopyWith<$Res> {
  factory _$$_UpgradeRiverpodStateCopyWith(_$_UpgradeRiverpodState value,
          $Res Function(_$_UpgradeRiverpodState) then) =
      __$$_UpgradeRiverpodStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double darkmatter});
}

/// @nodoc
class __$$_UpgradeRiverpodStateCopyWithImpl<$Res>
    extends _$UpgradeRiverpodStateCopyWithImpl<$Res, _$_UpgradeRiverpodState>
    implements _$$_UpgradeRiverpodStateCopyWith<$Res> {
  __$$_UpgradeRiverpodStateCopyWithImpl(_$_UpgradeRiverpodState _value,
      $Res Function(_$_UpgradeRiverpodState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? darkmatter = null,
  }) {
    return _then(_$_UpgradeRiverpodState(
      darkmatter: null == darkmatter
          ? _value.darkmatter
          : darkmatter // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_UpgradeRiverpodState
    with DiagnosticableTreeMixin
    implements _UpgradeRiverpodState {
  const _$_UpgradeRiverpodState({required this.darkmatter});

  @override
  final double darkmatter;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UpgradeRiverpodState(darkmatter: $darkmatter)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UpgradeRiverpodState'))
      ..add(DiagnosticsProperty('darkmatter', darkmatter));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpgradeRiverpodState &&
            (identical(other.darkmatter, darkmatter) ||
                other.darkmatter == darkmatter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, darkmatter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpgradeRiverpodStateCopyWith<_$_UpgradeRiverpodState> get copyWith =>
      __$$_UpgradeRiverpodStateCopyWithImpl<_$_UpgradeRiverpodState>(
          this, _$identity);
}

abstract class _UpgradeRiverpodState implements UpgradeRiverpodState {
  const factory _UpgradeRiverpodState({required final double darkmatter}) =
      _$_UpgradeRiverpodState;

  @override
  double get darkmatter;
  @override
  @JsonKey(ignore: true)
  _$$_UpgradeRiverpodStateCopyWith<_$_UpgradeRiverpodState> get copyWith =>
      throw _privateConstructorUsedError;
}
