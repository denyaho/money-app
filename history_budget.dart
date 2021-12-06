import 'dart:core';
import 'dart:collection';
import 'package:money_app/myhomepage.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:money_app/calender_var.dart';

class History extends StatefulWidget{
  @override

  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History>{
  ValueNotifier<List<Widget>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay;
  Map<DateTime, List> _eventList={};


//  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;


  @override
  void initState(){
    super.initState();

    _selectedDay = _focusedDay;
    //   _selectedEvents = ValueNotifier(_getEventsForday(_selectedDay));
    _eventList={
      DateTime.now().add(Duration(days: 11)):
      ['Event aa','Event bb'],
    };
  }


//  @override
//  void dispose(){
//    _selectedEvents.dispose();
//    super.dispose();
//  }



//  List<Widget> _getEventsForRange(DateTime start,DateTime end){
//    final days = daysInRange(start,end);
//    return[
//      for (final d in days) ..._getEventsForday(d),
//    ];
//  }

  @override
  Widget build(BuildContext context){

    final kEvents = LinkedHashMap<DateTime, List>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(_eventList);

    List _getEventsForday(DateTime day){
      return kEvents[day] ?? [];
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 20.0,
        title: Text('History'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          TableCalendar(
            firstDay: DateTime.utc(2010,1,1),
            lastDay: DateTime.utc(2030,1,1),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day){
              return isSameDay(_selectedDay, day);
            },
//            rangeStartDay: _rangeStart,
//            rangeEndDay: _rangeEnd,
            onDaySelected: (selectedDay, focusedDay){
              if(!isSameDay(_selectedDay, selectedDay)){
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
                _getEventsForday(selectedDay);
              }
            },
//            onRangeSelected: (DateTime start,DateTime end,DateTime focusedDay){
//              setState(() {
//                _selectedDay = null;
//                _focusedDay=focusedDay;
//                _rangeStart=start;
//                _rangeEnd=end;
//                _rangeSelectionMode=RangeSelectionMode.toggledOn;
//              });
//              if (start != null && end !=null){
//                _selectedEvents.value = _getEventsForRange(start,end);
//              } else if(start != null){
//                _selectedEvents.value = _getEventsForday(start);
//              } else if (end != null){
//                _selectedEvents.value = _getEventsForday(end);
            //             }
            //           },
            onFormatChanged: (format){
              if(_calendarFormat != format){
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            eventLoader: (day){
              return _getEventsForday(day);
            },
            onPageChanged: (focusedDay){
              _focusedDay = focusedDay;
            },),
          ListView(
            shrinkWrap: true,
            children: _getEventsForday(_selectedDay).map((event)=>ListTile(
              title:Text(event.toString()),
            ),
            ).toList(),
          ),
        ],
      ),
    );
  }
}
