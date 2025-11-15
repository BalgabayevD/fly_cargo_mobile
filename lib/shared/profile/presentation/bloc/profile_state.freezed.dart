part of 'profile_state.dart';






T _$identity<T>(T value) => value;

mixin _$ProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState()';
}


}


class $ProfileStateCopyWith<$Res>  {
$ProfileStateCopyWith(ProfileState _, $Res Function(ProfileState) __);
}



extension ProfileStatePatterns on ProfileState {












@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProfileInitial value)?  initial,TResult Function( ProfileLoading value)?  loading,TResult Function( ProfileLoaded value)?  loaded,TResult Function( ProfileError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProfileInitial() when initial != null:
return initial(_that);case ProfileLoading() when loading != null:
return loading(_that);case ProfileLoaded() when loaded != null:
return loaded(_that);case ProfileError() when error != null:
return error(_that);case _:
  return orElse();

}
}













@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProfileInitial value)  initial,required TResult Function( ProfileLoading value)  loading,required TResult Function( ProfileLoaded value)  loaded,required TResult Function( ProfileError value)  error,}){
final _that = this;
switch (_that) {
case ProfileInitial():
return initial(_that);case ProfileLoading():
return loading(_that);case ProfileLoaded():
return loaded(_that);case ProfileError():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
}












@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProfileInitial value)?  initial,TResult? Function( ProfileLoading value)?  loading,TResult? Function( ProfileLoaded value)?  loaded,TResult? Function( ProfileError value)?  error,}){
final _that = this;
switch (_that) {
case ProfileInitial() when initial != null:
return initial(_that);case ProfileLoading() when loading != null:
return loading(_that);case ProfileLoaded() when loaded != null:
return loaded(_that);case ProfileError() when error != null:
return error(_that);case _:
  return null;

}
}












@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( UserProfile profile,  int daysSinceCreated)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProfileInitial() when initial != null:
return initial();case ProfileLoading() when loading != null:
return loading();case ProfileLoaded() when loaded != null:
return loaded(_that.profile,_that.daysSinceCreated);case ProfileError() when error != null:
return error(_that.message);case _:
  return orElse();

}
}













@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( UserProfile profile,  int daysSinceCreated)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case ProfileInitial():
return initial();case ProfileLoading():
return loading();case ProfileLoaded():
return loaded(_that.profile,_that.daysSinceCreated);case ProfileError():
return error(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}












@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( UserProfile profile,  int daysSinceCreated)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case ProfileInitial() when initial != null:
return initial();case ProfileLoading() when loading != null:
return loading();case ProfileLoaded() when loaded != null:
return loaded(_that.profile,_that.daysSinceCreated);case ProfileError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}




class ProfileInitial implements ProfileState {
  const ProfileInitial();







@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.initial()';
}


}







class ProfileLoading implements ProfileState {
  const ProfileLoading();







@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.loading()';
}


}







class ProfileLoaded implements ProfileState {
  const ProfileLoaded({required this.profile, required this.daysSinceCreated});


 final  UserProfile profile;
 final  int daysSinceCreated;



@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileLoadedCopyWith<ProfileLoaded> get copyWith => _$ProfileLoadedCopyWithImpl<ProfileLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileLoaded&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.daysSinceCreated, daysSinceCreated) || other.daysSinceCreated == daysSinceCreated));
}


@override
int get hashCode => Object.hash(runtimeType,profile,daysSinceCreated);

@override
String toString() {
  return 'ProfileState.loaded(profile: $profile, daysSinceCreated: $daysSinceCreated)';
}


}


abstract mixin class $ProfileLoadedCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory $ProfileLoadedCopyWith(ProfileLoaded value, $Res Function(ProfileLoaded) _then) = _$ProfileLoadedCopyWithImpl;
@useResult
$Res call({
 UserProfile profile, int daysSinceCreated
});




}

class _$ProfileLoadedCopyWithImpl<$Res>
    implements $ProfileLoadedCopyWith<$Res> {
  _$ProfileLoadedCopyWithImpl(this._self, this._then);

  final ProfileLoaded _self;
  final $Res Function(ProfileLoaded) _then;



@pragma('vm:prefer-inline') $Res call({Object? profile = null,Object? daysSinceCreated = null,}) {
  return _then(ProfileLoaded(
profile: null == profile ? _self.profile : profile
as UserProfile,daysSinceCreated: null == daysSinceCreated ? _self.daysSinceCreated : daysSinceCreated
as int,
  ));
}


}




class ProfileError implements ProfileState {
  const ProfileError({required this.message});


 final  String message;



@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileErrorCopyWith<ProfileError> get copyWith => _$ProfileErrorCopyWithImpl<ProfileError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProfileState.error(message: $message)';
}


}


abstract mixin class $ProfileErrorCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory $ProfileErrorCopyWith(ProfileError value, $Res Function(ProfileError) _then) = _$ProfileErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}

class _$ProfileErrorCopyWithImpl<$Res>
    implements $ProfileErrorCopyWith<$Res> {
  _$ProfileErrorCopyWithImpl(this._self, this._then);

  final ProfileError _self;
  final $Res Function(ProfileError) _then;



@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ProfileError(
message: null == message ? _self.message : message
as String,
  ));
}


}
