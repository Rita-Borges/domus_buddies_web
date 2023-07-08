import 'package:flutter/material.dart';

class DatePickerExample extends StatefulWidget {
  @override
  _DatePickerExampleState createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerExample> {
  late DateTime _selectedDate;
  late DateTime _minDate;
  late DateTime _maxDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _minDate = DateTime(1900);
    _maxDate = DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: _minDate,
      lastDate: _maxDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              surface: Colors.pink,
              primary: Colors.pink,
              onPrimary: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Birthday Picker Example'),
      ),
      backgroundColor: Colors.pink,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _selectedDate != null
                  ? 'Selected Date: ${_selectedDate.toString().substring(0, 10)}'
                  : 'No Date Selected',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text(
                'Select Date',
                style:
                    TextStyle(color: Colors.white), // Change the color to white
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.pink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
