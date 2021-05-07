import 'package:cve_app/shared/app_text_styles.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(
          Icons.apartment,
          color: Colors.white,
          size: 20.0,
        ),
        SizedBox(width: 2),
        Text(
          'Exibir Empreendimento',
          // style: TextStyle(
          //   fontSize: 16.0,
          //   color: Colors.white,
          // ),
          style: AppTextStyles.heading,
        ),
      ],
    );
  }
}
