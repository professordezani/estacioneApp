class FlowRecord {

  String id;
  DateTime arrivalMoment;
  int arrivalUser;
  DateTime departureMoment;
  int departureUser;
  String vehicleId;
  DateTime createdAt;
  bool inactive;

  FlowRecord({this.id, this.arrivalMoment, this.arrivalUser, this.departureMoment, this.departureUser, this.vehicleId, this.createdAt, this.inactive});

  factory FlowRecord.fromJson(Map<String, dynamic> json) {
    return FlowRecord(
      id: json['id'].toString(),
      arrivalMoment: DateTime.parse(json['arrival_moment']),
      arrivalUser: json['arrival_user'],
      departureMoment: DateTime.parse(json['departure_moment']),
      departureUser: json['departure_user'],
      vehicleId: json['vehicle_id'],
      createdAt: DateTime.parse(json['created_at']),
      inactive: json['inactive'] == 1 ? true : false
    );
  }

}