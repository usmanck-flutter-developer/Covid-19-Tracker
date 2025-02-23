import 'package:covid19_app/Services/statistics_service.dart';
import 'package:covid19_app/view/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StatisticsService statisticsService = StatisticsService();
    return Scaffold(
      // backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text('C O V I D - 1 9'),
        // Below Line is Used for
        // DISPLAY or HIDE BACK ARROW in AppBar
        // automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
          child: Column(
            children: [
              TextFormField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {});
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    hintText: 'Search Country Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
              SizedBox(height: 5),
              // Call API Data here
              Expanded(
                  child: Card(
                color: Colors.white60,
                child: FutureBuilder(
                  future: statisticsService.countriesListApi(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey.shade700,
                            highlightColor: Colors.grey.shade100,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Container(
                                    height: 12,
                                    width: double.infinity,
                                    color: Colors.white,
                                  ),
                                  subtitle: Container(
                                    height: 10,
                                    width: double.infinity,
                                    color: Colors.white,
                                  ),
                                  leading: Container(
                                    height: 50,
                                    width: 50,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          // Variable
                          String name = snapshot.data![index]['country'];
                          // Condition
                          if (searchController.text.isEmpty) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailScreen(
                                              name: snapshot.data![index]
                                                  ['country'],
                                              image: snapshot.data![index]
                                                  ['countryInfo']['flag'],
                                              totalCases: snapshot.data![index]
                                                  ['cases'],
                                              totalDeaths: snapshot.data![index]
                                                  ['deaths'],
                                              totalRecovered: snapshot.data![index]
                                                  ['recovered'],
                                              active: snapshot.data![index]
                                                  ['active'],
                                              critical: snapshot.data![index]
                                                  ['critical'],
                                              todayRecovered:
                                                  snapshot.data![index]
                                                      ['todayRecovered'],
                                              test: snapshot.data![index]
                                                  ['tests']),
                                        ));
                                  },
                                  child: ListTile(
                                    title:
                                        Text(snapshot.data![index]['country']),
                                    subtitle: Text(snapshot.data![index]
                                            ['cases']
                                        .toString()),
                                    leading: Image(
                                        height: 50,
                                        width: 50,
                                        image: NetworkImage(
                                            snapshot.data![index]['countryInfo']
                                                ['flag'])),
                                  ),
                                ),
                              ],
                            );
                          } else if (name
                              .toLowerCase()
                              .contains(searchController.text.toLowerCase())) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailScreen(
                                              name: snapshot.data![index]
                                                  ['country'],
                                              image: snapshot.data![index]
                                                  ['countryInfo']['flag'],
                                              totalCases: snapshot.data![index]
                                                  ['cases'],
                                              totalDeaths: snapshot.data![index]
                                                  ['deaths'],
                                              totalRecovered: snapshot.data![index]
                                                  ['recovered'],
                                              active: snapshot.data![index]
                                                  ['active'],
                                              critical: snapshot.data![index]
                                                  ['critical'],
                                              todayRecovered:
                                                  snapshot.data![index]
                                                      ['todayRecovered'],
                                              test: snapshot.data![index]
                                                  ['tests']),
                                        ));
                                  },
                                  child: ListTile(
                                    title:
                                        Text(snapshot.data![index]['country']),
                                    subtitle: Text(snapshot.data![index]
                                            ['cases']
                                        .toString()),
                                    leading: Image(
                                        height: 50,
                                        width: 50,
                                        image: NetworkImage(
                                            snapshot.data![index]['countryInfo']
                                                ['flag'])),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Container();
                          }
                        },
                      );
                    }
                  },
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
