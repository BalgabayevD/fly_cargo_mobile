import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

enum ViewType {
  close,
  delete,
}

class OrderPhotoEntity extends Equatable {
  final Key key;
  final File file;
  final String? fingerprint;
  final bool isUploading;

  const OrderPhotoEntity(
    this.key,
    this.file, {
    this.fingerprint,
    this.isUploading = false,
  });

  OrderPhotoEntity copyWith({
    Key? key,
    File? file,
    String? fingerprint,
    bool? isUploading,
  }) {
    return OrderPhotoEntity(
      key ?? this.key,
      file ?? this.file,
      fingerprint: fingerprint ?? this.fingerprint,
      isUploading: isUploading ?? this.isUploading,
    );
  }

  @override
  List<Object?> get props => [file, fingerprint, isUploading];
}
