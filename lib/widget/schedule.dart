import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Column(
        children: const <Widget>[
          Text(' \n'),
          SizedBox(height: 20.0),
          Text('   07-08'),
          SizedBox(height: 20.0),
          Text('   08-09'),
          SizedBox(height: 20.0),
          Text('   09-10'),
          SizedBox(height: 20.0),
          Text('   10-11'),
          SizedBox(height: 20.0),
        ],
      ),
      Spacer(),
      Text('\nSeg'),
      Spacer(),
      Text('\nTer'),
      Spacer(),
      Text('\nQua'),
      Spacer(),
      Text('\nQui'),
      Spacer(),
      Text('\nSex'),
      Spacer(),
    ]);
  }
}
