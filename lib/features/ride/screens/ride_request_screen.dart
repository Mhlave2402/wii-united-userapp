import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RideRequestForm extends StatefulWidget {
  const RideRequestForm({super.key});

  @override
  _RideRequestFormState createState() => _RideRequestFormState();
}

class _RideRequestFormState extends State<RideRequestForm> {
  DateTime? _selectedDateTime;

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }


  void _submitRideRequest() {
    if (_selectedDateTime != null) {
      // Format the date and time for your request data
      String formattedDateTime = DateFormat('yyyy-MM-dd HH:mm').format(_selectedDateTime!);

      // Include formattedDateTime in your API request data
      print('Ride requested for: $formattedDateTime');


      // ... your existing ride request logic ...
    } else {
      // Handle the case where the user hasn't selected a date and time
      print('Please select a date and time for your ride.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        // ... other form fields ...

        ElevatedButton(
          onPressed: () => _selectDateTime(context),
          child: Text(_selectedDateTime == null
              ? 'Select Date and Time'
              : 'Selected Date and Time: ${DateFormat('yyyy-MM-dd HH:mm').format(_selectedDateTime!)}'),
        ),

        // ... other form fields ...


        ElevatedButton(
          onPressed: _submitRideRequest,
          child: Text('Request Ride'),
        ),
      ],
    );
  }
}