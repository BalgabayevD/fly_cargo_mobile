import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:html/parser.dart' show parse;
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

typedef Encodable = Object? Function(dynamic object);

class LoggerInterceptor extends Interceptor {
  final Talker _talker;

  /// [TalkerDioLogger] settings and customization
  TalkerDioLoggerSettings settings;
  final String? addonId;

  final Encodable? requestHeadersLogEncodable;
  final Encodable? requestBodyLogEncodable;
  final Encodable? responseHeadersLogEncodable;
  final Encodable? responseBodyLogEncodable;

  LoggerInterceptor({
    required Talker? talker,
    this.settings = const TalkerDioLoggerSettings(),
    this.addonId,
    this.requestHeadersLogEncodable,
    this.requestBodyLogEncodable,
    this.responseHeadersLogEncodable,
    this.responseBodyLogEncodable,
  }) : _talker = talker ?? Talker();

  /// Method to update [settings] of [TalkerDioLogger]
  void configure({
    bool? printResponseData,
    bool? printResponseHeaders,
    bool? printResponseMessage,
    bool? printRequestData,
    bool? printRequestHeaders,
    AnsiPen? requestPen,
    AnsiPen? responsePen,
    AnsiPen? errorPen,
  }) {
    settings = settings.copyWith(
      printRequestData: printRequestData,
      printRequestHeaders: printRequestHeaders,
      printResponseData: printResponseData,
      printResponseHeaders: printResponseHeaders,
      printResponseMessage: printResponseMessage,
      requestPen: requestPen,
      responsePen: responsePen,
      errorPen: errorPen,
    );
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    super.onRequest(options, handler);
    final accepted = settings.requestFilter?.call(options) ?? true;
    if (!accepted) {
      return;
    }
    try {
      final message = '${options.uri}';
      final httpLog = DioRequestEncodableLog(
        message,
        requestOptions: options,
        settings: settings,
        requestHeadersLogEncodable: requestHeadersLogEncodable,
        requestBodyLogEncodable: requestBodyLogEncodable,
      );
      _talker.logTyped(httpLog);
    } catch (_) {
      //pass
    }
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    super.onResponse(response, handler);
    final accepted = settings.responseFilter?.call(response) ?? true;
    if (!accepted) {
      return;
    }
    try {
      final message = '${response.requestOptions.uri}';
      final httpLog = DioResponseEncodableLog(
        message,
        settings: settings,
        response: response,
        responseHeadersLogEncodable: responseHeadersLogEncodable,
        responseBodyLogEncodable: responseBodyLogEncodable,
      );
      _talker.logTyped(httpLog);
    } catch (_) {
      //pass
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    final message = '${err.requestOptions.uri}';
    final httpLog = DioErrorEncodableLog(
      message,
      settings: settings,
      err: err,
      responseHeadersLogEncodable: responseHeadersLogEncodable,
      responseBodyLogEncodable: responseBodyLogEncodable,
    );
    _talker.logTyped(httpLog);
  }
}

class DioRequestEncodableLog extends TalkerLog {
  final Encodable? requestHeadersLogEncodable;
  final Encodable? requestBodyLogEncodable;

  final RequestOptions requestOptions;
  final TalkerDioLoggerSettings settings;

  DioRequestEncodableLog(
    String super.message, {
    required this.requestOptions,
    required this.settings,
    this.requestHeadersLogEncodable,
    this.requestBodyLogEncodable,
  });

  @override
  AnsiPen get pen => settings.requestPen ?? (AnsiPen()..xterm(219));

  @override
  String get key => 'http_request';

  @override
  String generateTextMessage({TimeFormat? timeFormat}) {
    var msg = '[$title] [${requestOptions.method}] $message';

    final data = requestOptions.data;
    final headers = requestOptions.headers;

    if (settings.printRequestData && data != null) {
      try {
        final encoded = requestBodyLogEncodable?.call(data) ?? data;
        final prettyData = const JsonEncoder.withIndent('  ').convert(encoded);
        msg += '\nData: $prettyData';
      } catch (e) {
        msg += '\nDataParseException: $e';
      }
    }
    if (settings.printRequestHeaders && headers.isNotEmpty) {
      try {
        final encoded = requestHeadersLogEncodable?.call(headers) ?? headers;
        final prettyHeaders = const JsonEncoder.withIndent(
          '  ',
        ).convert(encoded);
        msg += '\nHeaders: $prettyHeaders';
      } catch (e) {
        msg += '\nnHeadersParseException: $e';
      }
    }

    return msg;
  }
}

class DioResponseEncodableLog extends TalkerLog {
  final Encodable? responseHeadersLogEncodable;
  final Encodable? responseBodyLogEncodable;

  final Response<dynamic> response;
  final TalkerDioLoggerSettings settings;

  DioResponseEncodableLog(
    String super.message, {
    required this.response,
    required this.settings,
    this.responseHeadersLogEncodable,
    this.responseBodyLogEncodable,
  });

  @override
  AnsiPen get pen => settings.responsePen ?? (AnsiPen()..xterm(46));

  @override
  String get key => 'http_response';

  @override
  String generateTextMessage({TimeFormat? timeFormat}) {
    var msg = '[$title] [${response.requestOptions.method}] $message';

    final responseMessage = response.statusMessage;
    final data = response.data;
    final headers = response.headers.map;

    msg += '\nStatus: ${response.statusCode}';

    if (settings.printResponseMessage && responseMessage != null) {
      msg += '\nMessage: $responseMessage';
    }

    if (settings.printResponseData && data != null) {
      try {
        if (response.requestOptions.responseType == ResponseType.bytes) {
          msg += '\nData: binary data';
        } else {
          final encoded = responseBodyLogEncodable?.call(data) ?? data;
          final prettyData = const JsonEncoder.withIndent(
            '  ',
          ).convert(encoded);
          msg += '\nData: $prettyData';
        }
      } catch (e) {
        msg += '\nDataParseException: $e';
      }
    }
    if (settings.printResponseHeaders && headers.isNotEmpty) {
      try {
        final encoded = responseHeadersLogEncodable?.call(headers) ?? headers;
        final prettyHeaders = const JsonEncoder.withIndent(
          '  ',
        ).convert(encoded);
        msg += '\nHeaders: $prettyHeaders';
      } catch (e) {
        msg += '\nnHeadersParseException: $e';
      }
    }

    return msg;
  }
}

class DioErrorEncodableLog extends TalkerLog {
  final Encodable? responseHeadersLogEncodable;
  final Encodable? responseBodyLogEncodable;

  final DioException err;
  final TalkerDioLoggerSettings settings;

  DioErrorEncodableLog(
    super.message, {
    required this.err,
    required this.settings,
    this.responseHeadersLogEncodable,
    this.responseBodyLogEncodable,
  });

  @override
  AnsiPen get pen => settings.errorPen ?? (AnsiPen()..red());

  @override
  String get key => 'http_error';

  @override
  LogLevel get logLevel => LogLevel.error;

  @override
  String generateTextMessage({TimeFormat? timeFormat}) {
    var msg = '[$title] [${err.requestOptions.method}] $message';

    msg += '\nStatus: ${err.response?.statusCode}';
    msg += '\nType: ${err.type}';
    final response = err.response;

    if (settings.printResponseMessage && err.message != null) {
      msg += '\nMessage: $message';
    }

    if (settings.printResponseData && response?.data != null) {
      try {
        final encoded =
            responseBodyLogEncodable?.call(response?.data) ?? response?.data;
        final prettyData = const JsonEncoder.withIndent('  ').convert(encoded);
        msg += '\nData: $prettyData';
      } catch (e) {
        final data = response?.data ?? '';
        final htmlRegExp = RegExp(r'<[^>]*>');
        if (htmlRegExp.hasMatch(data)) {
          try {
            final document = parse(data);
            msg += '\nData: ${document.outerHtml}';
          } catch (ex) {
            msg += '\nDataParseException: $ex';
          }
        } else {
          msg += '\nDataParseException: $e';
        }
      }
    }
    if (settings.printResponseHeaders && (response?.headers.isEmpty == false)) {
      try {
        final encoded =
            responseHeadersLogEncodable?.call(response?.headers) ??
            response?.headers;
        final prettyHeaders = const JsonEncoder.withIndent(
          '  ',
        ).convert(encoded);
        msg += '\nHeaders: $prettyHeaders';
      } catch (e) {
        msg += '\nHeadersParseException: $e';
      }
    }
    return msg;
  }
}
