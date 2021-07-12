import 'package:flutter/cupertino.dart';

class ListData {
  String header;
  bool isExpanded;
  List<Widget> listaDatos;
  GlobalKey<FormState> globalKey;

  ListData(
      {required this.globalKey,
      required this.header,
      this.isExpanded = false,
      required this.listaDatos});

}
