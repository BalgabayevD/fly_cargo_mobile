import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
extension BuildContextX on BuildContext {
  GetIt get di => GetIt.instance;
}
