import 'dart:async';
import 'dart:convert';

import '../models/flow_record.dart';
import '../endpoints/user_api.dart';
import 'package:http/http.dart' as http;

class FlowRecordApi {

  Future<List<FlowRecord>> getRecords() async {
    final response = await http.get('https://flux-control-node-api.herokuapp.com/api/flow-records',
      headers: {'authorization': "Bearer " + UserApi.token}
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return List.from(data['items']).map((e) => FlowRecord.fromJson(e)).toList();

    } else {
      throw Exception('Falha ao carregar histórico');
    }
  }
}