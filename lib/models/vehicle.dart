class LastRecord {
  DateTime moment;
  bool onGarage;

  LastRecord({this.moment, this.onGarage});

  factory LastRecord.fromJson(Map<String, dynamic> json) {
    return LastRecord(
      moment: DateTime.parse(json['moment']),
      onGarage: json['onGarage'],
    );
  }
}

class Vehicle {

  String id;
  int number;
  String licensePlate;
  int companyId;
  LastRecord lastRecord;
  DateTime createdAt;
  bool inactive;

  Vehicle({this.id, this.number, this.licensePlate, this.companyId, this.lastRecord, this.createdAt, this.inactive});

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['id'].toString(),
      number: json['number'],
      licensePlate: json['license_plate'],
      companyId: json['company_id'],
      lastRecord: LastRecord.fromJson(json['last_record']),
      createdAt: DateTime.parse(json['created_at']),
      inactive: json['inactive'] == 1 ? true : false
    );
  }

}