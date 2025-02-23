import 'package:covid19_app/view/world_statistics.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  // Variables
  final String name, image;
  final int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;
  // Constructor
  const DetailScreen({
    super.key,
    required this.name,
    required this.image,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.test,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name.toUpperCase()),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .067,
                    right: 10,
                    left: 10),
                child: Card(
                  color: Colors.white60,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .04,
                      ),
                      ReUseAble(
                          title: 'Cases', value: widget.totalCases.toString()),
                      ReUseAble(
                          title: 'Active', value: widget.active.toString()),
                      ReUseAble(
                          title: 'Critical', value: widget.critical.toString()),
                      ReUseAble(title: 'Test', value: widget.test.toString()),
                      ReUseAble(
                          title: 'Total Recovered',
                          value: widget.totalRecovered.toString()),
                      ReUseAble(
                          title: 'Total Deaths',
                          value: widget.totalDeaths.toString()),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(widget.image),
              ),
            ],
          )
        ],
      ),
    );
  }
}
