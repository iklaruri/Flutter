import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards - Tarjetas'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
     return Card(
       elevation: 10.0,
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
       child: Column(
         children: [
           ListTile(
             leading: Icon(Icons.photo_album, color: Colors.blue),
             title: Text('Título de tarjeta'),
             subtitle: Text('Descripción de la tarjeta que estan viendo.')
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               FlatButton(
                   onPressed: (){

                   },
                   child: Text('Ok')
               ),
             FlatButton(
                 onPressed: (){

                 },
                 child: Text('Cancelar')
             )],
           )
         ],
       ),
     );
  }

  Widget _cardTipo2() {
    final card = Container(
      //clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: NetworkImage('https://photographylife.com/wp-content/uploads/2017/01/What-is-landscape-photography.jpg'),
              fadeInDuration: Duration(milliseconds: 200),
              height: 300.0,
              fit: BoxFit.cover,
          ),
         Container(
              child: Text('Landscape'),
              padding: EdgeInsets.all(10.0),
          )
        ],
      ),
    );

    return Container(
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(30.0),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
      ),
    );
  }
}
