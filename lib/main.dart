import 'package:flutter/material.dart';

import 'listviewExample.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
    @override 
    Widget build(BuildContext buildContext) {
        return new MaterialApp(
            title: 'My App',
            home: new Scaffold(
                appBar: new AppBar(
                    title: new Text('ListView with Text and Image'),
                ),
                body: new ListViewExample(),
            ),
        );
    }
}