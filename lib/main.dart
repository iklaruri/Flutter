
import 'package:componentes_flutter/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('es', 'ES'), // Castellano
      ],
      //home:  HomePage(),
      initialRoute: '/',
      routes: getAppRoutes(),
      /*onGenerateRoute: (RouteSettings settings){
        //print('Ruta llamada: ${settings.name}');
        return MaterialPageRoute(
            builder: (BuildContext context) => CardPage()
        );
      },*/
    );
  }
}
