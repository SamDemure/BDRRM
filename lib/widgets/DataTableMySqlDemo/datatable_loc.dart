import 'package:dafac/widgets/DataTableMySqlDemo/location.dart';
import 'package:dafac/widgets/DataTableMySqlDemo/services_loc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DataTableLoc extends StatefulWidget {
  final Function(String, String) onLocationAdded;

  DataTableLoc({required this.onLocationAdded});

  @override
  DataTableLocState createState() => DataTableLocState();
}

class DataTableLocState extends State<DataTableLoc> {
  List<Location> _locations = [];
  TextEditingController _regionController = TextEditingController();
  TextEditingController _provinceController = TextEditingController();
  TextEditingController _districtController = TextEditingController();
  TextEditingController _barangayController = TextEditingController();
  TextEditingController _municipalityController = TextEditingController();
  TextEditingController _evacuationsiteController = TextEditingController();
  TextEditingController _evacuationsiteHeadController = TextEditingController();
  Location _selectedLocation = Location(
    id: '',
    region: '',
    province: '',
    district: '',
    barangay: '',
    municipality: '',
    evacuationsite: '',
    evacuationsiteHead: '',
  );
  bool _isUpdating = false;
  String _titleProgress = 'Flutter Data Table';

  @override
  void initState() {
    super.initState();
    _getLocations();
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

  void createTable() {
    _showProgress('Creating Table...');
    Services.createTable().then((result) {
      if ('success' == result) {
        _showSnackBar(context, result);
        _showProgress('Table Created');
      }
    });
  }

  void _addLocation() {
    if (_regionController.text.isEmpty ||
        _provinceController.text.isEmpty ||
        _districtController.text.isEmpty ||
        _barangayController.text.isEmpty ||
        _municipalityController.text.isEmpty ||
        _evacuationsiteController.text.isEmpty ||
        _evacuationsiteHeadController.text.isEmpty) {
      print('Empty Fields');
      return;
    }
    _showProgress('Adding Location...');
    Services.addLocation(
      _regionController.text,
      _provinceController.text,
      _districtController.text,
      _barangayController.text,
      _municipalityController.text,
      _evacuationsiteController.text,
      _evacuationsiteHeadController.text,
    ).then((result) {
      if ('success' == result) {
        widget.onLocationAdded(
          _evacuationsiteController.text,
          _evacuationsiteHeadController.text,
        );
        _getLocations();
        _clearValues();
        Navigator.of(context).pop(); // Close dialog after adding location
      }
    });
  }

  void _getLocations() {
    _showProgress('Loading Locations...');
    Services.getLocations().then((locations) {
      setState(() {
        _locations = locations;
      });
      _showProgress('Locations Loaded');
    });
  }

  void _updateLocation(Location location) {
    _showProgress('Updating Location...');
    Services.updateLocation(
      location.id,
      _regionController.text,
      _provinceController.text,
      _districtController.text,
      _barangayController.text,
      _municipalityController.text,
      _evacuationsiteController.text,
      _evacuationsiteHeadController.text,
    ).then((result) {
      if ('success' == result) {
        _getLocations();
        _clearValues();
        setState(() {
          _isUpdating = false;
        });
        Navigator.of(context).pop(); // Close dialog after updating location
      }
    });
  }

  void _deleteLocation(String locId) {
    _showProgress('Deleting Location...');
    Services.deleteLocation(locId).then((result) {
      if ('success' == result) {
        _getLocations();
      }
    });
  }

  void _clearValues() {
    _regionController.text = '';
    _provinceController.text = '';
    _districtController.text = '';
    _barangayController.text = '';
    _municipalityController.text = '';
    _evacuationsiteController.text = '';
    _evacuationsiteHeadController.text = '';
  }

  void _showValues(Location location) {
    setState(() {
      _regionController.text = location.region;
      _provinceController.text = location.province;
      _districtController.text = location.district;
      _barangayController.text = location.barangay;
      _municipalityController.text = location.municipality;
      _evacuationsiteController.text = location.evacuationsite;
      _evacuationsiteHeadController.text = location.evacuationsiteHead;
      _selectedLocation = location;
      _isUpdating = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LIST OF EVACUEES (HOUSEHOLD)'),
        backgroundColor: Color(0xFF1C96C5),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Color(0xFFCFECF7),
              ),
              child: Text(
                '(1) Location of the Affected Family',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 215,
                    decoration: BoxDecoration(
                      color: Color(0xFF1C96C5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 5),
                        _buildSidebarButton('Location of the Affected Family'),
                        _buildSidebarButton('Head of the Family'),
                        _buildSidebarButton('Family Information'),
                        _buildSidebarButton('House Details'),
                        Container(
                          width: 100,
                          height: 1,
                          color: Colors.black,
                          margin: EdgeInsets.symmetric(vertical: 6),
                        ),
                        _buildSidebarButton(
                            'Vulnerability Assessment Index'),
                        _buildSidebarButton('Administering Staff'),
                        _buildSidebarButton('Family Assistance Record'),
                        SizedBox(height: 12),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              controller: _regionController,
                              decoration: InputDecoration(hintText: 'Region'),
                            ),
                            SizedBox(height: 8),
                            TextField(
                              controller: _provinceController,
                              decoration:
                                  InputDecoration(hintText: 'Province'),
                            ),
                            SizedBox(height: 8),
                            TextField(
                              controller: _districtController,
                              decoration:
                                  InputDecoration(hintText: 'District'),
                            ),
                            SizedBox(height: 8),
                            TextField(
                              controller: _barangayController,
                              decoration:
                                  InputDecoration(hintText: 'Barangay'),
                            ),
                            SizedBox(height: 8),
                            TextField(
                              controller: _municipalityController,
                              decoration:
                                  InputDecoration(hintText: 'Municipality'),
                            ),
                            SizedBox(height: 8),
                            TextField(
                              controller: _evacuationsiteController,
                              decoration:
                                  InputDecoration(hintText: 'Evacuation Site'),
                            ),
                            SizedBox(height: 8),
                            TextField(
                              controller: _evacuationsiteHeadController,
                              decoration: InputDecoration(
                                  hintText: 'Evacuation Site Head'),
                            ),
                            SizedBox(height: 20),
                            _isUpdating
                                ? ElevatedButton(
                                    child: Text('Update'),
                                    onPressed: () {
                                      _updateLocation(_selectedLocation);
                                      Navigator.of(context).pop();
                                    },
                                  )
                                : ElevatedButton(
                                    child: Text('Add'),
                                    onPressed: () {
                                      _addLocation();
                                      Navigator.of(context).pop();
                                    },
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSidebarButton(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: TextButton(
        onPressed: () {
          // Add your onPressed code here!
          print('$text button pressed');
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(8),
          backgroundColor: Color(0xFFEAE7E6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
