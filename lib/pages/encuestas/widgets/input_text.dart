import 'package:flutter/material.dart';

class InputTextWidget extends StatefulWidget {
  const InputTextWidget({
    Key? key,
    required this.label,
    this.controller,
    this.onSaved,
    this.isPassword,
    this.textColor,
  }) : super(key: key);
  final label;
  final controller;
  final Color? textColor;
  final Function(String?)? onSaved;
  final bool? isPassword;

  @override
  _InputTextWidgetState createState() => _InputTextWidgetState();
}

class _InputTextWidgetState extends State<InputTextWidget> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0, top: 8.0),
          child: Text(
            widget.label,
            style: TextStyle(
              fontSize: 16,
              color: widget.textColor,
            ),
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
          child: TextFormField(
            onSaved: (value) {
              widget.onSaved!(value);
            },
            validator: (value) {
              if (value!.isEmpty) {
                return '${widget.label} es requerido';
              }
              return null;
            },
            controller: widget.controller,
            obscureText: widget.isPassword == true ? true : false,
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
