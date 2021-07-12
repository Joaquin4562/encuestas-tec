import 'package:flutter/material.dart';

class DropDownWidged extends StatefulWidget {
  const DropDownWidged({
    Key? key,
    required this.label,
    this.controller,
    required this.items,
    this.onSaved
  }) : super(key: key);
  final label;
  final controller;
  final List<String> items;
  final Function(String?)? onSaved;
  @override
  _DropDownWidgedState createState() => _DropDownWidgedState();
}

class _DropDownWidgedState extends State<DropDownWidged> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    String _dropDownvalue = widget.items.first;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0, top: 8.0),
          child: Text(
            widget.label,
            style: TextStyle(fontSize: 16),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.blue,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: DropdownButtonFormField(
            onSaved: (_) {
              widget.onSaved!(_dropDownvalue);
            },
            value: _dropDownvalue,
            onChanged: (String? newValue) {
              setState(() {
                _dropDownvalue = newValue!;
              });
            },
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.blue,
            ),
            iconSize: 25,
            items: [
              for (String item in widget.items)
                DropdownMenuItem(
                  value: item,
                  child: Text('$item'),
                )
            ],
            decoration: InputDecoration(
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(10.0),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
