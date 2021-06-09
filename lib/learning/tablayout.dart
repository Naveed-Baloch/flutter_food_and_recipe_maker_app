import 'package:flutter/material.dart';
import 'tab1.dart';
import 'tab2.dart';

class TabDemo extends StatefulWidget {
  @override
  _TabDemoState createState() => _TabDemoState();
}

class _TabDemoState extends State<TabDemo> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('WhatsApp'),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.chat),
                  text: 'Chats',
                ),
                Tab(icon: Icon(Icons.call), text: 'Calls')
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Tab1(),
              Tab2(),
            ],
          ),
        ));
  }
}
