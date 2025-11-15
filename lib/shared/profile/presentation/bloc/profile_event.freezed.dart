part of 'profile_event.dart';






T _$identity<T>(T value) => value;

mixin _$ProfileEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent()';
}


}


class $ProfileEventCopyWith<$Res>  {
$ProfileEventCopyWith(ProfileEvent _, $Res Function(ProfileEvent) __);
}



extension ProfileEventPatterns on ProfileEvent {












@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadProfile value)?  loadProfile,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadProfile() when loadProfile != null:
return loadProfile(_that);case _:
  return orElse();

}
}













@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadProfile value)  loadProfile,}){
final _that = this;
switch (_that) {
case LoadProfile():
return loadProfile(_that);case _:
  throw StateError('Unexpected subclass');

}
}












@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadProfile value)?  loadProfile,}){
final _that = this;
switch (_that) {
case LoadProfile() when loadProfile != null:
return loadProfile(_that);case _:
  return null;

}
}












@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadProfile,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadProfile() when loadProfile != null:
return loadProfile();case _:
  return orElse();

}
}













@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadProfile,}) {final _that = this;
switch (_that) {
case LoadProfile():
return loadProfile();case _:
  throw StateError('Unexpected subclass');

}
}












@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadProfile,}) {final _that = this;
switch (_that) {
case LoadProfile() when loadProfile != null:
return loadProfile();case _:
  return null;

}
}

}




class LoadProfile implements ProfileEvent {
  const LoadProfile();







@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadProfile);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.loadProfile()';
}


}
