import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker(
      initialDate: DateTime.now(), 
      firstDate: DateTime(2023,2,1),
      lastDate: DateTime(2024,2,1), 
      onDateChanged: (DateTime value) {  },
    );
  }
}

