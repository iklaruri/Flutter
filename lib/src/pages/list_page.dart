import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  List<int> _listaNum = new List();
  int _ultimaImg = 0;
  bool _isLoading = false;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _agregarImagenes();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        fechData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: [
          _crearLista(),
          _crearLoading()
        ],
      )
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPagina,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNum.length,
        itemBuilder: (BuildContext context, int index){
          final imagen = _listaNum[index];
          return FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: NetworkImage('https://picsum.photos/500/300?image=$imagen')
          );
        }
      ),
    );
  }

  void _agregarImagenes(){
    for(var i = 0; i < 10; i++){
      _ultimaImg++;
      _listaNum.add(_ultimaImg);
    }
    setState(() {});
  }

  Future<Null> fechData() async {
    _isLoading = true;
    setState(() { });

    final duration = new Duration(seconds: 2);
    new Timer(duration, resHttp);

  }

  void resHttp() {
    _isLoading = false;
    _scrollController.animateTo(
       _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );
    _agregarImagenes();
  }

  Widget _crearLoading() {
    if(_isLoading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 15.0)
        ],
      );
    }else{
      return Container();
    }
  }

  Future<Null> obtenerPagina() async{
    final duration = new Duration(seconds: 2);
    new Timer(duration, (){
      _listaNum.clear();
      _ultimaImg++;
      _agregarImagenes();
    });

    return Future.delayed(duration);
  }
}
