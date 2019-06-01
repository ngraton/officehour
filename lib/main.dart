import 'package:flutter/material.dart';
import 'second_screen.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:sliver_calendar/sliver_calendar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: MyHomePage(title: 'Flutter Demo Home Page'),
        initialRoute: '/',
        routes: {
          '/': (context) => MyHomePage(title: 'Office Hour'),
          '/second': (context) => SecondScreen(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget buildItem(BuildContext context, CalendarEvent event) {
    return null;
  }

  @override
  List<CalendarEvent> getEvents(DateTime start, DateTime end) {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget> [
          ListTile(
            leading: Icon(Icons.schedule),
            title: Text('6/3/2019 11:00 AM')
          ),ListTile(
            leading: Icon(Icons.schedule),
            title: Text('6/4/2019 2:00 PM')
          ),
          ListTile(
            leading: Icon(Icons.schedule),
            title: Text('6/5/2019 6:00 PM')
          ),
          ListTile(
            leading: Icon(Icons.schedule),
            title: Text('6/6/2019 12:00 PM')
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/second');
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
