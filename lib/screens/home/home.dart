import 'package:dart/screens/about/about.dart';
import 'package:dart/screens/authentication/login.dart';
import 'package:dart/screens/gratitude/gratitude.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String _howAreYou = 'Hello';
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator'),
        actions: <Widget>[
          IconButton(
              onPressed: () =>
                  _openPageAbout(context: context, fullscreenDialog: true),
              icon: Icon(Icons.info_outline)),
        ],
      ),
      backgroundColor: Colors.yellow,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Grateful for $_howAreYou',
              style: TextStyle(fontSize: 32.0),
            )),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _openPageGratitude(context: context),
          tooltip: 'About',
          child: Icon(Icons.sentiment_dissatisfied)),
    );
  }
}

void _openPageAbout(
    {required BuildContext context, bool fullscreenDialog = false}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      fullscreenDialog: fullscreenDialog,
      builder: (context) => const About(),
    ),
  );
}

void _openPageGratitude(
    {required BuildContext context, bool fullscreenDialo = false}) async {
  final String _gratitude = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Gratitude(
        key: UniqueKey(),
        radioGroupValue: -1,
      ),
    ),
  );
}
