import 'package:flare_animation/smiley_controller.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'flare animation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({ Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _rating = 5.0;
  String _currentAnimation = '5+';
  final SmileyController _smileyController = SmileyController();

  void _onChanged(double value) {
    if (_rating == value) return;

    setState(() {
      var direction = _rating < value ? '+' : '-';
      _rating = value;
      _currentAnimation = '${value.round()}$direction';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 300,
                width: 300,
                child: FlareActor(
                  'assets/happiness_emoji.flr',
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  controller: _smileyController,
                  animation: _currentAnimation,
                ),
              ),
              Slider(
                value: _rating,
                min: 1,
                max: 5,
                divisions: 4,
                onChanged: _onChanged,
                thumbColor: Colors.white,
              ),
              Text(
                '$_rating',
                style: const TextStyle(color: Colors.white,fontSize: 22),
              ),
            ],
          ),
        ),
      ),
    );
  }
}