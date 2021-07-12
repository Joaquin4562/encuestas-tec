import 'package:flutter/material.dart';

class DropDownWidgedFicha extends StatefulWidget {
  const DropDownWidgedFicha({
    Key? key,
    required this.label,
    required this.items,
    this.onSaved
  }) : super(key: key);
  final label;
  final List<dynamic> items;
  final Function(String?)? onSaved;
  @override
  _DropDownWidgedFichaState createState() => _DropDownWidgedFichaState();
}

class _DropDownWidgedFichaState extends State<DropDownWidgedFicha> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    String _dropDownvalue = widget.items[0]['id_ficha_identificacion'].toString();
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
              for (var item in widget.items)
                DropdownMenuItem(
                  value: item['id_ficha_identificacion'].toString(),
                  child: Text(item['nombre'].toString()),
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
