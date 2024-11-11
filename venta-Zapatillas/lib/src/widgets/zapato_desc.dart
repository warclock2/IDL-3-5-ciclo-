import 'package:flutter/material.dart';

class ZapatoDescripcion extends StatelessWidget {
  
  final String titulo;
  final String descripcion;

  ZapatoDescripcion({@required this.titulo, @required this.descripcion});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10),
          Text(this.titulo, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          SizedBox(height: 10),
          Text(this.descripcion, style: TextStyle(color: Colors.black54, height: 1.6)),
        ],
      ),
    );
  }
}