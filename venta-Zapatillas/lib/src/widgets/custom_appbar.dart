import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {

  final String texto;

  const CustomAppBar({@required this.texto});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Container(
          // padding: EdgeInsets.only(top: 0.0),
          width: double.infinity,
          height: 50,
          child: Row(
            children: <Widget>[
              Text(texto, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
              Spacer(),
              Icon(Icons.search, size: 20)
            ],
          )
        ),
      ),
    );
  }
}