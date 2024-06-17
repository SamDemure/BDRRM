import 'package:dafac/widgets/DataTableMySqlDemo/headfam.dart';
import 'package:dafac/widgets/DataTableMySqlDemo/services_headfam.dart';
import 'package:flutter/material.dart';

class DataTableHeadFam extends StatefulWidget {
  DataTableHeadFam() : super();

  final String title = 'Head of Family';

  @override
  DataTableHeadFamState createState() => DataTableHeadFamState();
}

class DataTableHeadFamState extends State<DataTableHeadFam> {
  List<HeadOfFamily> _headfam = [];
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _middleNameController = TextEditingController();
  TextEditingController _nameExtensionController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _birthDateController = TextEditingController();
  TextEditingController _birthPlaceController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _mothersMaidenController = TextEditingController();
  TextEditingController _monthFamIncomeController = TextEditingController();
  TextEditingController _occupationController = TextEditingController();
  TextEditingController _contactNumberController = TextEditingController();
  TextEditingController _idPresentedController = TextEditingController();
  TextEditingController _idCardNumberController = TextEditingController();
  TextEditingController _isFourPsBeneficiaryController = TextEditingController();
  
  HeadOfFamily _selectedHeadOfFamily = HeadOfFamily(
    id: '',
    lastName: '',
    firstName: '',
    middleName: '',
    nameExtension: '',
    age: '',
    birthDate: '',
    birthPlace: '',
    gender: '',
    mothersMaiden: '',
    monthFamIncome: '',
    occupation: '',
    contactNumber: '',
    idPresented: '',
    idCardNumber: '',
    isFourPsBeneficiary: '',
  );

  bool _isUpdating = false;
  String _titleProgress = 'Head of Family';

  @override
  void initState() {
    super.initState();
    _getHeadFam();
  }

  void _showProgress(String message) {
    setState(() {
      _titleProgress = message;
    });
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  createTable() {
    _showProgress('Creating Table...');
    ServicesHeadfam.createTable().then((result) {
      if ('success' == result) {
        _showSnackBar(context, result);
        _showProgress(widget.title);
      }
    });
  }

  _addHeadFam() {
    if (_lastNameController.text.isEmpty ||
        _firstNameController.text.isEmpty ||
        _middleNameController.text.isEmpty ||
        _nameExtensionController.text.isEmpty ||
        _ageController.text.isEmpty ||
        _birthDateController.text.isEmpty ||
        _birthPlaceController.text.isEmpty ||
        _genderController.text.isEmpty ||
        _mothersMaidenController.text.isEmpty ||
        _monthFamIncomeController.text.isEmpty ||
        _occupationController.text.isEmpty ||
        _contactNumberController.text.isEmpty ||
        _idPresentedController.text.isEmpty ||
        _idCardNumberController.text.isEmpty ||
        _isFourPsBeneficiaryController.text.isEmpty) {
      print('Empty fields');
      return;
    }

    _showProgress('Adding Head of Fam...');
    ServicesHeadfam.addHeadofFamily(
      _lastNameController.text,
      _firstNameController.text,
      _middleNameController.text,
      _nameExtensionController.text,
      _ageController.text,
      _birthDateController.text,
      _birthPlaceController.text,
      _genderController.text,
      _mothersMaidenController.text,
      _monthFamIncomeController.text,
      _occupationController.text,
      _contactNumberController.text,
      _idPresentedController.text,
      _idCardNumberController.text,
      _isFourPsBeneficiaryController.text,
    ).then((result) {
      if ('success' == result) {
        _getHeadFam();
        _clearValues();
      }
    });
  }

  _getHeadFam() {
    _showProgress('Loading Head Fam....');
    ServicesHeadfam.getHeadFamily().then((headfam) {
      setState(() {
        _headfam = headfam;
      });
      _showProgress(widget.title);
      print("Length ${headfam.length}");
    });
  }

  _updateHeadofFamily(HeadOfFamily headOfFamily) {
    setState(() {
      _isUpdating = true;
    });
    ServicesHeadfam.updateHeadofFamily(
      headOfFamily.id,
      _lastNameController.text,
      _firstNameController.text,
      _middleNameController.text,
      _nameExtensionController.text,
      _ageController.text,
      _birthDateController.text,
      _birthPlaceController.text,
      _genderController.text,
      _mothersMaidenController.text,
      _monthFamIncomeController.text,
      _occupationController.text,
      _contactNumberController.text,
      _idPresentedController.text,
      _idCardNumberController.text,
      _isFourPsBeneficiaryController.text,
    ).then((result) {
      _getHeadFam();
      _clearValues();
      setState(() {
        _isUpdating = false;
      });
    });
  }

  _deleteHeadofFamily(String headId) {
    _showProgress('Deleting Location...');
    ServicesHeadfam.deleteHeadofFamily(headId).then((result) {
      _getHeadFam();
    });
  }

  _clearValues() {
    _lastNameController.text = '';
    _firstNameController.text = '';
    _middleNameController.text = '';
    _nameExtensionController.text = '';
    _ageController.text = '';
    _birthDateController.text = '';
    _birthPlaceController.text = '';
    _genderController.text = '';
    _mothersMaidenController.text = '';
    _monthFamIncomeController.text = '';
    _occupationController.text = '';
    _contactNumberController.text = '';
    _idPresentedController.text = '';
    _idCardNumberController.text = '';
    _isFourPsBeneficiaryController.text = '';
  }

  _showValues(HeadOfFamily headofFamily) {
    setState(() {
      _lastNameController.text = headofFamily.lastName;
      _firstNameController.text = headofFamily.firstName;
      _middleNameController.text = headofFamily.middleName;
      _nameExtensionController.text = headofFamily.nameExtension;
      _ageController.text = headofFamily.age;
      _birthDateController.text = headofFamily.birthDate;
      _birthPlaceController.text = headofFamily.birthPlace;
      _genderController.text = headofFamily.gender;
      _mothersMaidenController.text = headofFamily.mothersMaiden;
      _monthFamIncomeController.text = headofFamily.monthFamIncome;
      _occupationController.text = headofFamily.occupation;
      _contactNumberController.text = headofFamily.contactNumber;
      _idPresentedController.text = headofFamily.idPresented;
      _idCardNumberController.text = headofFamily.idCardNumber;
      _isFourPsBeneficiaryController.text = headofFamily.isFourPsBeneficiary;
      _selectedHeadOfFamily = headofFamily;
      _isUpdating = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(_titleProgress),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              createTable();
            },
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _getHeadFam();
            },
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _lastNameController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Last Name',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _firstNameController,
                decoration: InputDecoration.collapsed(
                  hintText: 'First Name',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _middleNameController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Middle Name',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _nameExtensionController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Name ext.',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _ageController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Age',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _birthDateController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Birth Date',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _birthPlaceController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Birth Place',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _genderController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Gender',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _mothersMaidenController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Mother\'s Maiden',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _monthFamIncomeController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Monthly Income',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _occupationController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Occupation',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _contactNumberController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Contact Number',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _idPresentedController,
                decoration: InputDecoration.collapsed(
                  hintText: 'ID Presented',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _idCardNumberController,
                decoration: InputDecoration.collapsed(
                  hintText: 'ID Number',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _isFourPsBeneficiaryController,
                decoration: InputDecoration.collapsed(
                  hintText: '4Ps Beneficiary',
                ),
              ),
            ),
            _isUpdating
                ? Row(
                    children: <Widget>[
                      ElevatedButton(
                        child: Text('UPDATE'),
                        onPressed: () {
                          _updateHeadofFamily(_selectedHeadOfFamily);
                        },
                      ),
                      ElevatedButton(
                        child: Text('CANCEL'),
                        onPressed: () {
                          setState(() {
                            _isUpdating = false;
                          });
                          _clearValues();
                        },
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addHeadFam();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
