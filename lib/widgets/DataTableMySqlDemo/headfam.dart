class HeadOfFamily {
  String id;
  String lastName;
  String firstName;
  String middleName;
  String nameExtension;
  String age;
  String birthDate;
  String birthPlace;
  String gender;
  String mothersMaiden;
  String monthFamIncome;
  String occupation;
  String contactNumber;
  String idPresented;
  String idCardNumber;
  String isFourPsBeneficiary;

  HeadOfFamily({
    required this.id,
    required this.lastName,
    required this.firstName,
    required this.middleName,
    required this.nameExtension,
    required this.age,
    required this.birthDate,
    required this.birthPlace,
    required this.gender,
    required this.mothersMaiden,
    required this.monthFamIncome,
    required this.occupation,
    required this.contactNumber,
    required this.idPresented,
    required this.idCardNumber,
    required this.isFourPsBeneficiary,
  });

  factory HeadOfFamily.fromJson(Map<String, dynamic> json) {
    return HeadOfFamily(
      id: json['id'] as String,
      lastName: json['head_lastname'] as String,
      firstName: json['head_firstname'] as String,
      middleName: json['head_middlename'] as String,
      nameExtension: json['head_nameExt'] as String,
      age: json['head_age'] as String,
      birthDate: json['head_birthdate'] as String,
      birthPlace: json['head_birthplace'] as String,
      gender: json['head_gender'] as String,
      mothersMaiden: json['head_mothersmaiden'] as String,
      monthFamIncome: json['head_monthlyincome'] as String,
      occupation: json['head_occupation'] as String,
      contactNumber: json['head_contactNumber'] as String,
      idPresented: json['head_idpresented'] as String,
      idCardNumber: json['head_idcardNumber'] as String,
      isFourPsBeneficiary: json['head_4psBeneficiary'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'head_lastname': lastName,
      'head_firstname': firstName,
      'head_middlename': middleName,
      'head_nameExt': nameExtension,
      'head_age': age,
      'head_birthdate': birthDate,
      'head_birthplace': birthPlace,
      'head_gender': gender,
      'head_mothersmaiden': mothersMaiden,
      'head_monthlyincome': monthFamIncome,
      'head_occupation': occupation,
      'head_contactNumber': contactNumber,
      'head_idpresented': idPresented,
      'head_idcardNumber': idCardNumber,
      'head_4psBeneficiary': isFourPsBeneficiary,
    };
  }
}
