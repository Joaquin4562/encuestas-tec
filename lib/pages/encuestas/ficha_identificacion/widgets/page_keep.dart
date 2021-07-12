import 'package:flutter/material.dart';

class PageKeep extends StatefulWidget {
  PageKeep({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  _PageKeepState createState() => _PageKeepState();
}

class _PageKeepState extends State<PageKeep> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}