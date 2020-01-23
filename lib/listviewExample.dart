import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:listviewtextimage/flower.dart';
import 'data.dart';

class ListViewExample extends StatefulWidget {
    @override 
    State<StatefulWidget> createState() {
        return new ListViewExampleState();
    }
}

class ListViewExampleState extends State<ListViewExample> {
    var selectedFlower = new Flower();

    List<GestureDetector> _buildListItemsFromFlowers() {
        var index = 0;
        List<GestureDetector> listItems = flowers.map((flower) {
            var color = index % 2 == 0 ? Colors.white : Colors.green;
            if (flower == selectedFlower) {
                color = Colors.orange;
            }
            final item = new Container(
                decoration: new BoxDecoration(
                    color: color
                ),
                child: new Row(
                    children: <Widget>[
                        new Container(
                            margin: new EdgeInsets.all(10.0),
                            child: new CachedNetworkImage(
                                placeholder: (context, index) => new CircularProgressIndicator(),
                                imageUrl: flower.imageURL,
                                fit: BoxFit.cover,
                                width: 100,
                                height: 100,
                            ),
                        ),
                        new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                                new Container(
                                    padding: const EdgeInsets.only(bottom: 10.0),
                                    child: new Text(
                                        flower.flowerName,
                                        style: new TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black
                                        ),
                                    ),
                                ),
                                new Container(
                                    child: new Text(
                                        flower.description,
                                        style: new TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black
                                        ),
                                    ),
                                )
                            ],
                        )
                    ],
                ),
            );
            index = index + 1;
            final gestureDetector = new GestureDetector(
                child: item,
                onTap: () {
                    setState(() {
                        this.selectedFlower = flower;
                    });
                },
            );
            return gestureDetector;
        }).toList();

        return listItems;
    }

    @override 
    Widget build(BuildContext buildContext) {
        print(_buildListItemsFromFlowers());
        return new ListView(
            children: _buildListItemsFromFlowers(),
        );
    }
}