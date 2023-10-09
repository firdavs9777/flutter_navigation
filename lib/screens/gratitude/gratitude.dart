import 'package:flutter/material.dart';

class Gratitude extends StatefulWidget {
  final int radioGroupValue;
  Gratitude({required Key key, required this.radioGroupValue})
      : super(key: key);

  @override
  State<Gratitude> createState() => _GratitudeState();
}

class _GratitudeState extends State<Gratitude> {
  List<String> _gratitudeList = [];
  String _selectedGratitude = '';
  int _radioGroupValue = 0;
  void radioOnChanged(int index) {
    setState(() {
      _radioGroupValue = index;
      _selectedGratitude = _gratitudeList[index];
      print('_selectedRadioValue $_selectedGratitude');
    });
  }

  @override
  void initState() {
    super.initState();
    _gratitudeList
      ..add('Family')
      ..add('Friends')
      ..add('Coffee');
    _radioGroupValue = widget.radioGroupValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Gratitude'), actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.pop(context, _selectedGratitude),
            icon: Icon(Icons.check),
          ),
        ]),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Radio(
                    value: 0,
                    groupValue: _radioGroupValue,
                    onChanged: (index) => radioOnChanged(index ?? 0),
                  ),
                  Text('Family'),
                  Radio(
                    value: 1,
                    groupValue: _radioGroupValue,
                    onChanged: (index) => radioOnChanged(index ?? 0),
                  ),
                  Text('Friends'),
                  Radio(
                    value: 2,
                    groupValue: _radioGroupValue,
                    onChanged: (index) => radioOnChanged(index ?? 0),
                  ),
                  Text('Coffee'),
                ],
              )),
        ));
  }
}
