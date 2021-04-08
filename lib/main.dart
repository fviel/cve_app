import 'package:flutter/material.dart';
import 'package:cve_app/telas/listarEmpreendimentos.dart';
import 'package:flutter/services.dart';

void main() {
  // We need to call it manually,
  // because we going to call setPreferredOrientations()
  // before the runApp() call
  WidgetsFlutterBinding.ensureInitialized();

  // fixa a orientação do app para retrato, para isso precisei importat o services
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(CVEMain()));
}

class CVEMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notelist',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
          primarySwatch: Colors.red
      ),
      home: ListarEmpreendimentos(),
      //home: NoteDetail(),
    );
  }
}


// void main() {
//
//  runApp(MaterialApp(
//        initialRoute: '/listarEmpreendimentos',
//        debugShowCheckedModeBanner: true,
//
//        routes:{
//          '/listarEmpreendimentos':(context) => ListarEmpreendimentos(),
//          '/exibirEmpreendimento':(context) => ExibirEmpreendimento(),
//          '/sobre': (context) => Sobre(),
//          '/adicionar': (context) => AdicionarEmpreendimento(),
//        }
//    ));
// }

// void main() {
//   runApp(MaterialApp(
//     //TODO o correto é primeiro chamar a loading, depois a loading chamar a listar, mas o bug está impedindo
//       initialRoute: '/listarEmpreendimentos',
//       debugShowCheckedModeBanner: true,
//       routes: {
//         '/loading': (context) => Loading(),
//         '/listarEmpreendimentos': (context) => ListarEmpreendimentos(),
//         '/exibirEmpreendimento': (context) => ExibirEmpreendimento(),
//         '/sobre': (context) => Sobre(),
//         '/adicionar': (context) => AdicionarEmpreendimento(),
//       }));
// }
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       // Replace the 3 second delay with your initialization code:
//       future: Future.delayed(Duration(seconds: 3)),
//       builder: (context, AsyncSnapshot snapshot) {
//         return MaterialApp(
//
//
//             initialRoute: '/loading',
//             debugShowCheckedModeBanner: true,
//             routes: {
//               '/loading': (context) => Loading(),
//               '/listarEmpreendimentos': (context) => ListarEmpreendimentos(),
//               '/exibirEmpreendimento': (context) => ExibirEmpreendimento(),
//               '/sobre': (context) => Sobre(),
//               '/adicionar': (context) => AdicionarEmpreendimento(),
//             }
//             );
//
//
//
//
//       },
//     );
//   }
// }



