import 'package:cve_app/telas/adicionarEmpreendimento.dart';
import 'package:cve_app/telas/exibirEmpreendimento.dart';
import 'package:cve_app/telas/sobre.dart';
import 'package:flutter/material.dart';
import 'package:cve_app/telas/listarEmpreendimentos.dart';


import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


void main() {

 runApp(MaterialApp(
       initialRoute: '/listarEmpreendimentos',
       debugShowCheckedModeBanner: true,

       routes:{
         '/listarEmpreendimentos':(context) => ListarEmpreendimentos(),
         '/exibirEmpreendimento':(context) => ExibirEmpreendimento(),
         '/sobre': (context) => Sobre(),
         '/adicionar': (context) => AdicionarEmpreendimento(),
       }
   ));
}

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



