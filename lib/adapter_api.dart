import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:my_guardian/model_dog.dart';
import 'package:my_guardian/model_guard.dart';
import 'package:my_guardian/model_quiz.dart';

List<Quiz> parseQuizs(String responseBody) {
  // 수신 데이터를 JSON 포맷(JSON Array)으로 디코딩
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  // JSON Array를 List<Quiz>로 변환하여 반환
  return parsed.map<Quiz>((json) => Quiz.fromJson(json)).toList();
}

List<Dog> parseDogs(String responseBody) {
  // 수신 데이터를 JSON 포맷(JSON Array)으로 디코딩
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  // JSON Array를 List<Quiz>로 변환하여 반환
  return parsed.map<Dog>((json) => Dog.fromJson(json)).toList();
}

List<User> parseUsers(String responseBody) {
  // 수신 데이터를 JSON 포맷(JSON Array)으로 디코딩
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  // JSON Array를 List<Quiz>로 변환하여 반환
  return parsed.map<User>((json) => User.fromJson(json)).toList();
}
