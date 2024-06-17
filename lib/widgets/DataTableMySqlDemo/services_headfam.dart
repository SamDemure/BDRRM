import 'dart:convert';

import 'package:dafac/widgets/DataTableMySqlDemo/headfam.dart';
import 'package:http/http.dart' as http;

class ServicesHeadfam {
  static const ROOT = 'http://localhost/EvacueesDB/famhead_actions.php';
  static const CREATE_TABLE_ACTION = 'CREATE_TABLE';
  static const _GET_ALL_ACTION = 'GET_ALL';
  static const _ADD_FAMHEAD_ACTION = 'ADD_FAMHEAD';
  static const _UPDATE_FAMHEAD_ACTION = 'UPDATE_FAMHEAD';
  static const _DELETE_FAMHEAD_ACTION = 'DELETE_FAMHEAD';

  static Future<String> createTable() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = CREATE_TABLE_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      print('Create Table Error: $e');
      return "error";
    }
  }

  static Future<List<HeadOfFamily>> getHeadFamily() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = _GET_ALL_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      if (response.statusCode == 200) {
        List<HeadOfFamily> list = parseResponse(response.body);
        return list;
      } else {
        return <HeadOfFamily>[];
      }
    } catch (e) {
      print('Get Head of Family Error: $e');
      return <HeadOfFamily>[];
    }
  }

  static List<HeadOfFamily> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody) as List<dynamic>;
    return parsed
        .map<HeadOfFamily>(
            (json) => HeadOfFamily.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  static Future<String> addHeadofFamily(
      String lastName,
      String firstName,
      String middleName,
      String nameExtension,
      String age,
      String birthDate,
      String birthPlace,
      String gender,
      String mothersMaiden,
      String monthFamIncome,
      String occupation,
      String contactNumber,
      String idPresented,
      String idCardNumber,
      String isFourPsBeneficiary) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = _ADD_FAMHEAD_ACTION;
      map['head_lastname'] = lastName;
      map['head_firstname'] = firstName;
      map['head_middlename'] = middleName;
      map['head_nameExt'] = nameExtension;
      map['head_age'] = age;
      map['head_birthdate'] = birthDate;
      map['head_birthplace'] = birthPlace;
      map['head_gender'] = gender;
      map['head_mothersmaiden'] = mothersMaiden;
      map['head_monthlyincome'] = monthFamIncome;
      map['head_occupation'] = occupation;
      map['head_contactNumber'] = contactNumber;
      map['head_idpresented'] = idPresented;
      map['head_idcardNumber'] = idCardNumber;
      map['head_4psBeneficiary'] = isFourPsBeneficiary;
      final response = await http.post(Uri.parse(ROOT), body: map);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return 'error';
      }
    } catch (e) {
      print('Add Head of Family Error: $e');
      return 'error';
    }
  }

  static Future<String> updateHeadofFamily(
      String headId,
      String lastName,
      String firstName,
      String middleName,
      String nameExtension,
      String age,
      String birthDate,
      String birthPlace,
      String gender,
      String mothersMaiden,
      String monthFamIncome,
      String occupation,
      String contactNumber,
      String idPresented,
      String idCardNumber,
      String isFourPsBeneficiary) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = _UPDATE_FAMHEAD_ACTION;
      map['head_id'] = headId.toString();
      map['head_lastname'] = lastName;
      map['head_firstname'] = firstName;
      map['head_middlename'] = middleName;
      map['head_nameExt'] = nameExtension;
      map['head_age'] = age;
      map['head_birthdate'] = birthDate;
      map['head_birthplace'] = birthPlace;
      map['head_gender'] = gender;
      map['head_mothersmaiden'] = mothersMaiden;
      map['head_monthlyincome'] = monthFamIncome;
      map['head_occupation'] = occupation;
      map['head_contactNumber'] = contactNumber;
      map['head_idpresented'] = idPresented;
      map['head_idcardNumber'] = idCardNumber;
      map['head_4psBeneficiary'] = isFourPsBeneficiary;
      final response = await http.post(Uri.parse(ROOT), body: map);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return 'error';
      }
    } catch (e) {
      print('Update Head of Family Error: $e');
      return 'error';
    }
  }

  static Future<String> deleteHeadofFamily(String headId) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = _DELETE_FAMHEAD_ACTION;
      map['head_id'] = headId;
      final response = await http.post(Uri.parse(ROOT), body: map);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return 'error';
      }
    } catch (e) {
      print('Delete Head of Family Error: $e');
      return 'error';
    }
  }
}
