import 'package:dafac/widgets/DataTableMySqlDemo/datatable_headfam.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DataTableHeadFam(),
    );
  }
}
  