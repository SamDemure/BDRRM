class Location{
  String id;
  String region;
  String province;
  String district;
  String barangay;
  String municipality;
  String evacuationsite;
  String evacuationsiteHead;

  Location({required this.id, required this.region, required this.province, required this.district, required this.barangay, required this.municipality, required this.evacuationsite, required this.evacuationsiteHead});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'] as String,
      region: json['loc_region'] as String,
      province: json['loc_province'] as String,
      district: json['loc_district'] as String,
      barangay: json['loc_barangay'] as String,
      municipality: json['loc_municipality'] as String,
      evacuationsite: json['loc_evacuationsite'] as String,
      evacuationsiteHead: json['loc_evacuationsiteHead'] as String,
    );
  }
}