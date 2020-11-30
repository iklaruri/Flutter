import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SLider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top:50.0),
        child: Column(
          children: [
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(
                child: _crearImagen()
            )
          ],
        )
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      min: 10.0,
      max: 400.0,
      value: _valorSlider,
      onChanged: (_bloquearCheck) ? null: (valor){
         setState(() {
          _valorSlider=valor;
        });
      },
      activeColor: Colors.indigoAccent,
      divisions: 20,
    );
 }

  Widget _crearImagen() {
    return Image(
        image: NetworkImage('https://assets.stickpng.com/images/580b57fbd9996e24bc43c01d.png'),
        width: _valorSlider,
        fit: BoxFit.contain
    );
 }

  Widget _crearCheckBox() {
    return CheckboxListTile(
        title: Text('Bloquear slider'),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor;
          });
        }
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text('Bloquear slider'),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor;
          });
        }
    );
  }

}
