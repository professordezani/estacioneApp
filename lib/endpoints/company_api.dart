import 'dart:async';
import 'dart:convert';

import '../models/company.dart';
import '../models/vehicle.dart';
import '../endpoints/user_api.dart';
import 'package:http/http.dart' as http;

class CompanyApi {

  Future<List<Company>> getCompanies() async {
    final response = await http.get('https://flux-control-node-api.herokuapp.com/api/companies',
      headers: {'authorization': "Bearer " + UserApi.token}
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return List.from(data['items']).map((e) => Company.fromJson(e)).toList();

    } else {
      throw Exception('Falha ao carregar empresas');
    }
  }

  Future<List<Vehicle>> getFleet(String companyId) async {
    final response = await http.get('https://flux-control-node-api.herokuapp.com/api/companies/fleet/'+  companyId,
      headers: {'authorization': "Bearer " + UserApi.token}
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return List.from(data['fleet']).map((e) => Vehicle.fromJson(e)).toList();

    } else {
      throw Exception('Falha ao carregar veículos');
    }
  }
}