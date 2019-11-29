import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:my_guardian/model_quiz.dart';

// // 서버로부터 데이터를 수신하여 그 결과를 List<Photo> 형태의 Future 객체로 반환하는 async 함수
// Future<List<Quiz>> fetchQuizs() async {
//   http.Client client;
//   // 해당 URL로 데이터를 요청하고 수신함
//   final response =
//       await client.get('http://guinness.pythonanywhere.com/api/quiz/');

//   // parsePhotos 함수를 백그라운도 격리 처리
//   return compute(parseQuizs, response.body);
// }

List<Quiz> parseQuizs(String responseBody) {
  // 수신 데이터를 JSON 포맷(JSON Array)으로 디코딩
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  // JSON Array를 List<Photo>로 변환하여 반환
  return parsed.map<Quiz>((json) => Quiz.fromJson(json)).toList();
}
