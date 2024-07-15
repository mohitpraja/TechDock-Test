import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:tech_dock_test/service/hive/apiCaching/api_response_box.dart';

class ApiCacheHelper {
  static String apiKey = '';
  static const int _cacheTimeout = 24 * 60 * 60 * 1000; // 24 hour
  static deleteAllApiCache() async {
    log('*** all api cache cleared***');
    final box = await Hive.openBox('apiResponses');
    box.clear();
  }

  static getApiDb() async {
    final box = await Hive.openBox('apiResponses');
    return box;
  }

  static Future<Response<dynamic>> getJsonResponse(
      {required String endpoint, bool? isCached}) async {
    log('end point : $endpoint');
    final box = await Hive.openBox('apiResponses');
    final cachedResponse = box.values.firstWhere(
      (response) {
        return response.url == endpoint;
      },
      orElse: () {
        return null;
      },
    ); //returns first element according to the condition or empty object

    if (isCached == false || isCached == null) {
      if (cachedResponse != null &&
          DateTime.now().millisecondsSinceEpoch - cachedResponse.timestamp! <
              _cacheTimeout) {
        // Return cached response if it's not expired yet
        log('***Cached Data***');
        Response response = Response(
          requestOptions: RequestOptions(
            headers: {
              "Content-Type": "application/json",
            },
          ),
          data: cachedResponse.response,
          statusCode: 200,
        );
        return response;
      }
    }
    log('***Api hit***');

    // Fetch new response if cache is expired or not available
    Response response = await Dio().get(
        options: Options(
            headers: {"Content-Type": "application/json", "x-api-key": apiKey}),
        endpoint);
    // Save new response to cache
    final Map<dynamic, dynamic> allApis = box.toMap();
    allApis.forEach((i, value) {
      if (value.url == endpoint) {
        log('***delete cld***');
        box.delete(i);
      }
    });

    final newResponse = ApiResponseBox()
      ..url = endpoint
      ..response = jsonEncode(response.data)
      ..timestamp = DateTime.now().millisecondsSinceEpoch;
    await box.add(newResponse);

    Response finalResponse = Response(
      requestOptions: RequestOptions(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: jsonEncode(response.data),
      statusCode: 200,
    );

    return finalResponse;
  }
}
