import 'package:covid19_app/Model/world_statistics_model.dart';
import 'package:covid19_app/Services/statistics_service.dart';
import 'package:covid19_app/view/countries_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatistics extends StatefulWidget {
  const WorldStatistics({super.key});

  @override
  State<WorldStatistics> createState() => _WorldStatisticsState();
}

class _WorldStatisticsState extends State<WorldStatistics>
    with TickerProviderStateMixin {
  //
  late final AnimationController _controller =
      AnimationController(duration: Duration(seconds: 3), vsync: this)
        ..repeat();
  //
  @override
  void dispose() {
    _controller.dispose(); // Dispose of controller to prevent memory leaks
    super.dispose();
  }

  //
  final colorList = [
    Colors.blue,
    Colors.green,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    StatisticsService statisticsService = StatisticsService();
    return Scaffold(
      appBar: AppBar(
        title: Text('C O V I D - 1 9'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .02),
            // Call API Here
            FutureBuilder(
              future: statisticsService.fetchWorldStats(),
              builder: (context, AsyncSnapshot<WorldStatisticsModel> snapshot) {
                if (!snapshot.hasData) {
                  return Expanded(
                      flex: 1,
                      child: SpinKitFadingCircle(
                        size: 50,
                        color: Colors.deepPurple,
                        controller: _controller,
                        duration: Duration(microseconds: 1300),
                      ));
                } else {
                  return Column(
                    children: [
                      PieChart(
                        animationDuration: Duration(milliseconds: 1500),
                        colorList: colorList,
                        dataMap: {
                          'Cases':
                              double.parse(snapshot.data!.cases.toString()),
                          'Recovered':
                              double.parse(snapshot.data!.recovered.toString()),
                          'Death':
                              double.parse(snapshot.data!.deaths.toString())
                        },
                        chartValuesOptions: ChartValuesOptions(
                            showChartValuesInPercentage: true),
                        legendOptions:
                            LegendOptions(legendPosition: LegendPosition.left),
                        chartType: ChartType.ring,
                        chartRadius: 140,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * .02),
                        child: Card(
                          color: Colors.white60,
                          child: Column(
                            children: [
                              ReUseAble(
                                title: 'Cases',
                                value: snapshot.data!.cases.toString(),
                              ),
                              ReUseAble(
                                title: 'Recovered',
                                value: snapshot.data!.recovered.toString(),
                              ),
                              ReUseAble(
                                title: 'Death',
                                value: snapshot.data!.deaths.toString(),
                              ),
                              // ReUseAble(
                              //   title: 'Affected Countries',
                              //   value:
                              //       snapshot.data!.affectedCountries.toString(),
                              // ),
                              // ReUseAble(
                              //   title: 'Tests',
                              //   value: snapshot.data!.tests.toString(),
                              // ),
                              // ReUseAble(
                              //   title: 'Active',
                              //   value: snapshot.data!.active.toString(),
                              // ),
                              // ReUseAble(
                              //   title: 'Today Recovered',
                              //   value: snapshot.data!.todayRecovered.toString(),
                              // ),
                              // ReUseAble(
                              //   title: 'Today Died',
                              //   value: snapshot.data!.todayDeaths.toString(),
                              // ),
                              // ReUseAble(
                              //   title: 'Today Cases',
                              //   value: snapshot.data!.todayCases.toString(),
                              // ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // "Use Get.to()" to get go Forward and Backward
                          Get.to(CountriesList());
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Track Countries',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
            // API Call Ends Here
          ],
        ),
      )),
    );
  }
}

// Component
class ReUseAble extends StatelessWidget {
  final String title, value;
  const ReUseAble({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          SizedBox(height: 5),
          Divider(),
        ],
      ),
    );
  }
}
