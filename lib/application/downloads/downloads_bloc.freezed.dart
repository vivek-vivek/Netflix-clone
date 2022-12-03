// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'downloads_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DownloadsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getDownlodsImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getDownlodsImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getDownlodsImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDownlodsImage value) getDownlodsImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDownlodsImage value)? getDownlodsImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDownlodsImage value)? getDownlodsImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadsEventCopyWith<$Res> {
  factory $DownloadsEventCopyWith(
          DownloadsEvent value, $Res Function(DownloadsEvent) then) =
      _$DownloadsEventCopyWithImpl<$Res, DownloadsEvent>;
}

/// @nodoc
class _$DownloadsEventCopyWithImpl<$Res, $Val extends DownloadsEvent>
    implements $DownloadsEventCopyWith<$Res> {
  _$DownloadsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetDownlodsImageCopyWith<$Res> {
  factory _$$_GetDownlodsImageCopyWith(
          _$_GetDownlodsImage value, $Res Function(_$_GetDownlodsImage) then) =
      __$$_GetDownlodsImageCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetDownlodsImageCopyWithImpl<$Res>
    extends _$DownloadsEventCopyWithImpl<$Res, _$_GetDownlodsImage>
    implements _$$_GetDownlodsImageCopyWith<$Res> {
  __$$_GetDownlodsImageCopyWithImpl(
      _$_GetDownlodsImage _value, $Res Function(_$_GetDownlodsImage) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetDownlodsImage implements _GetDownlodsImage {
  const _$_GetDownlodsImage();

  @override
  String toString() {
    return 'DownloadsEvent.getDownlodsImage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetDownlodsImage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getDownlodsImage,
  }) {
    return getDownlodsImage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getDownlodsImage,
  }) {
    return getDownlodsImage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getDownlodsImage,
    required TResult orElse(),
  }) {
    if (getDownlodsImage != null) {
      return getDownlodsImage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetDownlodsImage value) getDownlodsImage,
  }) {
    return getDownlodsImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetDownlodsImage value)? getDownlodsImage,
  }) {
    return getDownlodsImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetDownlodsImage value)? getDownlodsImage,
    required TResult orElse(),
  }) {
    if (getDownlodsImage != null) {
      return getDownlodsImage(this);
    }
    return orElse();
  }
}

abstract class _GetDownlodsImage implements DownloadsEvent {
  const factory _GetDownlodsImage() = _$_GetDownlodsImage;
}

/// @nodoc
mixin _$DownloadsState {
  bool get isloading => throw _privateConstructorUsedError;
  List<Downloads>? get downloads => throw _privateConstructorUsedError;
  Option<Either<MainFailures, List<Downloads>>>
      get downloadsFailureSuccessOption => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DownloadsStateCopyWith<DownloadsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadsStateCopyWith<$Res> {
  factory $DownloadsStateCopyWith(
          DownloadsState value, $Res Function(DownloadsState) then) =
      _$DownloadsStateCopyWithImpl<$Res, DownloadsState>;
  @useResult
  $Res call(
      {bool isloading,
      List<Downloads>? downloads,
      Option<Either<MainFailures, List<Downloads>>>
          downloadsFailureSuccessOption});
}

/// @nodoc
class _$DownloadsStateCopyWithImpl<$Res, $Val extends DownloadsState>
    implements $DownloadsStateCopyWith<$Res> {
  _$DownloadsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isloading = null,
    Object? downloads = freezed,
    Object? downloadsFailureSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      isloading: null == isloading
          ? _value.isloading
          : isloading // ignore: cast_nullable_to_non_nullable
              as bool,
      downloads: freezed == downloads
          ? _value.downloads
          : downloads // ignore: cast_nullable_to_non_nullable
              as List<Downloads>?,
      downloadsFailureSuccessOption: null == downloadsFailureSuccessOption
          ? _value.downloadsFailureSuccessOption
          : downloadsFailureSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailures, List<Downloads>>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DownloadsStateCopyWith<$Res>
    implements $DownloadsStateCopyWith<$Res> {
  factory _$$_DownloadsStateCopyWith(
          _$_DownloadsState value, $Res Function(_$_DownloadsState) then) =
      __$$_DownloadsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isloading,
      List<Downloads>? downloads,
      Option<Either<MainFailures, List<Downloads>>>
          downloadsFailureSuccessOption});
}

/// @nodoc
class __$$_DownloadsStateCopyWithImpl<$Res>
    extends _$DownloadsStateCopyWithImpl<$Res, _$_DownloadsState>
    implements _$$_DownloadsStateCopyWith<$Res> {
  __$$_DownloadsStateCopyWithImpl(
      _$_DownloadsState _value, $Res Function(_$_DownloadsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isloading = null,
    Object? downloads = freezed,
    Object? downloadsFailureSuccessOption = null,
  }) {
    return _then(_$_DownloadsState(
      isloading: null == isloading
          ? _value.isloading
          : isloading // ignore: cast_nullable_to_non_nullable
              as bool,
      downloads: freezed == downloads
          ? _value._downloads
          : downloads // ignore: cast_nullable_to_non_nullable
              as List<Downloads>?,
      downloadsFailureSuccessOption: null == downloadsFailureSuccessOption
          ? _value.downloadsFailureSuccessOption
          : downloadsFailureSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailures, List<Downloads>>>,
    ));
  }
}

/// @nodoc

class _$_DownloadsState implements _DownloadsState {
  const _$_DownloadsState(
      {required this.isloading,
      required final List<Downloads>? downloads,
      required this.downloadsFailureSuccessOption})
      : _downloads = downloads;

  @override
  final bool isloading;
  final List<Downloads>? _downloads;
  @override
  List<Downloads>? get downloads {
    final value = _downloads;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Option<Either<MainFailures, List<Downloads>>>
      downloadsFailureSuccessOption;

  @override
  String toString() {
    return 'DownloadsState(isloading: $isloading, downloads: $downloads, downloadsFailureSuccessOption: $downloadsFailureSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DownloadsState &&
            (identical(other.isloading, isloading) ||
                other.isloading == isloading) &&
            const DeepCollectionEquality()
                .equals(other._downloads, _downloads) &&
            (identical(other.downloadsFailureSuccessOption,
                    downloadsFailureSuccessOption) ||
                other.downloadsFailureSuccessOption ==
                    downloadsFailureSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isloading,
      const DeepCollectionEquality().hash(_downloads),
      downloadsFailureSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DownloadsStateCopyWith<_$_DownloadsState> get copyWith =>
      __$$_DownloadsStateCopyWithImpl<_$_DownloadsState>(this, _$identity);
}

abstract class _DownloadsState implements DownloadsState {
  const factory _DownloadsState(
      {required final bool isloading,
      required final List<Downloads>? downloads,
      required final Option<Either<MainFailures, List<Downloads>>>
          downloadsFailureSuccessOption}) = _$_DownloadsState;

  @override
  bool get isloading;
  @override
  List<Downloads>? get downloads;
  @override
  Option<Either<MainFailures, List<Downloads>>>
      get downloadsFailureSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_DownloadsStateCopyWith<_$_DownloadsState> get copyWith =>
      throw _privateConstructorUsedError;
}
