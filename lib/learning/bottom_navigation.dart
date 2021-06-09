import 'package:flutter/material.dart';
import 'tab1.dart';
import 'tab2.dart';

class BottomNavigationDemo extends StatefulWidget {
  @override
  _BottomNavigationDemoState createState() => _BottomNavigationDemoState();
}

class _BottomNavigationDemoState extends State<BottomNavigationDemo> {
  int selectedindex = 0;

  List<Map<String, Object>> _combin_list = [
    {'page': Tab1(), 'title': 'Tab 1'},
    {'page': Tab2(), 'title': 'Tab2'}
  ];
  List<Widget> widget_list = [
    IconButton(icon: Icon(Icons.call), color: Colors.white, onPressed: () {}),
    IconButton(icon: Icon(Icons.chat), color: Colors.white, onPressed: () {}),
  ];

  // List<Map<String,Object>> _combine_list=[];
  void _selectPage(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_combin_list[selectedindex]['title']),
        actions: [
          widget_list[selectedindex],
        ],
      ),
      body: _combin_list[selectedindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.call), title: Text('Calls')),
          BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('Chats'))
        ],
        onTap: _selectPage,
        currentIndex: selectedindex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.orange,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
