import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import '../constants.dart';

class NumberSelector extends StatefulWidget {
  const NumberSelector({Key? key, required this.index}) : super(key: key);
  final int index ;
  @override
  _NumberSelectorState createState() => _NumberSelectorState(index);
}

class _NumberSelectorState extends State<NumberSelector> {
  final int index ;

  _NumberSelectorState(this.index);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 90,
      child: FittedBox(
        fit: BoxFit.contain,
        child: NumberPicker(
          value: inputs[index],
          minValue: 0,
          maxValue: 50,
          onChanged: (value) => setState(() => inputs[index] = value),
          selectedTextStyle: TextStyle( color: Colors.white , fontSize: 30),
        ),
      ),
    );
  }
}
