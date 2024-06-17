import 'dart:convert';

import 'package:dafac/widgets/DataTableMySqlDemo/location.dart';
import 'package:http/http.dart' as http;

class Services {
  static const ROOT = 'http://localhost/EvacueesDB/location_actions.php';
  static const CREATE_TABLE_ACTION = 'CREATE_TABLE';
  static const _GET_ALL_ACTION = 'GET_ALL';
  static const _ADD_LOC_ACTION = 'ADD_LOC';
  static const _UPDATE_LOC_ACTION = 'UPDATE_LOC';
  static const _DELETE_LOC_ACTION = 'DELETE_LOC';

  // Method to create the table LOCATION
  static Future<String> createTable() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = CREATE_TABLE_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Create Table Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  static Future<List<Location>> getLocations() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = _GET_ALL_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('getLocations Response: ${response.body}');
      if (200 == response.statusCode) {
        List<Location> list = parseResponse(response.body);
        return list;
      } else {
        return <Location>[];
      }
    } catch (e) {
      return <Location>[]; // Return an empty list on exception/error
    }
  }

  static List<Location> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody) as List<dynamic>;
    return parsed.map<Location>((json) => Location.fromJson(json as Map<String, dynamic>)).toList();
  }

  // Method to add employee to the database
  static Future<String> addLocation(String region, String province, String district, String barangay, String municipality, String evacuationsite, String evacuationsiteHead) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = _ADD_LOC_ACTION;
      map['loc_region'] = region;
      map['loc_province'] = province;
      map['loc_district'] = district;
      map['loc_barangay'] = barangay;
      map['loc_municipality'] = municipality;
      map['loc_evacuationsite'] = evacuationsite;
      map['loc_evacuationsiteHead'] = evacuationsiteHead;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('addLocation Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  // Method to update an Evacuee in database
  static Future<String> updateLocation(String locId, String region, String province, String district, String barangay, String municipality, String evacuationsite, String evacuationsiteHead) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = _UPDATE_LOC_ACTION;
      map['loc_id'] = locId.toString();
      map['loc_region'] = region;
      map['loc_province'] = province;
      map['loc_district'] = district;
      map['loc_barangay'] = barangay;
      map['loc_municipality'] = municipality;
      map['loc_evacuationsite'] = evacuationsite;
      map['loc_evacuationsiteHead'] = evacuationsiteHead;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('updateEvacuee Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  // Method to delete an Evacuee from database
  static Future<String> deleteLocation(String locId) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = _DELETE_LOC_ACTION;
      map['loc_id'] = locId.toString();
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('deleteEvacuee Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error"; // Returning just an "error" string to keep this simple
    }
  }

  static fetchEvacuees() {}

  static getHeadOfFamily() {}
}
