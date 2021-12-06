
import 'package:flutter/material.dart';
import 'myhomepage.dart';
import 'history_budget.dart';
import 'analyze_else.dart';
import 'calculator_budget.dart';

//void main() => runApp(HouseExpense());
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: HouseExpense(),
    );
  }
}

class HouseExpense extends StatefulWidget {
  @override
  _HouseExpenseState createState() => _HouseExpenseState();}

class _HouseExpenseState extends State<HouseExpense>{
  List<Widget> _pages;
  int _currentindex = 0;

  @override
  void initState(){
    _pages = [
      MyHomepage(),
//      Balance(),
      Calculator(),
      History(),
      Analyze1(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text('Home'),
      //     centerTitle: true),
      //   drawer: Drawer(
      //       child: ListView(
      //           children: <Widget>[
      //             DrawerHeader(
      //               child: Text('username'),),
      //             ListTile(
      //                 title: Text('Notice')),
      //             ListTile(
      //               title: Text('Budget'),),
      //             ListTile(
      //               title: Text('Life Plan'),),
      //             ListTile(
      //                 title: Text('Convenience Book')
      //             )
      //           ]
      //       )
      //   ),
      body: _pages[_currentindex],
      bottomNavigationBar:
      BottomNavigationBar(

        currentIndex: _currentindex,
        onTap: (index){
          setState((){
            _currentindex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.home),
              label: 'Home',
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.account_balance_sharp),
              label: 'Balance',
              backgroundColor: Colors.grey
          ),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.app_registration_rounded),
              label: 'Enter',
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.article_rounded),
              label: 'History',
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.beenhere_outlined),
              label: 'Analyze',
              backgroundColor: Colors.grey),
        ],
        type:
        BottomNavigationBarType.fixed,
        unselectedItemColor:
        Theme.of(context).disabledColor,
        selectedItemColor:
        Theme.of(context).accentColor,
      ),
    );
  }}