import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_commons/api_requests/api_manager.dart';


export 'package:ff_commons/api_requests/api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetTestQuestionsCall {
  static Future<ApiCallResponse> call({
    String? openAnswer = 'tässä avoin vastaus',
    String? sessionId = 'abc123',
    int? answer = 1,
    String? testId = 'testId',
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "sessionId": "${escapeStringForJson(sessionId)}",
  "testId": "${escapeStringForJson(testId)}",
  "answer": ${answer},
  "openAnswer":"${escapeStringForJson(openAnswer)}",
  "userId": "${escapeStringForJson(userId)}"
}
''';
    return ApiManager.instance.makeApiCall(
      callName: 'getTestQuestions',
      apiUrl: 'https://www.midconsulting.io/api/getTestQuestionsV3',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? role(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message.role''',
      ));
  static String? content(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message.content''',
      ));
  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static int? current(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.currentQuestion''',
      ));
  static int? total(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalQuestions''',
      ));
  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static String? question(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.questionContent''',
      ));
  static String? error(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error''',
      ));
  static bool? completed(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.completed''',
      ));
  static bool? debug(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.debug''',
      ));
}

class SaveTestAnswersCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? testId = '',
    int? currentQuestion,
    int? answer,
    String? sessionId = 'abc123',
  }) async {
    final ffApiRequestBody = '''
{
  "sessionId": "\$sessionId",
  "testId": "\$testId",
  "currentQuestion": "\$currentQuestion",
  "answer": "\$answer"
}

''';
    return ApiManager.instance.makeApiCall(
      callName: 'saveTestAnswers',
      apiUrl: 'https://midconsulting.io/api/saveTestAnswers',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetWorkandwellbeingTestsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getWorkandwellbeingTests ',
      apiUrl: 'https://midconsulting.io/api/getTestByCategoryAndLanguageV2',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'category': "Workandwellbeing",
        'language': "fi",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetGrowthAndStrengthTestsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getGrowthAndStrengthTests ',
      apiUrl: 'https://midconsulting.io/api/getTestByCategoryAndLanguageV2',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'category': "GrowthAndStrength",
        'language': "fi",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetConnectionAndBelongingTestsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getConnectionAndBelongingTests ',
      apiUrl: 'https://midconsulting.io/api/getTestByCategoryAndLanguageV2',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'category': "ConnectionAndBelonging",
        'language': "fi",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetThinkingAndDecisionsTestsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getThinkingAndDecisionsTests ',
      apiUrl: 'https://midconsulting.io/api/getTestByCategoryAndLanguageV2',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'category': "ThinkingAndDecisions",
        'language': "fi",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetTestsByCategoryAndLanguageMoodCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getTestsByCategoryAndLanguageMood',
      apiUrl: 'https://midconsulting.io/api/getTestByCategoryAndLanguageV2',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'category': "FeelingsAndMood",
        'language': "fi",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SubmitTapEntryVercelConfidenceCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? type = '',
    double? value,
    String? language = '',
    String? context = '',
    String? customContext = '',
    String? date = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "${escapeStringForJson(userId)}",
  "type": "${escapeStringForJson(type)}",
  "value": ${value},
  "language": "${escapeStringForJson(language)}",
  "context": "${escapeStringForJson(context)}",
  "date": "${escapeStringForJson(date)}",
  "customContext": "${escapeStringForJson(customContext)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'submitTapEntryVercelConfidence',
      apiUrl: 'https://www.midconsulting.io/api/submitMoodEntry',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? summary(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.summary''',
      ));
  static double? average(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.average''',
      ));
  static dynamic saved(dynamic response) => getJsonField(
        response,
        r'''$.saved''',
      );
  static String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.saved.userId''',
      ));
  static String? type(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.saved.type''',
      ));
  static double? value(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.saved.value''',
      ));
  static String? date(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.saved.date''',
      ));
  static int? year(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.saved.year''',
      ));
  static int? week(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.saved.week''',
      ));
}

class SubmitTapEntryVercelBelongingCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? type = '',
    double? value,
    String? language = '',
    String? context = '',
    String? customContext = '',
    String? date = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "${escapeStringForJson(userId)}",
  "type": "${escapeStringForJson(type)}",
  "value": ${value},
  "language": "${escapeStringForJson(language)}",
  "context": "${escapeStringForJson(context)}",
  "date": "${escapeStringForJson(date)}",
  "customContext": "${escapeStringForJson(customContext)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'submitTapEntryVercelBelonging ',
      apiUrl: 'https://www.midconsulting.io/api/submitMoodEntry',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? summary(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.summary''',
      ));
  static double? average(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.average''',
      ));
  static dynamic saved(dynamic response) => getJsonField(
        response,
        r'''$.saved''',
      );
  static String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.saved.userId''',
      ));
  static String? type(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.saved.type''',
      ));
  static int? value(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.saved.value''',
      ));
  static String? date(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.saved.date''',
      ));
  static int? year(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.saved.year''',
      ));
  static int? week(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.saved.week''',
      ));
}

class SubmitTapEntryVercelStrengthCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? type = '',
    double? value,
    String? language = '',
    String? context = '',
    String? customContext = '',
    String? date = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "${escapeStringForJson(userId)}",
  "type": "${escapeStringForJson(type)}",
  "value": ${value},
  "language": "${escapeStringForJson(language)}",
  "context": "${escapeStringForJson(context)}",
  "date": "${escapeStringForJson(date)}",
  "customContext":"${escapeStringForJson(customContext)}"
}
''';
    return ApiManager.instance.makeApiCall(
      callName: 'submitTapEntryVercelStrength ',
      apiUrl: 'https://www.midconsulting.io/api/submitMoodEntry',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? summary(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.summary''',
      ));
  static double? average(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.average''',
      ));
  static dynamic saved(dynamic response) => getJsonField(
        response,
        r'''$.saved''',
      );
  static String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.saved.userId''',
      ));
  static String? type(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.saved.type''',
      ));
  static int? value(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.saved.value''',
      ));
  static String? date(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.saved.date''',
      ));
  static int? year(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.saved.year''',
      ));
  static int? week(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.saved.week''',
      ));
}

class SubmitTapEntryVercelMoodCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? type = '',
    double? value,
    String? language = '',
    String? context = '',
    String? customContext = '',
    String? date = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userId":"${escapeStringForJson(userId)}",
  "type": "${escapeStringForJson(type)}",
  "value":${value},
  "language": "${escapeStringForJson(language)}",
  "context": "${escapeStringForJson(context)}",
  "date": "${escapeStringForJson(date)}",
  "customContext": "${escapeStringForJson(customContext)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'submitTapEntryVercelMood',
      apiUrl: 'https://www.midconsulting.io/api/submitMoodEntry',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? summary(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.summary''',
      ));
  static double? average(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.average''',
      ));
  static dynamic saved(dynamic response) => getJsonField(
        response,
        r'''$.saved''',
      );
  static String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.saved.userId''',
      ));
  static String? type(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.saved.type''',
      ));
  static int? value(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.saved.value''',
      ));
  static String? date(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.saved.date''',
      ));
  static int? year(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.saved.year''',
      ));
  static int? week(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.saved.week''',
      ));
}

class GetDailySummaryConfidenceCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? date = '',
    String? type = '',
    String? language = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getDailySummaryConfidence',
      apiUrl: 'https://www.midconsulting.io/api/getDailySummaryV2',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'Application/json',
      },
      params: {
        'type': type,
        'date': date,
        'language': language,
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? error(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error''',
      ));
  static String? summary(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.summary''',
      ));
  static String? language(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.language''',
      ));
  static String? date(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.date''',
      ));
  static int? average(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.average''',
      ));
}

class GetDailySummaryStrengthCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? type = '',
    String? date = '',
    String? language = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getDailySummaryStrength ',
      apiUrl: 'https://www.midconsulting.io/api/getDailySummaryV2',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'Application/json',
      },
      params: {
        'userId': userId,
        'type': type,
        'date': date,
        'language': language,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? error(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error''',
      ));
  static String? summary(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.summary''',
      ));
  static String? language(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.language''',
      ));
  static String? date(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.date''',
      ));
  static double? average(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.average''',
      ));
}

class GetDailySummaryBelongingCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? date = '',
    String? type = '',
    String? language = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getDailySummaryBelonging ',
      apiUrl: 'https://www.midconsulting.io/api/getDailySummaryV2',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'Application/json',
      },
      params: {
        'userId': userId,
        'type': type,
        'date': date,
        'language': language,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? error(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error''',
      ));
  static dynamic preview(dynamic response) => getJsonField(
        response,
        r'''$.summary''',
      );
  static String? language(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.language''',
      ));
  static String? date(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.date''',
      ));
  static int? average(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.average''',
      ));
}

class GetDailySummaryMoodCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? language = '',
    String? date = '',
    String? type = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getDailySummaryMood',
      apiUrl: 'https://www.midconsulting.io/api/getDailySummaryV2',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'userId': userId,
        'date': date,
        'language': language,
        'type': type,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? error(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error''',
      ));
  static String? language(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.language''',
      ));
  static String? date(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.date''',
      ));
  static String? summary(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.summary''',
      ));
  static dynamic preview(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
  static int? average(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.average''',
      ));
}

class GetEntriesByRangeStrengthCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? type = '',
    String? date = '',
    String? range = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getEntriesByRangeStrength',
      apiUrl: 'https://www.midconsulting.io/api/getEntriesByRange',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'userId': userId,
        'type': type,
        'date': date,
        'range': range,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List? entries(dynamic response) => getJsonField(
        response,
        r'''$.entries''',
        true,
      ) as List?;
  static List<int>? value(dynamic response) => (getJsonField(
        response,
        r'''$.entries[:].value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? timestamp(dynamic response) => (getJsonField(
        response,
        r'''$.entries[:].timestamp''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static double? average(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.average''',
      ));
  static double? color(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.progress''',
      ));
  static dynamic error(dynamic response) => getJsonField(
        response,
        r'''$.error''',
      );
}

class GetEntriesByRangeConfidenceCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? type = '',
    String? date = '',
    String? range = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getEntriesByRangeConfidence ',
      apiUrl: 'https://www.midconsulting.io/api/getEntriesByRange',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'userId': userId,
        'type': type,
        'date': date,
        'range': range,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List? entries(dynamic response) => getJsonField(
        response,
        r'''$.entries''',
        true,
      ) as List?;
  static List<int>? value(dynamic response) => (getJsonField(
        response,
        r'''$.entries[:].value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? timestamp(dynamic response) => (getJsonField(
        response,
        r'''$.entries[:].timestamp''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static double? average(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.average''',
      ));
  static double? color(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.progress''',
      ));
}

class GetEntriesByRangeBelongingCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? type = '',
    String? date = '',
    String? range = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getEntriesByRangeBelonging ',
      apiUrl: 'https://www.midconsulting.io/api/getEntriesByRange',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'userId': userId,
        'type': type,
        'date': date,
        'range': range,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List? entries(dynamic response) => getJsonField(
        response,
        r'''$.entries''',
        true,
      ) as List?;
  static List<int>? value(dynamic response) => (getJsonField(
        response,
        r'''$.entries[:].value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? timestamp(dynamic response) => (getJsonField(
        response,
        r'''$.entries[:].timestamp''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static double? average(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.average''',
      ));
  static double? color(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.progress''',
      ));
}

class GetEntriesByRangeMoodCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? date = '',
    String? type = '',
    String? range = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getEntriesByRangeMood ',
      apiUrl: 'https://www.midconsulting.io/api/getEntriesByRange',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'userId': userId,
        'type': type,
        'date': date,
        'range': range,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List? entries(dynamic response) => getJsonField(
        response,
        r'''$.entries''',
        true,
      ) as List?;
  static List<int>? value(dynamic response) => (getJsonField(
        response,
        r'''$.entries[:].value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? timestamp(dynamic response) => (getJsonField(
        response,
        r'''$.entries[:].timestamp''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static double? average(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.average''',
      ));
  static double? color(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.progress''',
      ));
}

class OivalluksetCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? messageContent = '',
    bool? isImportant = false,
    String? timestamp = '',
    String? docId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "${escapeStringForJson(userId)}",
  "messageContent": "${escapeStringForJson(messageContent)}",
  "is_important": ${isImportant},
  "timestamp": "${escapeStringForJson(timestamp)}",
  "newDocId": "${escapeStringForJson(docId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'oivallukset',
      apiUrl: 'https://www.midconsulting.io/api/saveInsight',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static dynamic docId(dynamic response) => getJsonField(
        response,
        r'''$.docId''',
      );
}

class HakuOmatOivalluksetsivulleCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? q = '',
    String? timezoneOffset = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'hakuOmatOivalluksetsivulle',
      apiUrl: 'https://www.midconsulting.io/api/getOmatOivallukset',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'q': q,
        'timezoneOffset': "180",
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static String? error(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error''',
      ));
  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? dataId(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dataUserId(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].userId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? messageContent(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].messageContent''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<bool>? isImportant(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].is_important''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  static List<String>? timeStamp(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].timestamp''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].formattedDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? dateTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].formattedDateTime''',
      ));
  static List<int>? seconds(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].timestamp._seconds''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? nanoseconds(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].timestamp._nanoseconds''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class GetStrengthDatesCalenderCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? entryType = '',
    String? startDate = '',
    String? endDate = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "${escapeStringForJson(userId)}",
  "startDate": "${escapeStringForJson(startDate)}",
  "endDate": "${escapeStringForJson(endDate)}",
  "entryType": "strength"
}

''';
    return ApiManager.instance.makeApiCall(
      callName: 'getStrengthDatesCalender',
      apiUrl: 'https://www.midconsulting.io/api/getMoodDates',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? dates(dynamic response) => (getJsonField(
        response,
        r'''$.dates''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? items(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?;
  static List<String>? userId(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<double>? average(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].average''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<String>? summary(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].summary''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? language(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].language''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? type(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetBelongingDatesCalenderCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? entryType = '',
    String? startDate = '',
    String? endDate = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "${escapeStringForJson(userId)}",
  "startDate": "${escapeStringForJson(startDate)}",
  "endDate": "${escapeStringForJson(endDate)}",
  "entryType": "${escapeStringForJson(entryType)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getBelongingDatesCalender ',
      apiUrl: 'https://www.midconsulting.io/api/getMoodDates',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? dates(dynamic response) => (getJsonField(
        response,
        r'''$.dates''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? items(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?;
  static List<String>? userId(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<double>? average(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].average''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<String>? summary(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].summary''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? language(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].language''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? type(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetConfidenceDatesCalenderCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? entryType = '',
    String? startDate = '',
    String? endDate = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "${escapeStringForJson(userId)}",
  "startDate": "${escapeStringForJson(startDate)}",
  "endDate": "${escapeStringForJson(endDate)}",
  "entryType": "${escapeStringForJson(entryType)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getConfidenceDatesCalender ',
      apiUrl: 'https://www.midconsulting.io/api/getMoodDates',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? dates(dynamic response) => (getJsonField(
        response,
        r'''$.dates''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List? items(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?;
  static List<String>? userId(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<double>? average(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].average''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<String>? summary(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].summary''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? language(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].language''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? type(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetMoodDatesCalenderCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? entryType = '',
    String? startDate = '',
    String? endDate = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "${escapeStringForJson(userId)}",
  "startDate": "${escapeStringForJson(startDate)}",
  "endDate": "${escapeStringForJson(endDate)}",
  "entryType": "${escapeStringForJson(entryType)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getMoodDatesCalender ',
      apiUrl: 'https://www.midconsulting.io/api/getMoodDates',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? dates(dynamic response) => (getJsonField(
        response,
        r'''$.dates''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? items(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?;
  static List<String>? docId(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<double>? average(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].average''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<String>? summary(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].summary''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? language(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].language''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? type(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class DeleteOivallusCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? id = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteOivallus',
      apiUrl: 'https://midai-functions.vercel.app/api/getOmatOivallukset',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {
        'userId': userId,
        'id': "Current OmatOivallukset Item ",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic documentId(dynamic response) => getJsonField(
        response,
        r'''$.data[0].id''',
      );
  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class DeleteOivalluksetCall {
  static Future<ApiCallResponse> call({
    String? useriId = '',
    String? docId = '',
  }) async {
    final ffApiRequestBody = '''
{
"userId":"${escapeStringForJson(useriId)}",
"docId":"${escapeStringForJson(docId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DeleteOivallukset',
      apiUrl: 'https://www.midconsulting.io/api/DeleteOivallukset',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static String? error(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error''',
      ));
}

class MidChatCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? sessionId = '',
    String? message = '',
    String? history = '',
    String? summary = '',
  }) async {
    final ffApiRequestBody = '''

{
  "userId": "${escapeStringForJson(userId)}",
  "sessionId": "${escapeStringForJson(sessionId)}",
  "message": "${escapeStringForJson(message)}",
  "summary": "${escapeStringForJson(summary)}",
  "history": "${escapeStringForJson(history)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'MidChat',
      apiUrl: 'https://www.midconsulting.io/api/generateChatReplyGpt',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? preview(dynamic response) => getJsonField(
        response,
        r'''$.messages''',
        true,
      ) as List?;
  static List<String>? role(dynamic response) => (getJsonField(
        response,
        r'''$.messages[:].role''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.messages[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? timeStamp(dynamic response) => getJsonField(
        response,
        r'''$.messages[:].timestamp''',
        true,
      ) as List?;
  static List<int>? seconds(dynamic response) => (getJsonField(
        response,
        r'''$.messages[:].timestamp._seconds''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? nanosecc(dynamic response) => (getJsonField(
        response,
        r'''$.messages[:].timestamp._nanoseconds''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? errorMessage(dynamic response) => (getJsonField(
        response,
        r'''$.message''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? docId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.messages[:].id''',
      ));
  static List<String>? sessionId(dynamic response) => (getJsonField(
        response,
        r'''$.messages[:].sessionId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? systemPromt(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.systemPrompt''',
      ));
}

class CheckDailySummaryTrueFalseConfidenceCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? date = '',
    String? type = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'checkDailySummaryTrueFalseConfidence',
      apiUrl: 'https://www.midconsulting.io/api/MyGrowthTodayStatus',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'userId': userId,
        'date': date,
        'type': "confidence",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? exists(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.exists''',
      ));
}

class CheckDailySummaryTrueFalseBelongingCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? date = '',
    String? type = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'checkDailySummaryTrueFalseBelonging',
      apiUrl: 'https://www.midconsulting.io/api/MyGrowthTodayStatus',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'userId': userId,
        'date': date,
        'type': "belonging",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? exists(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.exists''',
      ));
}

class CheckDailySummaryTrueFalseStrengthCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? date = '',
    String? type = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'checkDailySummaryTrueFalseStrength',
      apiUrl: 'https://www.midconsulting.io/api/MyGrowthTodayStatus',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'userId': userId,
        'date': date,
        'type': "strength",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? exists(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.exists''',
      ));
}

class CheckDailySummaryTrueFalseMoodCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? date = '',
    String? type = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'checkDailySummaryTrueFalseMood  ',
      apiUrl: 'https://www.midconsulting.io/api/MyGrowthTodayStatus',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'userId': userId,
        'date': date,
        'type': "mood",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? exists(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.exists''',
      ));
}

class MonthlySummaryCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    int? month,
    int? year,
    String? lang = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "${escapeStringForJson(userId)}",
  "year": ${year},
  "month": ${month},
  "lang":"${escapeStringForJson(lang)}"
}

''';
    return ApiManager.instance.makeApiCall(
      callName: 'monthly summary',
      apiUrl: 'https://www.midconsulting.io/api/monthlySummary',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  static bool? succes(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  static String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.userId''',
      ));
  static int? year(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.year''',
      ));
  static int? month(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.month''',
      ));
  static String? lang(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.lang''',
      ));
  static dynamic dataAverage(dynamic response) => getJsonField(
        response,
        r'''$.data.averages''',
      );
  static double? averageMood(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.data.averages.mood''',
      ));
  static double? averageStrength(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.data.averages.strength''',
      ));
  static double? averageConfidence(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.data.averages.confidence''',
      ));
  static double? averageBelonging(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.data.averages.belonging''',
      ));
  static dynamic dataProgress(dynamic response) => getJsonField(
        response,
        r'''$.data.progress''',
      );
  static double? progressMood(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.data.progress.mood''',
      ));
  static double? progressStrength(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.data.progress.strength''',
      ));
  static double? progressConfidence(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.data.progress.confidence''',
      ));
  static double? progressBelonging(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.data.progress.belonging''',
      ));
  static dynamic averagesStr(dynamic response) => getJsonField(
        response,
        r'''$.data.averagesStr''',
      );
  static String? strMood(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.averagesStr.mood''',
      ));
  static String? srtStrength(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.averagesStr.strength''',
      ));
  static String? strConfidence(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.averagesStr.confidence''',
      ));
  static String? strBelonging(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.averagesStr.belonging''',
      ));
  static dynamic dataProgressStr(dynamic response) => getJsonField(
        response,
        r'''$.data.progressStr''',
      );
  static String? progStrMood(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.progressStr.mood''',
      ));
  static String? progStrStrenght(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.progressStr.strength''',
      ));
  static String? progStrConfidence(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.progressStr.confidence''',
      ));
  static String? progStrBelonging(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.progressStr.belonging''',
      ));
  static List<String>? topContext(dynamic response) => (getJsonField(
        response,
        r'''$.data.topContexts''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? aiSummary(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.aiSummary''',
      ));
}

class WeeklyReportsCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    int? year,
    int? week,
    String? lang = '',
    int? userTimezoneOffset,
  }) async {
    final ffApiRequestBody = '''

{
  "userId": "${escapeStringForJson(userId)}",
  "year": ${year},
  "week": ${week},
  "lang":"${escapeStringForJson(lang)}",
"userTimezoneOffset": ${userTimezoneOffset}
}
''';
    return ApiManager.instance.makeApiCall(
      callName: 'weeklyReports',
      apiUrl: 'https://www.midconsulting.io/api/weeklyReports',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  static bool? succes(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  static String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.userId''',
      ));
  static int? yesr(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.year''',
      ));
  static int? week(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.week''',
      ));
  static String? lang(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.lang''',
      ));
  static int? timezone(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.userTimezoneOffset''',
      ));
  static dynamic dataAverages(dynamic response) => getJsonField(
        response,
        r'''$.data.averages''',
      );
  static int? averageMood(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.averages.mood''',
      ));
  static double? averageStrength(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.data.averages.strength''',
      ));
  static double? averageConfidence(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.data.averages.confidence''',
      ));
  static double? averageBelonging(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.data.averages.belonging''',
      ));
  static dynamic dataProgress(dynamic response) => getJsonField(
        response,
        r'''$.data.progress''',
      );
  static double? progressMood(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.data.progress.mood''',
      ));
  static double? progressStrength(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.data.progress.strength''',
      ));
  static double? progressConfidence(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.data.progress.confidence''',
      ));
  static double? progressBelonging(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.data.progress.belonging''',
      ));
  static List<String>? topContext(dynamic response) => (getJsonField(
        response,
        r'''$.data.topContexts''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? aiSummary(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.aiSummary''',
      ));
}

class ReportMonthHistoryCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? scope = '',
    String? year = '',
    String? lang = '',
    int? limit,
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "${escapeStringForJson(userId)}",
  "scope": "${escapeStringForJson(scope)}",
  "lang": "${escapeStringForJson(lang)}",
  "year": "${escapeStringForJson(year)}",
  "limit": ${limit}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'reportMonthHistory',
      apiUrl: 'https://www.midconsulting.io/api/reportMonthWeekHistory',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? itemsId(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? userId(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].userId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? lang(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].lang''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? year(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].year''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List? items(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?;
  static List<int>? week(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].week''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? month(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].month''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? label(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].label''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? averages(dynamic response) => getJsonField(
        response,
        r'''$.items[:].averages''',
        true,
      ) as List?;
  static List<int>? mood(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].averages.mood''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? strength(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].averages.strength''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? confidence(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].averages.confidence''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? belonging(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].averages.belonging''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List? progress(dynamic response) => getJsonField(
        response,
        r'''$.items[:].progress''',
        true,
      ) as List?;
  static List<String>? aiSummary(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].aiSummary''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? progressMood(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].progress.mood''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? progressStrength(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].progress.strength''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? progressConfidence(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].progress.confidence''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? progressBelonging(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].progress.belonging''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class ReportWeekHistoryCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? scope = '',
    String? year = '',
    String? lang = '',
    int? limit,
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "${escapeStringForJson(userId)}",
  "scope": "${escapeStringForJson(scope)}",
  "lang": "${escapeStringForJson(lang)}",
  "year": "${escapeStringForJson(year)}",
  "limit": ${limit}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'reportWeekHistory ',
      apiUrl: 'https://www.midconsulting.io/api/reportMonthWeekHistory',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? itemsId(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? userId(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].userId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? lang(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].lang''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? year(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].year''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List? items(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?;
  static List<int>? week(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].week''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List? month(dynamic response) => getJsonField(
        response,
        r'''$.items[:].month''',
        true,
      ) as List?;
  static List<String>? label(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].label''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? averages(dynamic response) => getJsonField(
        response,
        r'''$.items[:].averages''',
        true,
      ) as List?;
  static List<int>? mood(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].averages.mood''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? strength(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].averages.strength''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? confidence(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].averages.confidence''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? belonging(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].averages.belonging''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List? progress(dynamic response) => getJsonField(
        response,
        r'''$.items[:].progress''',
        true,
      ) as List?;
  static List<String>? aiSummary(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].aiSummary''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? progressMood(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].progress.mood''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? progressStrength(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].progress.strength''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? progressConfidence(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].progress.confidence''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? progressBelonging(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].progress.belonging''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class CreateAssistantMessageStreamCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? sessionId = '',
  }) async {
    final ffApiRequestBody = '''
{
 "userId": "${escapeStringForJson(userId)}",
  "sessionId": "${escapeStringForJson(sessionId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createAssistantMessageStream',
      apiUrl: 'https://www.midconsulting.io/api/createAssistantMessage',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class ChatContextLatestAndArchiveCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? sessionId = '',
    String? limit = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "${escapeStringForJson(userId)}",
  "sessionId": "${escapeStringForJson(sessionId)}",
  "limit": "${escapeStringForJson(limit)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ChatContextLatestAndArchive',
      apiUrl: 'https://www.midconsulting.io/api/getChatContext',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? chatSummaries(dynamic response) => (getJsonField(
        response,
        r'''$.summaries''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? history(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.history''',
      ));
  static bool? hasHistory(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.hasHistory''',
      ));
}

class SaveChatSummaryExitCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? sessionId = '',
    String? mode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "${escapeStringForJson(userId)}",
  "sessionId": "${escapeStringForJson(sessionId)}",
  "mode": "${escapeStringForJson(mode)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'saveChatSummaryExit',
      apiUrl: 'https://www.midconsulting.io/api/saveChatSummary',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? ok(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.ok''',
      ));
  static String? chatSummary(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.summary''',
      ));
  static bool? updated(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.updated''',
      ));
  static String? mode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.mode''',
      ));
  static int? newCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.newCount''',
      ));
}

class GenerateChatSummaryRollingCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? sessionId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "${escapeStringForJson(userId)}",
  "sessionId": "${escapeStringForJson(sessionId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'generateChatSummaryRolling',
      apiUrl: 'https://www.midconsulting.io/api/generateChatSummary',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? ok(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.ok''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? summary(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.summary''',
      ));
  static String? updated(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.updated''',
      ));
  static String? reason(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.reason''',
      ));
  static int? thereshold(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.threshold''',
      ));
  static int? newCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.newCount''',
      ));
  static String? mode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.mode''',
      ));
  static String? minuteSinceLast(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.minutesSinceLast''',
      ));
}

class ScrollHistoryListviewCall {
  static Future<ApiCallResponse> call({
    String? sessionId = '',
    String? nextPageToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'scrollHistoryListview',
      apiUrl: 'https://midconsulting.io/api/getScrollingChatHistory',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'sessionId': sessionId,
        'nextPageToken': nextPageToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LuoSessionIdCreateChatSessionCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? sessionId = '',
    String? hasUpdatedTitle = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "${escapeStringForJson(userId)}",
  "hasUpdatedTitle": ${escapeStringForJson(hasUpdatedTitle)},
  "sessionId": "${escapeStringForJson(sessionId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'luoSessionIdCreateChatSession',
      apiUrl: 'https://www.midconsulting.io/api/createChatSession.js',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? docId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? sessionId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.sessionId''',
      ));
  static String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.userId''',
      ));
  static String? createdAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.createdAt''',
      ));
  static String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.title''',
      ));
  static bool? hasUpdadetTitle(dynamic response) =>
      castToType<bool>(getJsonField(
        response,
        r'''$.hasUpdatedTitle''',
      ));
  static String? missingUserId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class TitleUpDateCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? sessionId = '',
    String? message = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "${escapeStringForJson(userId)}",
  "sessionId": "${escapeStringForJson(sessionId)}",
  "message": "${escapeStringForJson(message)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'titleUpDate',
      apiUrl: 'https://www.midconsulting.io/api/updateChatTitle.js',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.title''',
      ));
}

class DraverListViewCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? q = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "${escapeStringForJson(userId)}",
  "q": "${escapeStringForJson(q)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'draverListView',
      apiUrl: 'https://www.midconsulting.io/api/getChatSessions',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? sessions(dynamic response) => getJsonField(
        response,
        r'''$.sessions''',
        true,
      ) as List?;
  static List<String>? docId(dynamic response) => (getJsonField(
        response,
        r'''$.sessions[:].docId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sessionId(dynamic response) => (getJsonField(
        response,
        r'''$.sessions[:].sessionId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.sessions[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? createdAt(dynamic response) => getJsonField(
        response,
        r'''$.sessions[:].createdAt''',
        true,
      ) as List?;
  static List<int>? seconds(dynamic response) => (getJsonField(
        response,
        r'''$.sessions[:].createdAt._seconds''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? nanoseconds(dynamic response) => (getJsonField(
        response,
        r'''$.sessions[:].createdAt._nanoseconds''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class GetSessionMessagesCall {
  static Future<ApiCallResponse> call({
    String? sessionId = '',
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{ "userId": "${escapeStringForJson(userId)}",
  "sessionId": "${escapeStringForJson(sessionId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getSessionMessages',
      apiUrl: 'https://www.midconsulting.io/api/getSessionMessages',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? messages(dynamic response) => getJsonField(
        response,
        r'''$.messages''',
        true,
      ) as List?;
  static List<String>? role(dynamic response) => (getJsonField(
        response,
        r'''$.messages[:].role''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.messages[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? timestamp(dynamic response) => getJsonField(
        response,
        r'''$.messages[:].timestamp''',
        true,
      ) as List?;
  static List<int>? seconds(dynamic response) => (getJsonField(
        response,
        r'''$.messages[:].timestamp._seconds''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? nanoseconds(dynamic response) => (getJsonField(
        response,
        r'''$.messages[:].timestamp._nanoseconds''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? messageId(dynamic response) => (getJsonField(
        response,
        r'''$.messages[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? sessionId(dynamic response) => (getJsonField(
        response,
        r'''$.messages[:].sessionId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<bool>? isUser(dynamic response) => (getJsonField(
        response,
        r'''$.messages[:].isUser''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  static List<bool>? isAssistant(dynamic response) => (getJsonField(
        response,
        r'''$.messages[:].isAssistant''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  static List<bool>? isPlaceholder(dynamic response) => (getJsonField(
        response,
        r'''$.messages[:].isPlaceholder''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  static List<String>? userId(dynamic response) => (getJsonField(
        response,
        r'''$.messages[:].userId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class DeleteMonthReportCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? docId = '',
  }) async {
    final ffApiRequestBody = '''
{
"userId":"${escapeStringForJson(userId)}",
"docId": "${escapeStringForJson(docId)}"


}''';
    return ApiManager.instance.makeApiCall(
      callName: 'deleteMonthReport',
      apiUrl: 'https://midconsulting.io/api/deleteReport',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? deleted(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.deleted''',
      ));
  static List? ids(dynamic response) => getJsonField(
        response,
        r'''$.ids''',
        true,
      ) as List?;
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List<String>? weeklyMonthlyReports(dynamic response) => (getJsonField(
        response,
        r'''$.triedCollections''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class DeleteWeekReportCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? docId = '',
  }) async {
    final ffApiRequestBody = '''
{
 "userId":"${escapeStringForJson(userId)}",
 "docId": "${escapeStringForJson(docId)}"

 }''';
    return ApiManager.instance.makeApiCall(
      callName: 'deleteWeekReport',
      apiUrl: 'https://midconsulting.io/api/deleteReport',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? deleted(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.deleted''',
      ));
  static List<String>? ids(dynamic response) => (getJsonField(
        response,
        r'''$.ids''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static bool? dryRun(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.dryRun''',
      ));
  static String? by(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.by''',
      ));
  static String? scope(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.scope''',
      ));
  static dynamic filters(dynamic response) => getJsonField(
        response,
        r'''$.filters''',
      );
  static String? filtersUserId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.filters.userId''',
      ));
  static int? filtersYear(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.filters.year''',
      ));
  static String? filtersLang(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.filters.lang''',
      ));
  static int? filtersWeek(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.filters.week''',
      ));
  static int? matched(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.matched''',
      ));
  static String? error(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error''',
      ));
  static List<String>? weekMonthCollections(dynamic response) => (getJsonField(
        response,
        r'''$.triedCollections''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class DeleteMoodSheetDayCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? date = '',
    String? type = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "${escapeStringForJson(userId)}",
  "type": "${escapeStringForJson(type)}",
  "date": "${escapeStringForJson(date)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DeleteMoodSheetDay',
      apiUrl: 'https://midconsulting.io/api/deleteDailySummary.js',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static String? docId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.docId''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class GetTestResultsCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetTestResults',
      apiUrl: 'https://www.midconsulting.io/api/getTestResults',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? results(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
  static List? timeStamp(dynamic response) => getJsonField(
        response,
        r'''$.results[:].timestamp''',
        true,
      ) as List?;
  static List<int>? seconds(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].timestamp._seconds''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? docId(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? nanoseconds(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].timestamp._nanoseconds''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? testId(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].testId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? testName(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].testName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? testTheme(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].testTheme''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<double>? score(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].score''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<int>? answers(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].answers''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? openAnswer(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].openAnswer''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? analysis(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].analysis''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? userId(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].userId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? category(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].category''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
  static List<String>? type(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? montKey(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].monthKey''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? monthLabel(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].monthLabel''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? categoryLabel(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results[:].categoryLabel''',
      ));
}

class DeleteChatSessionCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? sessionId = '',
  }) async {
    final ffApiRequestBody = '''
{
"userId": 
"wNTZ2Z8tuXNGH53cqhPpGqzlK4O2",
"sessionId": "22712ce2-891e-484e-a05f-c4b080ba27cf"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'deleteChatSession',
      apiUrl: 'https://midconsulting.io/api/deleteChatSession',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class DeleteTestResultsCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? docId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "${escapeStringForJson(userId)}",
  "docId": "${escapeStringForJson(docId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'deleteTestResults',
      apiUrl: 'https://www.midconsulting.io/api/deleteTestResult',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static String? error(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class GetCategoryProgressMoodAndFeelingsCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? category = '',
    String? language = '',
  }) async {
    final ffApiRequestBody = '''
{ "userId": "${escapeStringForJson(userId)}",
"category": "${escapeStringForJson(category)}",
"language": "${escapeStringForJson(language)}"
 }''';
    return ApiManager.instance.makeApiCall(
      callName: 'getCategoryProgressMoodAndFeelings',
      apiUrl: 'https://www.midconsulting.io/api/getCategoryProgress',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? ok(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.ok''',
      ));
  static String? cayegory(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.category''',
      ));
  static String? language(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.language''',
      ));
  static int? totalAmountTest(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.total''',
      ));
  static int? done(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.done''',
      ));
  static double? progress(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.progress''',
      ));
}

class GetCategoryProgressThinkingAndDecisionsCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? category = '',
    String? language = '',
  }) async {
    final ffApiRequestBody = '''
{ "userId": "${escapeStringForJson(userId)}",
"category": "${escapeStringForJson(category)}",
"language": "${escapeStringForJson(language)}"
 }''';
    return ApiManager.instance.makeApiCall(
      callName: 'getCategoryProgressThinkingAndDecisions',
      apiUrl: 'https://www.midconsulting.io/api/getCategoryProgress',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? ok(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.ok''',
      ));
  static String? cayegory(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.category''',
      ));
  static String? language(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.language''',
      ));
  static int? totalAmountTest(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.total''',
      ));
  static int? done(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.done''',
      ));
  static double? progress(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.progress''',
      ));
}

class GetCategoryProgressGrowthAndStrengthCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? category = '',
    String? language = '',
  }) async {
    final ffApiRequestBody = '''
{ "userId": "${escapeStringForJson(userId)}",
"category": "${escapeStringForJson(category)}",
"language": "${escapeStringForJson(language)}"
 }''';
    return ApiManager.instance.makeApiCall(
      callName: 'getCategoryProgressGrowthAndStrength',
      apiUrl: 'https://www.midconsulting.io/api/getCategoryProgress',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? ok(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.ok''',
      ));
  static String? cayegory(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.category''',
      ));
  static String? language(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.language''',
      ));
  static int? totalAmountTest(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.total''',
      ));
  static int? done(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.done''',
      ));
  static double? progress(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.progress''',
      ));
}

class GetCategoryProgressWorkandwellbeingCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? category = '',
    String? language = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "${escapeStringForJson(userId)}",
  "category": "${escapeStringForJson(category)}",
  "language": "${escapeStringForJson(language)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getCategoryProgressWorkandwellbeing',
      apiUrl: 'https://www.midconsulting.io/api/getCategoryProgress',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? ok(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.ok''',
      ));
  static String? cayegory(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.category''',
      ));
  static String? language(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.language''',
      ));
  static int? totalAmountTest(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.total''',
      ));
  static int? done(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.done''',
      ));
  static double? progress(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.progress''',
      ));
}

class GetCategoryProgressConnectionAndBelongingCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? category = '',
    String? language = '',
  }) async {
    final ffApiRequestBody = '''
{ "userId": "${escapeStringForJson(userId)}",
"category": "${escapeStringForJson(category)}",
"language": "${escapeStringForJson(language)}"
 }''';
    return ApiManager.instance.makeApiCall(
      callName: 'getCategoryProgressConnectionAndBelonging  ',
      apiUrl: 'https://www.midconsulting.io/api/getCategoryProgress',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? ok(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.ok''',
      ));
  static String? cayegory(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.category''',
      ));
  static String? language(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.language''',
      ));
  static int? totalAmountTest(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.total''',
      ));
  static int? done(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.done''',
      ));
  static double? progress(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.progress''',
      ));
}

class CloseChatSessionExitCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? sessionId = '',
  }) async {
    final ffApiRequestBody = '''
{  "userId":"${escapeStringForJson(userId)}",
 "sessionId": "${escapeStringForJson(sessionId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'closeChatSessionExit',
      apiUrl: 'https://www.midconsulting.io/api/CloseSession.js',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? ok(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.ok''',
      ));
  static bool? closed(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.closed''',
      ));
}

class CreateUserProfileCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? country = '',
    String? city = '',
    String? bio = '',
    String? displayName = '',
    String? email = '',
    String? photoUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "${escapeStringForJson(userId)}",
  "display_name": "${escapeStringForJson(displayName)}",
  "city": "${escapeStringForJson(city)}",
  "country":"${escapeStringForJson(country)}",
  "bio": "${escapeStringForJson(bio)}",
  "email": "${escapeStringForJson(email)}",
  "photo_url": "${escapeStringForJson(photoUrl)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createUserProfile',
      apiUrl: 'https://www.midconsulting.io/api/createUserProfile',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static String? action(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.action''',
      ));
}

class UploadProfileImageCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? imageBase64 = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "${escapeStringForJson(userId)}",
  "imageBase64": "${escapeStringForJson(imageBase64)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'uploadProfileImage',
      apiUrl: 'https://www.midconsulting.io/api/uploadProfileImage',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static String? photoUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.photo_url''',
      ));
}

class UpdateProfilePicCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? photoUrl = '',
  }) async {
    final ffApiRequestBody = '''
{  "userId": "${escapeStringForJson(userId)}",
    "photoUrl": "${escapeStringForJson(photoUrl)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateProfilePic',
      apiUrl: 'https://www.midconsulting.io/api/updateProfilePic',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.userId''',
      ));
}

class GetUserProfileCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getUserProfile',
      apiUrl: 'https://www.midconsulting.io/api/getUserProfile',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static String? uid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.uid''',
      ));
  static String? createdAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.created_at''',
      ));
  static String? photo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.photo_url''',
      ));
  static String? country(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.country''',
      ));
  static String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.city''',
      ));
  static String? bio(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.bio''',
      ));
  static String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.display_name''',
      ));
  static String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.email''',
      ));
  static String? updatetAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.updated_at''',
      ));
}

class GetUserPhotoCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "${escapeStringForJson(userId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getUserPhoto',
      apiUrl: 'https://www.midconsulting.io/api/getUserPhoto',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static String? photo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.photo_url''',
      ));
}

class AddNoteCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? note = '',
    String? createdAt = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "${escapeStringForJson(userId)}",
  "note": "${escapeStringForJson(note)}",
  "createdAt": "${escapeStringForJson(createdAt)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addNote',
      apiUrl: 'https://www.midconsulting.io/api/addNote',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static String? docId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.userId''',
      ));
  static String? note(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.note''',
      ));
  static String? createdAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.createdAt''',
      ));
  static String? updatedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.updatedAt''',
      ));
}

class GetNotesCall {
  static Future<ApiCallResponse> call({
    String? q = '',
    String? userId = '',
    int? timezoneOffset,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getNotes',
      apiUrl: 'https://www.midconsulting.io/api/getNotes',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'q': q,
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static List? notes(dynamic response) => getJsonField(
        response,
        r'''$.notes''',
        true,
      ) as List?;
  static String? docId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.notes[:].id''',
      ));
  static String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.notes[:].userId''',
      ));
  static String? notesNote(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.notes[:].note''',
      ));
  static List<String>? createdAt(dynamic response) => (getJsonField(
        response,
        r'''$.notes[:].createdAt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? updatedAt(dynamic response) => (getJsonField(
        response,
        r'''$.notes[:].updatedAt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? displayedAt(dynamic response) => (getJsonField(
        response,
        r'''$.notes[:].displayedAt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? timezone(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.timezoneOffset''',
      ));
  static String? error(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error''',
      ));
}

class DeleteNotesCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? docId = '',
  }) async {
    final ffApiRequestBody = '''
{
"userId":"${escapeStringForJson(userId)}",
  "docId": "${escapeStringForJson(docId)}"
  
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'deleteNotes',
      apiUrl: 'https://www.midconsulting.io/api/deleteNotes',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? succeess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static String? error(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class CreateUserDocumentSignInCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? email = '',
  }) async {
    final ffApiRequestBody = '''

{
  "userId": "${escapeStringForJson(userId)}",
  "email": "${escapeStringForJson(email)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CreateUserDocumentSignIn',
      apiUrl: 'https://www.midconsulting.io/api/CreateUserDocumentSignIn',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static String? cretaed(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.action''',
      ));
  static String? error(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error''',
      ));
}

class SessionFetcherCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "${escapeStringForJson(userId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sessionFetcher',
      apiUrl: 'https://midconsulting.io/api/sessionFetcher',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? sessionId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.sessionId''',
      ));
}

class DeleteChatSessionNewCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? sessionId = '',
  }) async {
    final ffApiRequestBody = '''
{
"userId": "${escapeStringForJson(userId)}",
"sessionId": "${escapeStringForJson(sessionId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'deleteChatSessionNew',
      apiUrl: 'https://midconsulting.io/api/deleteChatSession',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static bool? ok(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.ok''',
      ));
  static int? numberOfDeleted(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.deletedMessages''',
      ));
}

class GetDailyExercisesCoachCall {
  static Future<ApiCallResponse> call({
    String? language = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getDailyExercisesCoach',
      apiUrl: 'https://midconsulting.io/api/getDailyExercises',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'language': language,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? emoij(dynamic response) => (getJsonField(
        response,
        r'''$[:].emoji''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? titleFi(dynamic response) => (getJsonField(
        response,
        r'''$[:].titleFi''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? titleEn(dynamic response) => (getJsonField(
        response,
        r'''$[:].titleEn''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? textFi(dynamic response) => (getJsonField(
        response,
        r'''$[:].textFi''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? textEn(dynamic response) => (getJsonField(
        response,
        r'''$[:].textEn''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class DailyCoachCall {
  static Future<ApiCallResponse> call({
    String? lang = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'dailyCoach',
      apiUrl: 'https://midconsulting.io/api/dailyCoach',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'lang': lang,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? emoji(dynamic response) => (getJsonField(
        response,
        r'''$[:].emoji''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class DeleteUserPhotoCall {
  static Future<ApiCallResponse> call({
    String? userId = 'userId',
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "${escapeStringForJson(userId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'deleteUserPhoto',
      apiUrl: 'https://midconsulting.io/api/deleteUserPhoto',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? succes(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class UpdateNoteCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? noteId = '',
    String? note = '',
    String? updatedAt = 'time',
  }) async {
    final ffApiRequestBody = '''
{
"userId":"${escapeStringForJson(userId)}",
  "noteId": "${escapeStringForJson(noteId)}",
  "note": "${escapeStringForJson(note)}",
"updatedAt":"${escapeStringForJson(updatedAt)}"
}
''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateNote',
      apiUrl: 'https://midconsulting.io/api/updateNote',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? error(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error''',
      ));
  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static String? noteId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? updatedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.updatedAt''',
      ));
}

class TimeZoneCall {
  static Future<ApiCallResponse> call({
    String? timezoneOffset = '',
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'timeZone',
      apiUrl: 'https://midconsulting.io/api/getTimezone.js',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'timezoneOffset': "-180",
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static String? timezone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timezone''',
      ));
  static int? minutes(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.offsetMinutes''',
      ));
  static int? hours(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.offsetHours''',
      ));
  static String? error(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class GetSingleProgramCoachCall {
  static Future<ApiCallResponse> call({
    String? id = '',
    String? language = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getSingleProgramCoach',
      apiUrl: 'https://midconsulting.io/api/getSingleProgram',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'id': id,
        'language': language,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? emoji(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.emoji''',
      ));
  static String? titleEn(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.titleEn''',
      ));
  static String? titleFi(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.titleFi''',
      ));
  static String? longTitleEn(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.longTitleEn''',
      ));
  static String? longTitleFi(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.longTitleFi''',
      ));
  static List<String>? contentEn(dynamic response) => (getJsonField(
        response,
        r'''$.contentEn''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? contentFi(dynamic response) => (getJsonField(
        response,
        r'''$.contentFi''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.title''',
      ));
  static String? longtitle(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.longTitle''',
      ));
  static String? content(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.content''',
      ));
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
