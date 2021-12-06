import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'header.dart';


class MyHomepage extends StatefulWidget {
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage>{

  PageController controller;
  TextEditingController _controller1;

  @override
  void initState(){
    controller = PageController();
    _controller1 = TextEditingController();
    super.initState();
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
            title: Text('Home'),
            centerTitle: true),
        drawer: Drawer(
            child: ListView(
                children: <Widget>[
                  DrawerHeader(
                    child: Text('username'),),
                  ListTile(
                      title: Text('Notice')),
                  ListTile(
                    title: Text('Budget'),),
                  ListTile(
                    title: Text('Life Plan'),),
                  ListTile(
                      title: Text('Convenience Book'))])),
        body: ListView(
            children: <Widget>[
              page1(),
              page2(),
              page3(),
              page4(),
//              page5(),
            ]
        )
    );}
  Widget page1() {
    return Container(
        margin: EdgeInsets.all(10.0),
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
            children:<Widget>[
              Text('目標貯金金額'),
              SingleChildScrollView(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Your Goal',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black
                        ),
                      ),
                    ),
                    controller: _controller1,
                    onSubmitted: (String value) async{
                      await showDialog <void> (
                          context: context,
                          builder: (BuildContext context){
                            return AlertDialog(
                              title: Text('Thanks!'),
                              content: Text('You typed "$value",which has length ${value.characters.length}.'),
                              actions: <Widget>[
                                ElevatedButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'))
                              ],
                            );
                          });
                    },)),

            ]
        ));
  }
  Widget page2() {
    return Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        height: 100,
        child: Column(
            children:<Widget>[
              Text('給料日'),
              SingleChildScrollView(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'When',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black
                        ),
                      ),
                    ),
                    controller: _controller1,
                    onSubmitted: (String value) async{
                      await showDialog <void> (
                          context: context,
                          builder: (BuildContext context){
                            return AlertDialog(
                              title: Text('Thanks!'),
                              content: Text('You typed "$value",which has length ${value.characters.length}.'),
                              actions: <Widget>[
                                ElevatedButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'))
                              ],
                            );
                          });
                    },)),

            ]
        )
    );
  }
  Widget page3(){
    return Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        height: 100,
        child: Column(
            children:<Widget>[
              Text('月の支出'),
              SingleChildScrollView(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'How much',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black
                        ),
                      ),
                    ),
                    controller: _controller1,
                    onSubmitted: (String value) async{
                      await showDialog <void> (
                          context: context,
                          builder: (BuildContext context){
                            return AlertDialog(
                              title: Text('Thanks!'),
                              content: Text('You typed "$value",which has length ${value.characters.length}.'),
                              actions: <Widget>[
                                ElevatedButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'))
                              ],
                            );
                          });
                    },)),

            ]
        )
    );
  }
  Widget page4(){
    return Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        height: 100,
        child: Column(
            children:<Widget>[
              Text('お金を貯めて買いたい物'),
              SingleChildScrollView(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'desire',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black
                        ),
                      ),
                    ),
                    controller: _controller1,
                    onSubmitted: (String value) async{
                      await showDialog <void> (
                          context: context,
                          builder: (BuildContext context){
                            return AlertDialog(
                              title: Text('Thanks!'),
                              content: Text('You typed "$value",which has length ${value.characters.length}.'),
                              actions: <Widget>[
                                ElevatedButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'))
                              ],
                            );
                          });
                    },)),

            ]
        )
    );
  }
//  Widget page5() {
//    return Container(
//          margin: EdgeInsets.all(10.0),
//          decoration: BoxDecoration(
//            color: Colors.white,
//            borderRadius: BorderRadius.circular(10.0),
//          ),
//          height: 100,
//          child: Text('spending pace'),
//    );
//  }
}