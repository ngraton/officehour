import 'package:flutter/material.dart';
import 'dart:async';

class SecondScreen extends StatefulWidget {
  SecondScreen({Key key}) : super(key: key);

  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List _subjects = ['Flutter', 'Dart'];
  List _minutes = ['00', '15', '30', '45'];
  List _hours = ['8', '9', '10', '11', '12', '1', '2', '3', '4', '5', '6'];
  List _months = ['6', '7', '8', '9'];
  List _days = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
  
  List<DropdownMenuItem<String>> _menuItems;
  String _selectedItem;

  List<DropdownMenuItem<String>> _minutesDropdown;
  String _selectedMinutes;

  List<DropdownMenuItem<String>> _hoursDropdown;
  String _selectedHour;

  List<DropdownMenuItem<String>> _monthsDropdown;
  String _selectedMonth;

  List<DropdownMenuItem<String>> _daysDropdown;
  String _selectedDay;

  List<DropdownMenuItem<String>> _durationDropdown;
  String _selectedDuration;

  @override
  void initState() {
    _menuItems = getDropdowns(_subjects);
    _selectedItem = _menuItems[0].value;

    _minutesDropdown = getDropdowns(_minutes);
    _selectedMinutes = _minutesDropdown[0].value;

    _hoursDropdown = getDropdowns(_hours);
    _selectedHour = _hoursDropdown[0].value;

    _monthsDropdown = getDropdowns(_months);
    _selectedMonth = _monthsDropdown[0].value;

    _daysDropdown = getDropdowns(_days);
    _selectedDay = _daysDropdown[0].value;

    _durationDropdown = getDropdowns(['15', '30', '45', '60']);
    _selectedDuration = _durationDropdown[0].value;

    super.initState();
  }

  List<DropdownMenuItem<String>> getDropdowns(values) {
    List<DropdownMenuItem<String>> list = List();
    for (String val in values) {
      list.add(new DropdownMenuItem(
        value: val,
        child: Text(val),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Schedule Appointment')),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pop(context);
          },
          label: Text('Save'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(80.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Give Help'),
                    Radio(value: 1, groupValue: 0, onChanged: (val) {}),
                    Text('Need Help'),
                    Radio(value: 1, groupValue: 0, onChanged: (val) {}),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Subject: '),
                    DropdownButton(
                      value: _selectedItem,
                      items: _menuItems,
                      onChanged: (selected) {
                        setState(() {
                          _selectedItem = selected;
                        });
                      })
                  ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        Text('Month: '),
                        DropdownButton(
                          value: _selectedMonth,
                          items: _monthsDropdown,
                          onChanged: (selected) {
                            setState(() {
                              _selectedMonth = selected;
                            });
                          },
                        ),
                        Text('Day: '),
                        DropdownButton(
                          value: _selectedDay,
                          items: _daysDropdown,
                          onChanged: (selected) {
                            setState(() {
                              _selectedDay = selected;
                            });
                          },
                        ),
                      ]
                    ),
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Text('Hour: '),
                      DropdownButton(
                        value: _selectedHour,
                        items: _hoursDropdown,
                        onChanged: (selected) {
                          setState(() {
                            _selectedHour = selected;
                          });
                        },
                      ),
                      Text('Minutes: '),
                      DropdownButton(
                        value: _selectedMinutes,
                        items: _minutesDropdown,
                        onChanged: (selected) {
                          setState(() {
                            _selectedMinutes = selected;
                          });
                        },
                      ),
                    ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Text('Duration: '),
                      DropdownButton(
                        value: _selectedDuration,
                        items: _durationDropdown,
                        onChanged: (selected) {
                          _selectedDuration = selected;
                        },
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ));
  }
}
