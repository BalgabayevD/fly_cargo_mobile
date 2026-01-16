import 'package:dio/dio.dart';

abstract class OrderPhotosRepository {
  Future<String> uploadPhoto(FormData form);
}
