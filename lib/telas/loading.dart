import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class Loading extends StatefulWidget {

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setup() async {
    ///
    ///
    /// aqui faço alguma coisa com o async, por exemplo ler o DB
    ///
    ///
    //Navigator.pushReplacementNamed(context, '/listarEmpreendimentos');
    //TODO - Corrigir esse bug Failed assertion: line 5275 pos 12: '!_debugLocked': is not true.
    //Por algum motivo esse navigator não funciona, não sei o motivo
    await Navigator.pushReplacementNamed(context, '/listarEmpreendimentos', arguments: {
    'ok',
    });
  }

  /**
   *  // initState roda uma única vez, ao instanciar o widget
   */
  @override
  void initState() {
    super.initState();
    setup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body:Center(
            child: SpinKitWave(
              color:Colors.grey[500],
              size: 100.0,

            )
        )
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor:Colors.red,
//       body: Center(
//         child: Icon(
//           Icons.apartment_outlined,
//           size: MediaQuery.of(context).size.width * 0.785,
//         ),
//       ),
//     );
//   }
// }


///class Splash extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Icon(
//           Icons.apartment_outlined,
//           size: MediaQuery.of(context).size.width * 0.785,
//         ),
//       ),
//     );
//   }
// }


