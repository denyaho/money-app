import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() => runApp(Analyze1());

//class Analysis extends StatelessWidget{
// @override
// Widget build(BuildContext context){
//   return MaterialApp(
//     home: AnalysisPage()
//   );}
//}
class Analyze1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: AnalysisPage1(),
      ),
    );}}

class AnalysisPage1 extends StatefulWidget{
  @override

  _AnalysisPage1State createState() => _AnalysisPage1State();
}

class _AnalysisPage1State extends State<AnalysisPage1>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text('Analyze your money'),
          centerTitle: true,
          bottom: TabBar(
              tabs: <Widget>[
                Tab(text: 'payment'),
                Tab(text: 'Balance'),
              ]
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Analyze(),
            AnalyzeSecond(),
          ],
        )
    );
  }
}



//class AnalysisPage extends StatefulWidget{
//  @override
//  _AnalysisPageState createState() => _AnalysisPageState();
//}

//class _AnalysisPageState extends State<AnalysisPage>{

//  List<Widget> _pages;
//  int _currentindes = 0;

//  @override
//  void initState(){
//    _pages = [
//      Analyze(),
//      AnalyzeSecond(),];
//    super.initState();}

//  @override
//  Widget build(BuildContext context){
//    return Scaffold(
//        body: _pages[_currentindes],
//        appBar: AppBar(
//          title: Text('Analyze your budget'),
//          centerTitle: true,
//        )
//    );
//  }
//}






class Analyze extends StatefulWidget{
  @override
  _AnalyzeState createState() => _AnalyzeState();
}

class _AnalyzeState extends State<Analyze> {

  List<MoneyData> _chartData;
  TooltipBehavior _tooltipBehavior;

  @override
  void initState(){
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();}

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        body: SfCircularChart(
          title: ChartTitle(text: 'your history of money flow'),
          legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
          tooltipBehavior: _tooltipBehavior,
          series: <CircularSeries>[
            PieSeries<MoneyData, String>(
                dataSource: _chartData,
                xValueMapper: (MoneyData data,_) => data.usage,
                yValueMapper: (MoneyData data,_) => data.money,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                enableTooltip: true
            )
          ],
        ),
      ),);
  }

  List<MoneyData> getChartData(){
    final List<MoneyData> chartData= [
      MoneyData('food', 5000),
      MoneyData('bill', 3000),
      MoneyData('education', 10000),
      MoneyData('clothes', 6000),
      MoneyData('study', 5000),];
    return chartData;}}

class MoneyData {
  MoneyData(this.usage,this.money);
  final String usage;
  final int money;
}



class AnalyzeSecond extends StatefulWidget{
  @override
  _AnalyzeSecondState createState() => _AnalyzeSecondState();
}

class _AnalyzeSecondState extends State<AnalyzeSecond> {

  List<MoneyData1> _chartData;
  TooltipBehavior _tooltipBehavior;

  @override
  void initState(){
    _chartData = getChartDataSecond();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();}

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        body: SfCircularChart(
          title: ChartTitle(text: 'your history of money flow'),
          legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
          tooltipBehavior: _tooltipBehavior,
          series: <CircularSeries>[
            PieSeries<MoneyData1, String>(
                dataSource: _chartData,
                xValueMapper: (MoneyData1 data,_) => data.usage,
                yValueMapper: (MoneyData1 data,_) => data.money,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                enableTooltip: true
            )
          ],
        ),
      ),);
  }

  List<MoneyData1> getChartDataSecond(){
    final List<MoneyData1> chartData= [
      MoneyData1('food', 5000),
      MoneyData1('bill', 3000),
      MoneyData1('education', 10000),
      MoneyData1('clothes', 6000),
      MoneyData1('study', 5000),];
    return chartData;}}

class MoneyData1{
  MoneyData1(this.usage,this.money);
  final String usage;
  final int money;
}