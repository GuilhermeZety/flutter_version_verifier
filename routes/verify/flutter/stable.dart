import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';
import 'package:dio/dio.dart' as dio;

Map<String, dynamic>? lll;

Future<Response> onRequest(RequestContext context) async {
  final resp = await dio.Dio().get('https://storage.googleapis.com/flutter_infra_release/releases/releases_windows.json');

  final releases = resp.data['releases'] as List<dynamic>;

  final stables = releases.where((e) => e['channel'] == 'stable').toList();

  final last = stables.first as Map<String, dynamic>;

  return Response(body: jsonEncode(last));
}
