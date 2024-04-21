import 'dart:convert';

import 'package:http/http.dart';
import 'package:learn/api/baseApi.dart';
import 'package:learn/model/response_api.dart';
import 'package:learn/utils/constant.dart';

class ConversationApi extends BaseApi {
  Future<ResponseApi> getList(request) async {
    Response result = await post(Uri.parse('$host/$conversation/list'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${await getToken()}'
        },
        body: json.encode(request));
    return ResponseApi.fromJson(jsonDecode(result.body));
  }
}
