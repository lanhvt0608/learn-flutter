// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:section2/app/app_prefs.dart';
import 'package:section2/app/constant.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUARE = "language";

class DioFactory {
  AppPreferences _appPreferences;

  DioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();

    int _timeout = 1; // 1 minute
    String language = await _appPreferences.getApplanguage();
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: Constants.token,
      DEFAULT_LANGUARE: language // todo get language from app prefs
    };

    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      receiveTimeout: Duration(minutes: _timeout),
      connectTimeout: Duration(minutes: _timeout),
      headers: headers,
    );

    if (kReleaseMode) {
      print("Release mode no Logs");
    } else {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }

    return dio;
  }
}
