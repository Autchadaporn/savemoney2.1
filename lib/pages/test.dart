import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var currentTime = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
  var currentTime2 = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
  int consommation = 0;
  String reftime_string;

//------------------------------------------------------------------------------------------------
  save_refTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {


      prefs.setString('$currentTime2', reftime_string);
    });
    load_refTime();
  }

  load_refTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {

      reftime_string = (prefs.getString('$currentTime2'));

    });
  }
//--------------------------------------------------------------------------------------------------------------
  save_data() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {

      if (currentTime==reftime_string){
        consommation++;
        prefs.setInt('$currentTime''consommation', consommation);  // creer un currenttime2 ajustable
      }else{
        consommation=0;
        consommation++;
        prefs.setInt('$currentTime''consommation', consommation);  // creer un currenttime2 ajustable
      }

    });
    load_data();
  }

  load_data() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      consommation = (prefs.getInt('$currentTime''consommation'));

    });
  }


  void _incrementCounter() {
    setState(() {
      save_refTime();
      save_data();
    });
  }

  @override
  void initState() {
    // TODO: implement initState


    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$consommation',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              '$currentTime',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              '$reftime_string',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}