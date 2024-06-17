import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'datatable_loc.dart';

class MainDashboard extends StatefulWidget {
  @override
  _MainDashboardState createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  String _evacuationSite = '';
  String _evacuationSiteHead = '';

  void _onLocationAdded(String evacuationSite, String evacuationSiteHead) {
    setState(() {
      _evacuationSite = evacuationSite;
      _evacuationSiteHead = evacuationSiteHead;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make the app bar transparent
        elevation: 0, // Remove the shadow
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'lib/icons/background.png',
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 30, // Adjusted top value to move the image upward
            left: 90, // Adjusted left value for better positioning
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'lib/icons/logos.png',
                  width: 190, // Increased width
                  height: 120, // Increased height
                ),
                SizedBox(width: 5), // Adjust spacing if necessary
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: TextSection(
                    title: 'Flood Risk Reduction and Management',
                    subTitle: 'Barangay Buenavista, San Fernando Camarines Sur',
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            right: 80,
            child: Row(
              children: [
                IconButton(
                  icon: Image.asset('lib/icons/addevacuee.png', width: 50, height: 50),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          contentPadding: EdgeInsets.all(0), // Remove default padding
                          content: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 1.9,
                            child: DataTableLoc(onLocationAdded: _onLocationAdded), // Using DataTableLoc with callback
                          ),
                        );
                      },
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset('lib/icons/edit.png', width: 50, height: 50),
                  onPressed: () {
                    // Add your onPressed code here!
                  },
                ),
                IconButton(
                  icon: Image.asset('lib/icons/removeevacuee.png', width: 50, height: 50),
                  onPressed: () {
                    // Add your onPressed code here!
                  },
                ),
                IconButton(
                  icon: Image.asset('lib/icons/search.png', width: 50, height: 50),
                  onPressed: () {
                    // Add your onPressed code here!
                  },
                ),
              ],
            ),
          ),
          Positioned(
            top: 180, // Adjusted top value to move the container upward
            left: 105,
            right: 90,
            child: Column(
              children: [
                Container(
                  color: Color(0xFF62C1E5),
                  padding: EdgeInsets.all(15),
                  child: Center(
                    child: Text(
                      'HOUSEHOLD EVACUATION LIST',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Table(
                  border: TableBorder(
                    verticalInside: BorderSide(width: 1, color: Colors.white),
                  ),
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        color: Color(0xFF1C96C5),
                      ),
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'EVACUATION SITE',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'EVACUATION SITE HEAD',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(
                        color: Color(0xFFCFECF7),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _evacuationSite,
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _evacuationSiteHead,
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TextSection extends StatelessWidget {
  final String title;
  final String subTitle;

  const TextSection({Key? key, required this.title, required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              subTitle,
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF1C96C5),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MainDashboard(),
  ));
}
