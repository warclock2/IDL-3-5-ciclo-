import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:shoes_app/src/helpers/helpers.dart';
import 'package:shoes_app/src/models/zapato_model.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';


class ZapatoDescPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(tag: 'zapato-1', child: ZapatoSizePreview(fullScreen: true)),
              Positioned(
                top: 60,
                child: FloatingActionButton(
                  child: Icon(Icons.chevron_left, color: Colors.white, size: 40),
                  onPressed: (){
                    cambiarStatusDark();
                    Navigator.pop(context);
                  },
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  highlightElevation: 0,
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ZapatoDescripcion(
                    titulo: 'Nike Air Max 720',
                    descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  _MontoBuyNow(),
                  _ColoresYmas(),
                  _BotonesLikeCartSettings(),
                ],
              ),
            ),
          )
        ],
      )
   );
  }
}

class _BotonesLikeCartSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _BotonSombreado(Icon(Icons.star, color: Colors.red, size: 20)),
          _BotonSombreado(Icon(Icons.add_shopping_cart, color: Colors.grey.withOpacity(0.4), size: 20)),
          _BotonSombreado(Icon(Icons.settings, color: Colors.grey.withOpacity(0.4), size: 20)),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final Icon icon;

  _BotonSombreado(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.icon,
      width:50,
      height:50,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: -5, blurRadius: 20, offset: Offset(0,10)),
        ]
      ),
    );
  }
}

class _ColoresYmas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Positioned(left: 75, child: _BotonColor(Color(0xffC6D642), 4, 'assets/imgs/verde.png')),
                Positioned(left: 50, child: _BotonColor(Color(0xffFFAD29), 3, 'assets/imgs/amarillo.png')),
                Positioned(left: 25, child: _BotonColor(Color(0xff2099F1), 2, 'assets/imgs/azul.png')),
                _BotonColor(Color(0xff364D56), 1, 'assets/imgs/negro.png'),
              ],
            ),
          ),
          // Spacer(),
          BotonNaranja(texto: 'More related items', alto: 30, ancho: 130, color: Color(0xffFFC675))
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;
  final int index;
  final String urlImagen;

  _BotonColor(this.color, this.index, this.urlImagen);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
      duration: Duration(milliseconds: 500),
      child: GestureDetector(
        onTap: () => Provider.of<ZapatoModel>(context, listen: false).assetImage = this.urlImagen,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
          ),
        ),
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: <Widget>[
            Text('\$180.0', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Spacer(),
            Bounce(
              delay: Duration(seconds: 1),
              from: 8,
              child: BotonNaranja(texto: 'Buy now', ancho: 100, alto: 40)
            )
          ],
        ),
      ),
    );
  }
}