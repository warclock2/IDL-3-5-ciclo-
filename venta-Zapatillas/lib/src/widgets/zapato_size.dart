import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/models/zapato_model.dart';
import 'package:shoes_app/src/pages/zapato_desc_page.dart';

class ZapatoSizePreview extends StatelessWidget {

  final bool fullScreen;

  const ZapatoSizePreview({this.fullScreen = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => !fullScreen ? Navigator.push(context, MaterialPageRoute(builder: (context) => ZapatoDescPage())) : null,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: fullScreen ? 5 : 30
        ),
        child: Container(
          width: double.infinity,
          height: fullScreen ? 350 : 360,
          decoration: BoxDecoration(
            color: Color(0xffFFCF53),
            borderRadius: fullScreen 
              ? BorderRadius.only(bottomLeft: Radius.circular(50),
                                  bottomRight: Radius.circular(50),
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40)) 
              : BorderRadius.circular(50)
          ),
          child: Column(
            children: <Widget>[
              // Zapato con su sombre
              _ZapatoConSombra(),
              if(!fullScreen)
                _ZapatoTallas()
            ],
          ),
        ),
      ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _TallaZapatoCaja(7),
          _TallaZapatoCaja(7.5),
          _TallaZapatoCaja(8),
          _TallaZapatoCaja(8.5),
          _TallaZapatoCaja(9),
          _TallaZapatoCaja(9.5),
        ],
      ),
    );
  }
}

class _TallaZapatoCaja extends StatelessWidget {

  final double numero;

  _TallaZapatoCaja(this.numero);

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return GestureDetector(
      onTap: () => Provider.of<ZapatoModel>(context, listen: false).talla = this.numero,
      child: Container(
        alignment: Alignment.center,
        child: Text('${numero.toString().replaceAll('.0', '')}', 
          style: TextStyle(
            color: this.numero == zapatoModel.talla ? Colors.white : Color(0xffF1A23A),
            fontSize: 16,
            fontWeight: FontWeight.bold
          )
        ),
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color: this.numero == zapatoModel.talla ? Color(0xffF1A23A) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if(this.numero == zapatoModel.talla)
              BoxShadow(color: Color(0xffF1A23A), blurRadius: 10, offset: Offset(0,5))
          ]
        ),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Stack(
        children: <Widget>[
          Positioned(bottom: 0, right: 0, child: _ZapatoSombra()),
          Image(image: AssetImage(zapatoModel.assetImage)),
        ],
      ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 160,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(color: Color(0xffEAA14E), blurRadius: 30)
          ]
        ),
      ),
    );
  }
}