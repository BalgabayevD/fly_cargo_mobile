import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

enum ViewType {
  close,
  delete,
}

class OrderPhoto extends Equatable {
  final Key key;
  final File file;
  final String? fingerprint;
  final bool isUploading;

  const OrderPhoto(
    this.key,
    this.file, {
    this.fingerprint,
    this.isUploading = false,
  });

  OrderPhoto copyWith({
    Key? key,
    File? file,
    String? fingerprint,
    bool? isUploading,
  }) {
    return OrderPhoto(
      key ?? this.key,
      file ?? this.file,
      fingerprint: fingerprint ?? this.fingerprint,
      isUploading: isUploading ?? this.isUploading,
    );
  }

  @override
  List<Object?> get props => [file, fingerprint, isUploading];
}
