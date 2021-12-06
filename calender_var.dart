import 'package:table_calendar/table_calendar.dart';
import 'dart:collection';
import 'package:money_app/history_budget.dart';

class Event {
  Event(this.title);
  final String title;

}



//final _kEventSource = Map.fromIterable(List.generate(50,(index)=>index),
//    key: (item) => DateTime.utc(kFirstday.year,kFirstday.month,item*5),
//    value: (item) => List.generate(
//        item%4+1,(index)=>Event('Event $item | ${index+1}')
//   ))..addAll({
//  kToday: [Event('Today\'s Event1'),
//    Event('Today\'s Event2')],});



List<DateTime> daysInRange(DateTime first, DateTime last){
  final dayCount= last.difference(first).inDays +1;
  return List.generate(
    dayCount,
        (index) => DateTime.utc(first.year, first.month,first.day + index),
  );
}
int getHashCode(DateTime key){
  return key.day*1000000 + key.month*10000+key.year;}


final kToday = DateTime.now();
final kFirstday=DateTime(kToday.year, kToday.month-3,kToday.day);
final KLastDay=DateTime(kToday.year,kToday.month+3,kToday.day);