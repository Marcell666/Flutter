import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('\nSegunda-Feira\n'),
        SizedBox(
          height: 50.0,
          width: double.infinity,
          child: Card(
            child: Row(
              children: <Widget>[
                Text('  07-09'),
                SizedBox(
                  height: 20.0,
                  child: VerticalDivider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                ),
                Text('     Introdução a Flutter'),
                Text('     546L'),
              ],
            ),
          ),
        ),
        Text('Terça-Feira\n'),
        Text('Quarta-Feira\n'),
        Text('Quinta-Feira\n'),
        Text('Sexta-Feira\n'),
        Text('Sábado\n'),
      ],
    );
  }
}
