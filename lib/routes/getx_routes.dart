import 'package:covid19_app/view/countries_list.dart';
// import 'package:covid19_app/view/detail_screen.dart';
import 'package:covid19_app/view/world_statistics.dart';
import 'package:get/get.dart';

class AppGetXRoutes {
  static const String worldStatistics = '/worldStatistics';
  static const String countriesList = '/countriesList';
  static const String detailScreen = '/detailScreen';

  static List<GetPage> getxRoutes = [
    GetPage(
      name: worldStatistics, // Use the defined constant
      page: () => WorldStatistics(),
    ),
    GetPage(
      name: countriesList, // Use the defined constant
      page: () => CountriesList(),
    ),
    // GetPage(
    //   name: detailScreen, // Use the defined constant
    //   page: () {
    //     // ????????????????
    //     final args =
    //         Get.arguments as Map<String, dynamic>? ?? {}; // Get arguments
    //     return DetailScreen(
    //       name: args['name'] ?? '',
    //       image: args['image'] ?? '',
    //       totalCases: args['totalCases'] ?? 0,
    //       totalDeaths: args['totalDeaths'] ?? 0,
    //       totalRecovered: args['totalRecovered'] ?? 0,
    //       active: args['active'] ?? 0,
    //       critical: args['critical'] ?? 0,
    //       todayRecovered: args['todayRecovered'] ?? 0,
    //       test: args['test'] ?? 0,
    //     );
    //   },
    // ),
    // 4th Route Here and SO ON
  ];
}
