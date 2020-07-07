import 'dart:async';
import 'dart:convert';

import '../models/vehicle.dart';
import '../endpoints/user_api.dart';
import 'package:http/http.dart' as http;

class VehicleApi {

  Future<DateTime> arrival(String vehicleId) async {
    final response = await http.post(
      'https://flux-control-node-api.herokuapp.com/api/vehicles/arrival/' + vehicleId,
      headers: {'authorization': "Bearer " + UserApi.token}
    );

    if (response.statusCode == 202) {
      var data = json.decode(response.body);
      return DateTime.parse(data['moment']);

    } else {
      throw Exception('Falha ao registrar entrada');
    }
  }

  Future<DateTime> departure(String vehicleId) async {
    final response = await http.put(
      'https://flux-control-node-api.herokuapp.com/api/vehicles/departure/' + vehicleId,
      headers: {'authorization': "Bearer " + UserApi.token}
    );

    if (response.statusCode == 202) {
      var data = json.decode(response.body);
      return DateTime.parse(data['moment']);

    } else {
      throw Exception('Falha ao registrar saida');
    }
  }

}