import 'package:cve_app/telas/adicionarEmpreendimento.dart';
import 'package:cve_app/telas/exibirEmpreendimento.dart';
import 'package:cve_app/telas/sobre.dart';
import 'package:flutter/material.dart';
import 'package:cve_app/telas/listarEmpreendimentos.dart';

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


   //    home: ListarEmpreendimentos(),
   // //home: ExibirEmpreendimento(),

}



