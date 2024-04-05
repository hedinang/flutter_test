import 'dart:convert';

import 'package:http/http.dart';
import 'package:learn/model/response_api.dart';
import 'package:learn/utils/constant.dart';

class AuthApi {
  Future<ResponseApi> login(request) async {
    Response result = await post(Uri.parse('$host/$auth/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(request));
    return ResponseApi.fromJson(jsonDecode(result.body));
  }
}
