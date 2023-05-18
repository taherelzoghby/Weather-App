import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_ap/constants.dart';
import 'package:weather_ap/controllers/weatherControl.dart';
import 'package:weather_ap/views/screens/forcast_15_Page.dart';
import 'package:weather_ap/views/screens/searchPage.dart';
import 'package:weather_ap/views/widgets/button.dart';
import 'package:weather_ap/views/widgets/maxTile.dart';
import 'package:weather_ap/views/widgets/minTile.dart';
import 'package:weather_ap/views/widgets/rowInfo.dart';
import 'package:weather_ap/views/widgets/temp_condition.dart';

class weatherView extends StatelessWidget {
  const weatherView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var watchData = context.watch<controlWeather>();
    return FutureBuilder(
        future: watchData.weatherService.getWeather(context: context),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Center(child: CircularProgressIndicator())
              : NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        pinned: true,
                        backgroundColor: watchData.weather[0]!.getColor(),
                        //temp
                        flexibleSpace: Padding(
                          padding: EdgeInsets.only(top: height * .14),
                          child: temp_condition(
                            height: height,
                            width: width,
                            condition: watchData.weather[0]!.conditions,
                            temp: watchData.weather[0]!.temp,
                            tempmax: watchData.weather[0]!.tempmax,
                            tempmin: watchData.weather[0]!.tempmin,
                            icon: watchData.weather[0]!.getIcon(),
                          ),
                        ),
                        leading: IconButton(
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const searchPage(),
                            ),
                          ),
                          icon: const Icon(Icons.search, color: textColor),
                        ),
                        title: Column(
                          children: [
                            Text(
                              watchData.city!,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: textColor,
                              ),
                            ),
                            Text(
                              watchData.weatherService.timeZone!,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: textColor,
                              ),
                            ),
                          ],
                        ),
                        centerTitle: true,
                        expandedHeight: height * .45,
                      ),
                    ];
                  },
                  body: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          watchData.weather[0]!.getColor(),
                          watchData.weather[0]!.getColor().withOpacity(.2),
                        ],
                      ),
                    ),
                    child: ListView(
                      children: [
                        //button 15 day forcast
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: height * .15,
                            horizontal: width * .07,
                          ),
                          child: button(
                            label: "15-day forecast",
                            function: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const forcast_15_Page(),
                              ),
                            ),
                          ),
                        ),
                        //more information
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    minTile(
                                      height: height,
                                      column: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          rowInfo(
                                            label: 'windspeed',
                                            value:
                                                '${watchData.weather[0]!.windspeed}',
                                          ),
                                          rowInfo(
                                            label: 'winddir',
                                            value:
                                                '${watchData.weather[0]!.winddir}',
                                          ),
                                        ],
                                      ),
                                    ),
                                    minTile(
                                      height: height,
                                      column: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          rowInfo(
                                            label: 'Sunrise',
                                            value:
                                                watchData.weather[0]!.sunrise,
                                          ),
                                          rowInfo(
                                            label: 'Sunset',
                                            value: watchData.weather[0]!.sunset,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //SizedBox(height: width * .07),
                              Expanded(
                                child: maxTile(
                                  height: height,
                                  column: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      rowInfo(
                                        label: 'Humidity',
                                        value:
                                            '${watchData.weather[0]!.humidity}',
                                      ),
                                      rowInfo(
                                        label: 'Real feel',
                                        value:
                                            '${watchData.weather[0]!.feelslike}',
                                      ),
                                      rowInfo(
                                        label: 'UV',
                                        value:
                                            '${watchData.weather[0]!.uvindex}',
                                      ),
                                      rowInfo(
                                        label: 'pressure',
                                        value:
                                            '${watchData.weather[0]!.pressure}',
                                      ),
                                      rowInfo(
                                        label: 'visibility',
                                        value:
                                            '${watchData.weather[0]!.visibility}',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: height * .1),
                      ],
                    ),
                  ),
                );
        });
  }
}
