// importamos módulos con lógica que sea relevante al proyecto
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

// en Flutter hay un método main en donde se ejecuta la app
void main() {
  runApp(const MainApp());
}

// Widget:
// similar al concepto de "composable"
// unidad básica de construcción de UI en flutter
// funciona con el mecanismo de agregado
// Se definen con clases
// debe heredar de widget
// 2 tipos -
// - stateless
// - stateful
class MainApp extends StatelessWidget {
  // definición de constructor
  const MainApp({super.key});

  // importante - sobreescribir método build
  // con la creación de mi widget
  @override
  Widget build(BuildContext context) {
    // uso muy frecuente - constructor constante
    // motivo: optimización
    return MaterialApp(
      title: "Primera App en Flutter!",
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const StatelessExample(),
    );
  }
}

// stateless - no hay cambios en UI sin importar cambios en datos
class StatelessExample extends StatelessWidget {
  const StatelessExample({super.key});

  @override
  Widget build(BuildContext context) {
    // para UI vamos a utilizar un widget llamado scaffold
    return Scaffold(
      appBar: AppBar(
        title: const Text("App chida"),
      ),
      // para desplegar elementos enlistados tenemos 2 recursos -
      // 1. column (no dinámico)
      // 2. ListView (dinámico)
      body: EjemploLista()
      /*
      Column(children: [
        const Text("hola!"),
        const Text("dato 1"),
        const Text("dato 2"),
        Image.network(
            "https://www.warrenphotographic.co.uk/photography/sqrs/14395.jpg")
      ]
      
      )
      */
      ,
    );
  }
}

class EjemploLista extends StatefulWidget {
  const EjemploLista({super.key});

  @override
  State<EjemploLista> createState() => _EjemploListaState();
}

class _EjemploListaState extends State<EjemploLista> {
  final List<String> _contenido = ['a', 'b', 'c', 'd', 'e'];
  final TextStyle _estilo =
      const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);

  // recuerda - este es el que se invoca en la construcción de la GUI!
  @override
  Widget build(BuildContext context) {
    return _construirLista();
  }

  // nosotros podemos tener todos los métodos que necesitemos dentro
  // de la clase
  Widget _construirLista() {
    // patrón de diseño
    // factory
    // https://en.wikipedia.org/wiki/Factory_method_pattern
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _contenido.length,
      itemBuilder: (context, i) {
        return _construirRow(_contenido[i]);
      },
    );
  }

  Widget _construirRow(String valor) {
    return ListTile(
      title: Text(valor, style: _estilo),
      onTap: () {
        Fluttertoast.showToast(
            msg: "TOUCH A TILE $valor",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1);
      },
    );
  }
}
