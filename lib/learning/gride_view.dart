import 'package:flutter/material.dart';

class MyGridView extends StatelessWidget {
  var list_item = ['java', 'C++', 'Opp', 'kotlin', 'Flutter'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Grid View'),
          actions: [
            IconButton(
                icon: Icon(Icons.slideshow),
                onPressed: () {
                  print('Button is pressed');
                })
          ],
        ),
        body: GridView.count(
          crossAxisCount: 3,
          children: [
            ...list_item.map((e) {
              return Card(
                elevation: 10,
                child: Container(
                  width: 200,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Text(''),
                                color: Colors.green,
                              ),
                            ),
                            Card(
                              margin: EdgeInsets.all(13),
                              child: Icon(Icons.add),
                            ),
                          ],
                        ),
                        SizedBox(
                          child: Card(
                            margin: EdgeInsets.only(top: 10.0),

                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text('124' ,style: TextStyle(fontSize: 2),),
                          ),
                         width: double.infinity,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5.0),
                          child: Text(
                            e,
                            style: TextStyle(color: Colors.black45, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
