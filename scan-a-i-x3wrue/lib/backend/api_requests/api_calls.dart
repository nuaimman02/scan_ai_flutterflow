import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ExtractNameCardCall {
  static Future<ApiCallResponse> call({
    String? prompt = '',
  }) async {
    final ffApiRequestBody = '''
{
  "model": "gpt-3.5-turbo",
  "messages": [
    {
      "role": "system",
      "content": "You are a helpful assistant that is good at recognizing information from name cards or business cards. Return extracted details in structured data."
    },
    {
      "role": "user",
      "content": "Extract the following information from the text: 1. Full Name 2. Job Title or Role 3. Company Name 4. Phone Number 5. Email Address. Always return the output in this exact format as a JSON array with 5 elements: [\\"Full Name\\", \\"Job Title\\", \\"Company Name\\", \\"Phone Number\\", \\"Email Address\\"] If any information is missing or not available, replace that position with \\"-\\". Example: [\\"John Doe\\",\\"-\\", \\"TechCorp\\", \\"1234567890\\", \\"john@example.com\\"]\\n\\nInput:${escapeStringForJson(prompt)}"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ExtractNameCard',
      apiUrl: 'https://api.openai.com/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
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

  static dynamic output(dynamic response) => getJsonField(
        response,
        r'''$.choices[0]["message"]["content"]''',
      );
}

class DocumentCatgeorizationCall {
  static Future<ApiCallResponse> call({
    String? prompt = '',
  }) async {
    final ffApiRequestBody = '''
{
  "model": "gpt-3.5-turbo",
  "messages": [
    {
      "role": "system",
      "content": "You are a helpful assistant that categorizes documents. You must respond with only one word: either \\"education\\", \\"health\\", \\"household\\", \\"computer science\\", \\"machine learning\\", \\"shopping list\\", \\"receipt\\", or \\"others\\". Do not explain your answer. Do not write full sentences. Only reply with one of those four category names. If could not recognize the category just return a -."
    },
    {
      "role": "user",
      "content": "Categorize the following document into one of the categories such as education, health, household, or others: ${escapeStringForJson(prompt)}"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DocumentCatgeorization',
      apiUrl: 'https://api.openai.com/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
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

  static dynamic output(dynamic response) => getJsonField(
        response,
        r'''$.choices[0]["message"]["content"]''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
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
